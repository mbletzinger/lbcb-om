using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LbcbConversions;

namespace LbcbConversionsUnitTests.test
{
    public enum TransType { L1_Cart, L2_Cart, L1_Sensors, L2_Sensors };
    public class ExpectedTransducerValues
    {
        private double [] l1Cart = new double[6];
        private double[] l2Cart = new double[6];
        private double[] l1Sensors = new double[6];
        private double[] l2Sensors = new double[6];
        private static readonly ILog log = LogManager.GetLogger(typeof(ExpectedTransducerValues));
        private List2String l2s = new List2String();

        public double [] getDofs(TransType type) 
       {
            double[] result = new double [6];
            switch (type) 
            {
                case TransType.L1_Cart:
                   l1Cart.CopyTo(result,0);
                    break;
                case TransType.L2_Cart:
                    l2Cart.CopyTo(result, 0);
                    break;
                case TransType.L1_Sensors:
                    l1Sensors.CopyTo(result, 0);
                    break;
                case TransType.L2_Sensors:
                    l2Sensors.CopyTo(result, 0);
                    break;
            }
            return result;
        }
        public void setDofs(TransType type, double [] values)
        {
            double[] active = new double[6];
            switch (type)
            {
                case TransType.L1_Cart:
                    active = l1Cart;
                    break;
                case TransType.L2_Cart:
                    active = l2Cart;
                    break;
                case TransType.L1_Sensors:
                    active = l1Sensors;
                    break;
                case TransType.L2_Sensors:
                    active = l2Sensors;
                    break;
            }
            values.CopyTo(active, 0);
//            log.Debug("Values: " + l2s.toString(active));
        }

        override public string ToString()
        {
            StringBuilder msg = new StringBuilder("L1 cart: ");
            msg.Append(l2s.ToString(l1Cart));
            msg.Append("\nL2 cart: ");
            msg.Append(l2s.ToString(l2Cart));
            msg.Append("\nL1 sensors: ");
            msg.Append(l2s.ToString(l1Sensors));
            msg.Append("\nL2 sensors: ");
            msg.Append(l2s.ToString(l2Sensors));
            return msg.ToString();
        }
    }
}
