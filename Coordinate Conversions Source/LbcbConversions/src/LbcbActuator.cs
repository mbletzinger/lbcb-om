using log4net;
using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class LbcbActuator
    {
        private LbcbActuatorPosition initial;
        private LbcbActuatorPosition current;
        private RotationalMatrix roll = new RotationalMatrix(RotationalOrientation.Roll);
        private RotationalMatrix pitch = new RotationalMatrix(RotationalOrientation.Pitch);
        private RotationalMatrix yaw = new RotationalMatrix(RotationalOrientation.Yaw);
        private ILog log = LogManager.GetLogger(typeof(LbcbActuator));
        private String label;

        public LbcbActuator(String label, LbcbActuatorPosition initial)
        {
            this.initial = initial;
            this.current = initial.clone();
            this.label = label;
        }
        public LbcbActuatorPosition getInitial()
        {
            return initial;
        }
        public LbcbActuatorPosition getCurrent()
        {
            return current;
        }
        public void setCurrent(LbcbActuatorPosition current)
        {
            this.current = current;
        }
        public double getCurrentStroke()
        {
            return current.getLength() - initial.getLength();
        }
        public double[] calcNewDiffs(double[] cartesian)
        {
 //           var formatProvider = (CultureInfo)CultureInfo.InvariantCulture.Clone();
   //         formatProvider.TextInfo.ListSeparator = " ";

            DenseMatrix rotTrig = DenseMatrix.Create(3,2,0);
            double theta_x = cartesian[3];
            double theta_y = cartesian[4];
            double theta_z = cartesian[5];
            var formatProvider = (CultureInfo)CultureInfo.InvariantCulture.Clone();
            formatProvider.TextInfo.ListSeparator = " ";

            rotTrig.At(0, 0, Math.Sin(theta_x));
            rotTrig.At(0, 1, Math.Cos(theta_x));
            rotTrig.At(1, 0, Math.Sin(theta_y));
            rotTrig.At(1, 1, Math.Cos(theta_y));
            rotTrig.At(2, 0, Math.Sin(theta_z));
            rotTrig.At(2, 1, Math.Cos(theta_z));
            log.Debug("Rotation Angles " + rotTrig.ToString("#000.00000\t", formatProvider));
            DenseVector basepin = initial.getFixedPin();
            DenseVector nominalplatformpin = initial.getPlatformPin();
            double Ppx = nominalplatformpin[0];
            double Ppy = nominalplatformpin[1];
            double Ppz = nominalplatformpin[2];
            log.Debug("Ppx= " + Ppx + "Ppy= " + Ppy + "Ppz= " + Ppz);
            DenseVector currentplatformpin = current.getPlatformPin();
            List2String l2s = new List2String();

            DenseVector phai = (DenseVector) currentplatformpin.Subtract(basepin);
            log.Debug("phai " + l2s.ToString(phai.Values));

            if (current.getLength() == 0.0)
            {
                log.Error("Actuator length is zero.  Caused a divide-by-zero error");
                throw new Exception("Actuator length is zero causing a divide by zero error");
            }

            phai = (DenseVector) phai.Divide(current.getLength());
            log.Debug("phai " + l2s.ToString(phai.Values));

            DenseMatrix J = DenseMatrix.Create(3,3,0);
            // Jacobian Element
            J[0, 0] = 0;
            J[0, 1] =  -rotTrig[1, 0] * rotTrig[2, 1] * Ppx + rotTrig[1, 0] * rotTrig[2, 0] * Ppy + rotTrig[1, 1] * Ppz;
            J[0, 2] =  -rotTrig[1, 1] * rotTrig[2, 0] * Ppx - rotTrig[1, 1] * rotTrig[2, 1] * Ppy;
            J[1, 0] = (rotTrig[0, 1] * rotTrig[1, 0] * rotTrig[2, 1] - rotTrig[0, 0] * rotTrig[2, 0]) * Ppx +
                    (-rotTrig[0, 1] * rotTrig[1, 0] * rotTrig[2, 0] - rotTrig[0, 0] * rotTrig[0, 1]) * Ppy
                     - rotTrig[0, 1] * rotTrig[1, 1] * Ppz;
            J[1, 1] =  rotTrig[0, 0] * rotTrig[1, 1] * rotTrig[2, 1] * Ppx - rotTrig[0, 0] * rotTrig[1, 1] * rotTrig[2, 0] * Ppy
                     - rotTrig[0, 0] * rotTrig[1, 1] * Ppz;
            J[1, 2] = (-rotTrig[0, 0] * rotTrig[1, 0] * rotTrig[2, 0] * rotTrig[0, 1] * rotTrig[2, 1]) * Ppx +
                    (-rotTrig[0, 0] * rotTrig[1, 0] * rotTrig[2, 1] - rotTrig[0, 1] * rotTrig[2, 0]) * Ppy;
            J[2, 0] = (rotTrig[0, 0] * rotTrig[1, 0] * rotTrig[2, 1] + rotTrig[0, 1] * rotTrig[2, 0]) * Ppx +
                    (-rotTrig[0, 0] * rotTrig[1, 0] * rotTrig[2, 0] + rotTrig[0, 1] * rotTrig[2, 1]) * Ppy
                     - rotTrig[0, 0] * rotTrig[1, 1] * Ppz;
            J[2, 1] =  -rotTrig[0, 1] * rotTrig[1, 1] * rotTrig[2, 1] * Ppx + rotTrig[0, 1] * rotTrig[1, 1] * rotTrig[2, 0] * Ppy
                     - rotTrig[0, 1] * rotTrig[1, 0] * Ppz;
            J[2, 2] = (rotTrig[0, 1] * rotTrig[1, 0] * rotTrig[2, 0] + rotTrig[0, 0] * rotTrig[2, 1]) * Ppx
                    + (rotTrig[0, 1] * rotTrig[1, 0] * rotTrig[2, 1] - rotTrig[0, 0] * rotTrig[2, 0]) * Ppy;

            log.Debug("Jacobian " + J.ToString("#000.00000\t", formatProvider));
            DenseVector diffs = new DenseVector(6);
            diffs.SetSubVector(0, 3, phai);
            DenseVector rphai = new DenseVector(new[] { (J[0, 0] * phai[0] + J[1, 0] * phai[1] + J[2, 0] * phai[2]), 
                    (J[0, 1] * phai[0] + J[1, 1] * phai[1] + J[2, 1] * phai[2]), 
                        (J[0, 2] * phai[0] + J[1, 2] * phai[2] + J[2, 2] * phai[2]) });
            log.Debug("rphai " + l2s.ToString(rphai.Values));
            diffs.SetSubVector(3, 3, rphai);
            return diffs.Values;
        }
        public void update(double[] cartesian)
        {
            DenseVector translation = new DenseVector(3);
            for (int d = 0; d < 3; d++)
            {
                translation[d] = cartesian[d];
            }
            double theta_x = cartesian[3];
            double theta_y = cartesian[4];
            double theta_z = cartesian[5];
            DenseMatrix r = roll.create(theta_x);
            DenseMatrix p = pitch.create(theta_y);
            DenseMatrix y = yaw.create(theta_z);
            DenseVector cur = null;
            DenseVector curT = (DenseVector)initial.getPlatformPin().Add(translation);
            DenseMatrix curR = (DenseMatrix)r.Multiply(p.Multiply(y));
            cur = (DenseVector)curR.Multiply(curT);

            current.setPlatformPin(cur);
            current.updateLength();
        }
        public double[] getDirectionalVector()
        {
            DenseVector result = (DenseVector)current.getPlatformPin().Subtract(current.getFixedPin());
            return result.Values;
        }
        public double[] getForceArm(DenseVector translation)
        {
            DenseVector result = (DenseVector)current.getPlatformPin().Subtract(translation);
            return result.Values;
        }
        public String getLabel()
        {
            return label;
        }
    }
}
