using MathNet.Numerics.LinearAlgebra.Double;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class DenseMatrix2String
    {
                   private CultureInfo formatProvider = (CultureInfo)CultureInfo.InvariantCulture.Clone();
    public DenseMatrix2String() {
        formatProvider.TextInfo.ListSeparator = ",";
    }
    public string ToString(DenseMatrix m)
    {
        return m.ToString("",formatProvider);
    }
    }
}
