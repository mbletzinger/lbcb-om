using log4net;
using log4net.Appender;
using log4net.Repository;
using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class ConversionFactory
    {
        private Dictionary<String, LbcbConversion> lbcbMap = new Dictionary<String, LbcbConversion>();
        private Dictionary<String, TransducerConversion> transducerMap = new Dictionary<String, TransducerConversion>();
        private ILog log = LogManager.GetLogger(typeof(ConversionFactory));
        private Lbcb[] lbcbs = new Lbcb[2];
        private RigidTransform[] transforms = new RigidTransform[2];
        public void setLbcb(bool isLbcb2, double[] flattenedPinArray, double[] motionCenter, double[] flattenedTransformation)
        {
            double[][] pins = new double[6][];
            double[,] xform = new double[6, 6];
            double[,] xpins = new double[6, 6];
            List2String l2s = new List2String();
            DenseMatrix2String m2s = new DenseMatrix2String();

            for (int r = 0; r < 6; r++)
            {
                pins[r] = new double[6];
                for (int c = 0; c < 6; c++)
                {
                    pins[r][c] = flattenedPinArray[r * 6 + c];
                    xpins[r, c] = flattenedPinArray[r * 6 + c];
                    xform[r, c] = flattenedTransformation[r * 6 + c];

                }
            }

            log.Info("Creating " + (isLbcb2 ? "LBCB 2" : "LBCB 1")
                + " with \n]\t Motion Center: " + l2s.ToString(motionCenter)
               + "\n\t Transformation Matrix: " + m2s.ToString(DenseMatrix.OfArray(xform))
               + "\n\t Pins Locations: " + m2s.ToString(DenseMatrix.OfArray(xpins)));
            double[] errorWindow = new double [] { 0.00001, 0.00001, 0.00001, 0.00001, 0.00001, 0.00001 };
            Lbcb lbcb = new Lbcb((isLbcb2 ? "LBCB 2" : "LBCB 1"), pins, errorWindow);
            lbcbs[(isLbcb2 ? 1 : 0)] = lbcb;
            RigidTransform transform = new RigidTransform(motionCenter, xform);
            transforms[(isLbcb2 ? 1 : 0)] = transform;
        }
        public LbcbConversion create(String label, bool isLbcb2)
        {
            int idx = (isLbcb2 ? 1 : 0);
            LbcbConversion convert = new LbcbConversion(label, lbcbs[idx], transforms[idx]);
            lbcbMap.Add(label, convert);
            return convert;
        }
        public LbcbConversion get(String label)
        {
            LbcbConversion result;
            try
            {
                bool worked = lbcbMap.TryGetValue(label, out result);
                if (worked)
                {
                    return result;
                }
                else
                {
                    log.Error("\"" + label + "\" does not exist");
                    return null;
                }
            }
            catch (Exception e)
            {
                log.Error("\"" + label + "\" does not work because ", e);
                return null;
            }
        }
    }
}
