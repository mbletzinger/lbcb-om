using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class SynchronizedLbcbDataAccess
    {
        private Object dataLock = new Object();
        private double[] data = new double[6];
        public void setData(double[] data)
        {
            lock (dataLock)
            {
                data.CopyTo(this.data, 0);
            }
        }
        public double[] getData()
        {
            double[] result = new double[6];
            lock (dataLock)
            {
                this.data.CopyTo(result, 0);
            }
            return result;
        }
    }
}
