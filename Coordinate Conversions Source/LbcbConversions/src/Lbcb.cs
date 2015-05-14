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
    public class Lbcb : TransducerSpace
    {
        private DenseVector actuatorForce = new DenseVector(6);
        private DenseVector cartesianForce = new DenseVector(6);
        private readonly static ILog log = LogManager.GetLogger(typeof(Lbcb));

        public Lbcb(String label, double[][] actPins, double [] errorWindow)
            : base(label, actPins, Enum.GetNames(typeof(ActuatorLabels)),errorWindow)
        {
        }
        public void setActuatorDisp(double[] adisp)
        {
            setTransducerDisp(adisp);
        }
        public double[] getActuatorDisp()
        {
            return getTransducerDisp();
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
        private void actuatorForce2Cartesian()
        {
            DenseVector force = new DenseVector(3);
            DenseVector moment = new DenseVector(3);
            DenseVector translation = new DenseVector(3);
            cartesianDisp.CopySubVectorTo(translation, 0, 0, 3);

            for (int a = 0; a < 6; a++)
            {
                DenseVector unitVector = (DenseVector)transducers[a].getDirectionalVector();
                unitVector = (DenseVector)unitVector.Normalize(2.0);
                DenseVector forceArm = transducers[a].getForceArm(translation);
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
        public override string ToString()
        {
            List2String l2s = new List2String();
            string result = getLabel() + ":";
            result += "\nCartD: " + l2s.ToString(getCartesianDisp());
            result += "\nCartF: " + l2s.ToString(cartesianForce.Values);
            result += "\nActD: " + l2s.ToString(getTransducerDisp());
            result += "\nActF: " + l2s.ToString(actuatorForce.Values);
            //foreach (DispTransducer act in actuators)
            //{
            //    result += "\n" + act;
            //}
            return result;
        }
        public double [][] getActuatorPins() {
            return getTransducerPins();
        }
    }
}
