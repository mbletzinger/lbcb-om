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
        public LbcbConversion(String label, Lbcb lbcb, RigidTransform transform)
        {
            this.lbcb = lbcb;
            this.transform = transform;
            this.label = label;
        }
        public double[] convertActuator2CartesianDisplacements(double[] adisp)
        {
            lbcb.setActuatorDisp(adisp);
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
            lbcb.setCartesianDisp(cartDisp);
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
