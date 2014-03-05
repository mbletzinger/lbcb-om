using log4net;
using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class LbcbActuatorPosition
    {
        private double length;
        private DenseVector fixedPin;
        private DenseVector platformPin;
        private String label;
        private ILog log = LogManager.GetLogger(typeof(LbcbActuatorPosition));
        private List2String l2s = new List2String();
        public LbcbActuatorPosition(String label, double length, DenseVector fixedPin, DenseVector platformPin)
        {
            this.length = length;
            this.fixedPin = fixedPin;
            this.platformPin = platformPin;
            this.label = label;
        }
        public LbcbActuatorPosition(String label, double[] pins)
        {
            DenseVector combinedPins = new DenseVector(pins);
            this.fixedPin = new DenseVector(3);
            this.platformPin = new DenseVector(3);
            combinedPins.CopySubVectorTo(this.fixedPin, 0, 0, 3);
            log.Debug("Fixed set at " + l2s.toString(this.fixedPin.Values));
            combinedPins.CopySubVectorTo(this.platformPin, 3, 0, 3);
            log.Debug("Platform set at " + l2s.toString(this.platformPin.Values));
            this.label = label;
            updateLength();
        }
        public LbcbActuatorPosition clone()
        {
            DenseVector fpc = new DenseVector(3);
            DenseVector ppc = new DenseVector(3);
            fixedPin.CopyTo(fpc);
            platformPin.CopyTo(ppc);
            return new LbcbActuatorPosition(label, length, fpc, ppc);
        }
        public double getLength()
        {
            return length;
        }
        public void setLength(double length)
        {
            this.length = length;
        }
        public DenseVector getFixedPin()
        {
            return fixedPin;
        }
        public DenseVector getPlatformPin()
        {
            return platformPin;
        }
        public void setPlatformPin(DenseVector pin)
        {
            this.platformPin = pin;
        }
        public void updateLength()
        {
            DenseVector actuatorVector = (DenseVector)platformPin.Subtract(fixedPin);
            length = actuatorVector.Norm(2.0);
        }
        public override String ToString()
        {
            List2String l2s = new List2String();
            String result = "APos: " + label;
            result += " Fixed: " + l2s.toString(fixedPin.Values);
            result += " Plat: " + l2s.toString(platformPin.Values);
            result += " Length: " + length;
            return result;
        }

    }
}
