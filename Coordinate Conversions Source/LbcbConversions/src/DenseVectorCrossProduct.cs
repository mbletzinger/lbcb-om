using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class DenseVectorCrossProduct
    {
        private DenseVector vorig;
        public DenseVectorCrossProduct(DenseVector orig)
        {
            this.vorig = orig;
        }
        public DenseVector crossProduct(DenseVector vnew)
        {
            DenseVector result = new DenseVector(3);
            result[0] = vorig[1] * vnew[2] - vorig[2] * vnew[1];
            result[1] = vorig[2] * vnew[0] - vorig[0] * vnew[2];
            result[2] = vorig[0] * vnew[1] - vorig[1] * vnew[0];
            return result;
        }
    }
}
