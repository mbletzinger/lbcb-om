using log4net;
using log4net.Appender;
using log4net.Repository;
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
    public class LbcbConversionFactory
    {
        private Dictionary<String, LbcbConversion> convertMap = new Dictionary<String,LbcbConversion>();
        private ILog log = LogManager.GetLogger(typeof(LbcbConversionFactory));
        private Lbcb[] lbcbs = new Lbcb[2];
        private RigidTransform[] transforms = new RigidTransform[2];
        public void setLbcb(bool isLbcb2, double[] flattenedPinArray, double[] motionCenter, double[] flattenedTransformation)
        {
            double[][] pins = new double[6][];
            double[,] xform = new double[6, 6];
            for (int r = 0; r < 6; r++)
            {
                pins[r] = new double[6];
                for (int c = 0; c < 6; c++)
                {
                    pins[r][c] = flattenedPinArray[r * 6 + c];
                    xform[r,c] = flattenedTransformation[r * 6 + c];

                }
            }
            
            Lbcb lbcb = new Lbcb((isLbcb2 ? "LBCB 2" : "LBCB 1"), pins);
            lbcbs[(isLbcb2 ? 1 : 0)] = lbcb;
            RigidTransform transform = new RigidTransform(motionCenter,xform);
            transforms[(isLbcb2 ? 1 : 0)] = transform;
        }
        public LbcbConversion create(String label, bool isLbcb2)
        {
            int idx = (isLbcb2 ? 1 : 0);
            LbcbConversion convert = new LbcbConversion(label, lbcbs[idx], transforms[idx]);
            convertMap.Add(label, convert);
            return convert;
        }
        public LbcbConversion get(String label)
        {
            LbcbConversion result;
            bool worked = convertMap.TryGetValue(label,out result);
            return result;
        }
    }
}
