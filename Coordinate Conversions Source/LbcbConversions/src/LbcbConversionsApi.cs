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
    public class LbcbConversionsApi
    {
        private ConcurrentDictionary<String, Lbcb> lbcbMap = new ConcurrentDictionary<String,Lbcb>();
        private ILog log = LogManager.GetLogger(typeof(LbcbConversionsApi));
        public Lbcb create(String label, double[] flattenedPinArray)
        {
            if (lbcbMap.ContainsKey(label))
            {
                log.Warn("LBCB " + label + " already created.");
                return get(label);
            }
            double[][] pins = new double[6][];
            for (int r = 0; r < 6; r++)
            {
                pins[r] = new double[6];
                for (int c = 0; c < 6; c++)
                {
                    pins[r][c] = flattenedPinArray[r * 6 + c];

                }
            }
            
            Lbcb lbcb = new Lbcb(label, pins);
            lbcbMap.TryAdd(label, lbcb);
            return lbcb;
        }
        public Lbcb get(String label)
        {
            Lbcb result;
            bool worked = lbcbMap.TryGetValue(label,out result);
            return result;
        }
    }
}
