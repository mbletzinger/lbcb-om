using log4net;
using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public enum ActuatorLabels { X1, X2, Y1, Z1, Z2, Z3 };
    public enum DofDispLabels { Dx, Dy, Dz, Rx, Ry, Rz };
    public enum DofForceLbels { Fx, Fy, Fz, Mx, My, Mz };
    public class Lbcb
    {
        private LbcbActuator[] actuators = new LbcbActuator[6];
        private DenseVector actuatorDisp = new DenseVector(6);
        private DenseVector actuatorForce = new DenseVector(6);
        private DenseVector cartesianDisp = new DenseVector(6);
        private DenseVector cartesianForce = new DenseVector(6);
        private DenseVector errorWindow = DenseVector.Create(6, 0.00001);
        private string label;
        private readonly static ILog log = LogManager.GetLogger(typeof(Lbcb));
        public Lbcb(String label, double[][] actPins)
        {
            for (int aps = 0; aps < 6; aps++)
            {
                LbcbActuator act = new LbcbActuator(((ActuatorLabels)aps).ToString(), actPins[aps]);
                actuators[aps] = act;
            }
            this.label = label;
        }
        public void setActuatorDisp(double[] adisp)
        {
            solveActuator2CartesianDisp(adisp);
        }
        public double[] getActuatorDisp()
        {
            return actuatorDisp.ToArray();
        }
        public void setActuatorForce(double[] aforce)
        {
            actuatorForce.SetValues(aforce);
            actuatorForce2Cartesian();
        }
        public double[] getActuatorForce()
        {
            return actuatorForce.Values;
        }
        public double[] getCartesianForce()
        {
            return cartesianForce.Values;
        }
        public void setCartesianDisp(double[] cdisp)
        {
            cartesianDisp.SetValues(cdisp);
            cartesionDisplacement2Actuators();
            actuators2ActuatorDisp();
        }
        public double[] getCartesianDisp()
        {
            return cartesianDisp.ToArray();
        }
        private void actuatorForce2Cartesian()
        {
            DenseVector force = new DenseVector(3);
            DenseVector moment = new DenseVector(3);
            DenseVector translation = new DenseVector(3);
            cartesianDisp.CopySubVectorTo(translation, 0, 0, 3);

            for (int a = 0; a < 6; a++)
            {
                DenseVector unitVector = (DenseVector)actuators[a].getDirectionalVector();
                unitVector = (DenseVector)unitVector.Normalize(2.0);
                DenseVector forceArm = actuators[a].getForceArm(translation);
                DenseVector newForce = (DenseVector)unitVector.Multiply(actuatorForce[a]);
                force = (DenseVector)force.Add(newForce);
                DenseVectorCrossProduct cx = new DenseVectorCrossProduct(forceArm);
                DenseVector newMoment = (DenseVector)cx.crossProduct(unitVector);
                newMoment = (DenseVector)newMoment.Multiply(actuatorForce[a]);
                moment = (DenseVector)moment.Add(newMoment);
            }
            cartesianForce.SetSubVector(0, 3, force);
            cartesianForce.SetSubVector(3, 3, moment);
        }
        private void cartesionDisplacement2Actuators()
        {
            foreach (LbcbActuator a in actuators)
            {
                a.update(cartesianDisp.Values);
            }
        }
        private void actuators2ActuatorDisp()
        {
            for (int a = 0; a < 6; a++)
            {
                actuatorDisp[a] = actuators[a].getCurrentDisplacement();
            }

        }
        private void solveActuator2CartesianDisp(double[] adisp)
        {
            bool check = false;
            DenseVector cartDisp = new DenseVector(6);
            DenseVector newAct = new DenseVector(adisp);
            DenseVector actError = (DenseVector)newAct.Subtract(actuatorDisp);
            cartesianDisp.CopyTo(cartDisp);
            int iterations = 0;

            while (check == false)
            {
                List2String l2s = new List2String();

                DenseMatrix JacobianMatrix = new DenseMatrix(6, 6);

                for (int i = 0; i < 6; i++)
                {
                    DenseVector DL_Dd = actuators[i].calcNewDiffs(cartDisp.Values);
                    JacobianMatrix.SetRow(i, DL_Dd);
                }
                DenseVector diffCart = (DenseVector)JacobianMatrix.LU().Solve(actError);
                log.Debug("Cartesian differences " + l2s.ToString(diffCart.Values));
                cartDisp = (DenseVector)cartDisp.Add(diffCart);
                setCartesianDisp(cartDisp.Values);
                log.Debug("New cartesian estimate " + this);
                actError = (DenseVector)newAct.Subtract(actuatorDisp);
                log.Debug("Actuator error " + l2s.ToString(actError.Values));

                check = withinErrorWindow(actError);
                if (iterations > 20)
                {
                    check = true;
                    log.Error("Calculations for " + label + " won't converge with " + this);
                }
                iterations++;
            }

        }
        private Boolean withinErrorWindow(DenseVector error)
        {
            for (int d = 0; d < 6; d++)
            {
                if (Math.Abs(error[d]) > errorWindow[d])
                {
                    return false;
                }
            }
            return true;
        }
        public override string ToString()
        {
            List2String l2s = new List2String();
            string result = label + ":";
            result += "\nCartD: " + l2s.ToString(cartesianDisp.Values);
            result += "\nCartF: " + l2s.ToString(cartesianForce.Values);
            result += "\nActD: " + l2s.ToString(actuatorDisp.Values);
            result += "\nActF: " + l2s.ToString(actuatorForce.Values);
            foreach (LbcbActuator act in actuators)
            {
                result += "\n" + act;
            }
            return result;
        }
    }
}
