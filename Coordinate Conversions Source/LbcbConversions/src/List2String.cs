using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class List2String
    {
        private String separator = ",";
        public List2String()
        {
            this.separator = ",";
        }
        public List2String(String separator)
        {
            this.separator = separator;
        }

        public String ToString(double[] list)
        {
            String result = "";
            bool first = true;
            foreach (double d in list)
            {
                if (first)
                {
                    result += d.ToString();
                    first = false;
                    continue;
                }
                result += separator + d.ToString();
            }
            return result;
        }
    }
}
