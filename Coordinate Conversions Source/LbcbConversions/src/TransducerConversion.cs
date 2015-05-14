using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class TransducerConversion
    {
        private TransducerSpace transducers;
        private SynchronizedLbcbDataAccess cartesianDisplacements = new SynchronizedLbcbDataAccess();
        private SynchronizedLbcbDataAccess transducerDisplacements = new SynchronizedLbcbDataAccess();
        private String label;
        private readonly static ILog log = LogManager.GetLogger(typeof(LbcbConversion));
        private List2String l2s = new List2String();

        public TransducerConversion(String label, TransducerSpace transducers)
        {
            String newlabel = transducers.getLabel() + "_" + label;
            this.transducers = transducers; // don't need a copy since only used for one direction conversion.
            this.label = label;
        }
        public double[] convertTransducer2CartesianDisplacements(double[] adisp)
            {
            log.Debug("\n\n\"" + label + "\" before " + transducers.ToString());
                log.Debug("\"" + label + "\" setting Adisp to " + l2s.ToString(adisp));
                transducers.setTransducerDisp(adisp);
                log.Debug("\"" + label + "\" result " + transducers.ToString());
           
            transducerDisplacements.setData(adisp);
            double [] cartDisp = transducers.getCartesianDisp();
            cartesianDisplacements.setData(cartDisp);
            return cartDisp;
        }
        public double[] convertCartesian2TransducerDisplacements(double[] cdisp)
        {
                log.Debug("\n\n\"" + label + "\" before " + transducers.ToString());
                log.Debug("\"" + label + "\" setting Cdisp to " + l2s.ToString(cdisp));
                transducers.setCartesianDisp(cdisp);
                log.Debug("\"" + label + "\" result " + transducers.ToString());
            
            cartesianDisplacements.setData(cdisp);
            double [] actDisp = transducers.getTransducerDisp();
            transducerDisplacements.setData(actDisp);
            return actDisp;
        }
        public double[] getCartesianDisplacements()
        {
            return cartesianDisplacements.getData();
        }
        public double[] getTransducerDisplacements()
        {
            return transducerDisplacements.getData();
        }
        public TransducerSpace getTransducers()
        {
            return transducers;
        }
    }
}
