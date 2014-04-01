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
        private double length;
        private double initialLength;
        private DenseVector fixedPin;
        private DenseVector platformPin;
        private DenseVector initialPlatformPin;
        private RotationalMatrix roll = new RotationalMatrix(RotationalOrientation.Roll);
        private RotationalMatrix pitch = new RotationalMatrix(RotationalOrientation.Pitch);
        private RotationalMatrix yaw = new RotationalMatrix(RotationalOrientation.Yaw);
        private ILog log = LogManager.GetLogger(typeof(LbcbActuator));
        private String label;

        public LbcbActuator(String label, double [] pins)
        {
            DenseVector combinedPins = new DenseVector(pins);
            this.fixedPin = new DenseVector(3);
            this.platformPin = new DenseVector(3);
            this.initialPlatformPin = new DenseVector(3);
            combinedPins.CopySubVectorTo(this.fixedPin, 0, 0, 3);
            combinedPins.CopySubVectorTo(this.platformPin, 3, 0, 3);
            combinedPins.CopySubVectorTo(this.initialPlatformPin, 3, 0, 3);
            this.label = label;
            updateLength();
            initialLength = length;
        }
        public double [] getInitialPlatformPin()
        {
            return initialPlatformPin.Values;
        }
        public double[] getPlatformPin()
        {
            return platformPin.Values;
        }
        public double getCurrentDisplacement()
        {
            return length - initialLength;
        }
        public double getLength()
        {
            return length;
        }
        public double[] calcNewDiffs(double[] cartesian)
        {
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
            DenseVector basepin = fixedPin;
            DenseVector nominalplatformpin = initialPlatformPin;
            double Ppx = nominalplatformpin[0];
            double Ppy = nominalplatformpin[1];
            double Ppz = nominalplatformpin[2];
            log.Debug("Ppx= " + Ppx + "Ppy= " + Ppy + "Ppz= " + Ppz);
            DenseVector currentplatformpin = platformPin;
            List2String l2s = new List2String();

            DenseVector phai = (DenseVector) currentplatformpin.Subtract(basepin);
            log.Debug("phai " + l2s.ToString(phai.Values));

            if (length == 0.0)
            {
                log.Error("Actuator length is zero.  Caused a divide-by-zero error");
                throw new Exception("Actuator length is zero causing a divide by zero error");
            }

            phai = (DenseVector) phai.Divide(length);
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
            DenseVector curT = (DenseVector)initialPlatformPin.Add(translation);
            DenseMatrix curR = (DenseMatrix)r.Multiply(p.Multiply(y));
            platformPin = (DenseVector)curR.Multiply(curT);
            updateLength();
        }
        public double[] getDirectionalVector()
        {
            DenseVector result = (DenseVector)platformPin.Subtract(fixedPin);
            return result.Values;
        }
        public double[] getForceArm(DenseVector translation)
        {
            DenseVector result = (DenseVector)platformPin.Subtract(translation);
            return result.Values;
        }
        public String getLabel()
        {
            return label;
        }
        public void setPlatformPin(double[] pin)
        {
            this.platformPin = new DenseVector(pin);
        }
        public void setPlatformPin(DenseVector pin)
        {
            this.platformPin = pin;
        }
        public override string ToString()
        {
            List2String l2s = new List2String();
            string result = label + " ";
            result += "\tCurrent: " + l2s.ToString(platformPin.Values);
            result += "\tFixed: " + l2s.ToString(fixedPin.Values);
            result += "\tInitial: " + l2s.ToString(initialPlatformPin.Values);
            result += "\tDisplacement: " + getCurrentDisplacement();
            result += "\tLength: " + length;
            result += "\tInitial Length: " + initialLength;

            return result;
        }
        public void updateLength()
        {
            DenseVector actuatorVector = (DenseVector)platformPin.Subtract(fixedPin);
            length = actuatorVector.Norm(2.0);
            log.Debug("Length for " + label + " calculated at " + length);
        }
    }
}
