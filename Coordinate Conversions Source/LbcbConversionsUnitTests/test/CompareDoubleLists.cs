using LbcbConversions;
using log4net;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversionsUnitTests.test
{
    class CompareDoubleLists
    {
        private double tolerance;
        private ILog log = LogManager.GetLogger(typeof(CompareDoubleLists));
        private List2String l2s = new List2String();
        public void Compare(double[] expected, double[] actual)
        {
            log.Debug("Comparing expected " + l2s.ToString(expected) + " with actual " + l2s.ToString(actual));
            for (int d = 0; d < expected.Length; d++)
            {
                Assert.That(actual[d],Is.EqualTo(expected[d]).Within(tolerance));
            }
        }
        public CompareDoubleLists()
        {
            this.tolerance = 0.001;
        }
        public CompareDoubleLists(double tolerance)
        {
            this.tolerance = tolerance;
        }
    }
}
