using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LbcbConversions;

namespace LbcbConversionsUnitTests.test
{
    public enum DofType { CartCommands, CartDisplacements, CartForces, ActCommands, ActLvdts, ActLoadCells };
    class ExpectedLbcbValues
    {
        private double [] cartCommands = new double[6];
        private double[] actCommands = new double[6];
        private double[] cartDisplacements = new double[6];
        private double[] actLvdts = new double[6];
        private double[] cartForces = new double[6];
        private double[] actLoadCells = new double[6];
        private static readonly ILog log = LogManager.GetLogger(typeof(ExpectedLbcbValues));
        private List2String l2s = new List2String();

        public double [] getDofs(DofType type) 
       {
            double[] result = new double [6];
            switch (type) 
            {
                case DofType.ActCommands:
                   actCommands.CopyTo(result,0);
                    break;
                case DofType.ActLoadCells:
                    actLoadCells.CopyTo(result, 0);
                    break;
                case DofType.ActLvdts:
                    actLvdts.CopyTo(result, 0);
                    break;
                case DofType.CartCommands:
                    cartCommands.CopyTo(result, 0);
                    break;
                case DofType.CartDisplacements:
                    cartDisplacements.CopyTo(result, 0);
                    break;
                case DofType.CartForces:
                    cartForces.CopyTo(result, 0);
                    break;
            }
            return result;
        }
        public void setDofs(DofType type, double [] values)
        {
            double[] active = new double[6];
            switch (type)
            {
                case DofType.ActCommands:
                    active = actCommands;
                    break;
                case DofType.ActLoadCells:
                    active = actLoadCells;
                    break;
                case DofType.ActLvdts:
                    active = actLvdts;
                    break;
                case DofType.CartCommands:
                    active = cartCommands;
                    break;
                case DofType.CartDisplacements:
                    active = cartDisplacements;
                    break;
                case DofType.CartForces:
                    active = cartForces;
                    break;
            }
            values.CopyTo(active, 0);
//            log.Debug("Values: " + l2s.toString(active));
        }

        override public string ToString()
        {
            StringBuilder msg = new StringBuilder("cart cmds: ");
            msg.Append(l2s.ToString(cartCommands));
            msg.Append("\ncart disps: ");
            msg.Append(l2s.ToString(cartDisplacements));
            msg.Append("\ncart forces: ");
            msg.Append(l2s.ToString(cartForces));
            msg.Append("\nact cmds: ");
            msg.Append(l2s.ToString(actCommands));
            msg.Append("\nact disps: ");
            msg.Append(l2s.ToString(actLvdts));
            msg.Append("\nact forces: ");
            msg.Append(l2s.ToString(actLoadCells));
            return msg.ToString();
        }
    }
}
