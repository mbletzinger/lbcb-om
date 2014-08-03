using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class LbcbConversion
    {
        private Lbcb lbcb;
        private RigidTransform transform;
        private SynchronizedLbcbDataAccess cartesianDisplacements = new SynchronizedLbcbDataAccess();
        private SynchronizedLbcbDataAccess cartesianForces = new SynchronizedLbcbDataAccess();
        private SynchronizedLbcbDataAccess actuatorDisplacements = new SynchronizedLbcbDataAccess();
        private SynchronizedLbcbDataAccess actuatorForces = new SynchronizedLbcbDataAccess();
        private String label;
        private readonly static ILog log = LogManager.GetLogger(typeof(LbcbConversion));
        private List2String l2s = new List2String();

        public LbcbConversion(String label, Lbcb lbcb, RigidTransform transform)
        {
            this.lbcb = lbcb;
            this.transform = transform;
            this.label = label;
        }
        public double[] convertActuator2CartesianDisplacements(double[] adisp)
        {
            if (label.Contains("Read") == false)
            {
                log.Debug("\"" + label + "\" before " + lbcb.ToString());
                log.Debug("\"" + label + "\" setting Adisp to " + l2s.ToString(adisp));
                lbcb.setActuatorDisp(adisp);
                log.Debug("\"" + label + "\" result " + lbcb.ToString());
            }
            actuatorDisplacements.setData(adisp);
            double [] cartDisp = transform.transform(lbcb.getCartesianDisp(),false);
            cartesianDisplacements.setData(cartDisp);
            return cartDisp;
        }
        public double [] convertActuator2CartesianForces(double[] aforce)
        {
            lbcb.setActuatorForce(aforce);
            actuatorForces.setData(aforce);
            double[] cartForce = transform.transformMoments(lbcb.getCartesianForce());
            cartesianForces.setData(cartForce);
            return cartForce;
        }
        public double[] convertCartesian2ActuatorDisplacements(double[] cdisp)
        {
            double [] cartDisp = transform.transform(cdisp, true);
            if (label.Contains("Read") == false)
            {
                log.Debug("\"" + label + "\" before " + lbcb.ToString());
                log.Debug("\"" + label + "\" transformed cdisp from " + l2s.ToString(cdisp) + "\n\tto " + l2s.ToString(cartDisp));
                log.Debug("\"" + label + "\" setting Cdisp to " + l2s.ToString(cartDisp));
                lbcb.setCartesianDisp(cartDisp);
                log.Debug("\"" + label + "\" result " + lbcb.ToString());
            }
            cartesianDisplacements.setData(cartDisp);
            double [] actDisp = lbcb.getActuatorDisp();
            actuatorDisplacements.setData(actDisp);
            return actDisp;
        }
        public double[] getCartesianDisplacements()
        {
            return cartesianDisplacements.getData();
        }
        public double[] getActuatorDisplacements()
        {
            return actuatorDisplacements.getData();
        }
        public double[] getCartesianForces()
        {
            return cartesianForces.getData();
        }
        public double[] getActuatorForces()
        {
            return actuatorForces.getData();
        }
        public Lbcb getLbcb()
        {
            return lbcb;
        }
    }
}
