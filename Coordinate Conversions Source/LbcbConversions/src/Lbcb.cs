using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public enum ActuatorLabels { X1, X2, Y1, Z1, Z2, Z3};
    public enum DofDispLabels { Dx, Dy, Dz, Rx, Ry, Rz};
    public enum DofForceLbels { Fx, Fy, Fz, Mx, My, Mz };
    public class Lbcb
    {
        private LbcbActuator[] actuators = new LbcbActuator[6];
        private DenseVector actuatorDisp = new DenseVector(6);
        private DenseVector actuatorForce = new DenseVector(6);
        private DenseVector cartesianDisp = new DenseVector(6);
        private DenseVector cartesianForce = new DenseVector(6);
        public void setActuatorDisp(double [] adisp)
        {

        }
        public double [] getActuatorDisp()
        {
            return actuatorDisp.ToArray();
        }
        public void setActuatorForce(double [] aforce)
        {
            actuatorForce.SetValues(aforce);
            actuatorForce2Cartesian();
        }
        public void setCartesianDisp(double[] cdisp)
        {

        }
        public double[] getCartesianDisp()
        {
            return cartesianDisp.ToArray();
        }
        private void actuatorForce2Cartesian() {
            DenseVector force = new DenseVector(3);
            DenseVector moment = new DenseVector(3);
            DenseVector translation = new DenseVector(3);
            cartesianDisp.CopySubVectorTo(translation, 0, 0, 3);

            for (int a = 0; a < 6; a++)
            {
                DenseVector unitVector = (DenseVector)actuators[a].getDirectionalVector();
                unitVector = (DenseVector) unitVector.Normalize(2.0);
                DenseVector forceArm = actuators[a].getForceArm(translation);
                DenseVector newForce = (DenseVector) unitVector.Multiply(actuatorForce[a]);
                force = (DenseVector) force.Add(newForce);
                DenseVectorCrossProduct cx = new DenseVectorCrossProduct(forceArm);
                DenseVector newMoment = (DenseVector)cx.crossProduct(unitVector);
                newMoment = (DenseVector) newMoment.Multiply(actuatorForce[a]);
                moment = (DenseVector) moment.Add(newMoment);
            }
            cartesianForce.SetSubVector(0, 3, force);
            cartesianForce.SetSubVector(3, 3, moment);
        }
        private void solveActuator2CartesianDisp()
        {
            bool check = false;
            DenseVector cartesiandisp = new DenseVector(6);
            cartesianDisp.CopyTo(cartesiandisp);

            while (check == false)
            {
                DenseMatrix JacobianMatrix = new DenseMatrix(6, 6);

                for (int i = 0; i < 6; i++)
                {
                    DenseVector DL_Dd = actuators[i].calcNewDiffs(cartesiandisp.Values);
                    JacobianMatrix.SetRow(i, DL_Dd);
                }

                //JacobianMatrix.LinearSolver(error, D_cartesian);

                //cartesiandisp = cartesiandisp + D_cartesian;
                //Cartesian2Actuator(cartesiandisp, dummy1, temp_stroke, dummy2);
                //error = actuatorstroke - temp_stroke;

                //for (int j = 1; j <= 6; j++)
                //{
                //    if (fabs(error(j)) > fabs(limitation(j))) { temp_check(j) = 1; }
                //    else { temp_check(j) = 0; }
                //}

                //if (temp_check(1) == 1 || temp_check(2) == 1 || temp_check(3) == 1 || temp_check(4) == 1 || temp_check(5) == 1 || temp_check(6) == 1)
                //{ check = false; }
                //else { check = true; }

                //num_iteration++;
                //if (num_iteration > 10) { check = true; }

            }

        }
    }
}
