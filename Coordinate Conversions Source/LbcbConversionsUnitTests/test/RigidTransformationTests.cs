using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LbcbConversions;


namespace LbcbConversionsUnitTests.test
{
    public class RigidTransformationTests
    {
        private double[][] platDisp = new double[][] { 
        new double[] {     1.0000,    1.0000,    1.0000,    0.0100,   -0.0100,    0.0000},
        new double[] {     1.0000,    1.0000,    1.0000,    0.0100,   -0.0100,   -0.0100},
        new double[] {    -0.5000,    1.0000,    1.0000,    0.0100,   -0.0100,   -0.0100},
        new double[] {    -0.0000,    0.0001,    0.0001,    0.0000,   -0.0000,   -0.0000}        
        };
        private double[][] mcDisp = new double[][] { 
        new double[] {0.9999, 0.9997, 1.0300, 0.0100, -0.0100, 0.0000},
        new double[] {0.9997, 0.9697, 1.0297, 0.0100, -0.0100, -0.0100},
        new double[] {-0.5002, 0.9697, 1.0297, 0.0100, -0.0100, -0.0100},
        new double[] {-0.4166e-4, 0.8042e-4, 0.8584e-4, 0.0083e-4, -0.0083e-4, -0.0083e-4},

        };
        private double[][] platForces = new double[][] { 
        new double[] {    0.0568e3,     0.0217e3,     0.3595e3,     1.6722e3,    -6.2027e3,     0.0014e3},
        new double[] {    0.0572e3,     0.0209e3,     0.3590e3,     1.7098e3,    -6.1463e3,    -0.3031e3},
        new double[] {   -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3},
        new double[] {   -0.0000e3,     0.0000e3,     0.0000e3,     0.0001e3,    -0.0005e3,    -0.0000e3},
        };
        private double[][] mcForces = new double[][] { 
        new double[] {0.0568e3, 0.0217e3, 0.3595e3, 1.6722e3, -5.9672e3, -1.2473e3},
        new double[] {0.0572e3, 0.0209e3, 0.3590e3, 1.7098e3, -5.9119e3, -1.5517e3},
        new double[] {-0.0060e3, 0.0196e3, 0.3381e3, 1.6543e3, -5.7272e3, -1.2140e3},
        new double[] {-0.0004, 0.0012, 0.0279, 0.1326, -0.4782, -0.1048}
        };
        [Test]
        public void testTransform()
        {
            RigidTransform rig = new RigidTransform(new double[] {3, 0, 0});
            for (int t = 0; t < 4; t++)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                double[] actual = rig.transform(platDisp[t], false);
                cmp.Compare(mcDisp[t],actual);
                CompareDoubleLists cmpF = new CompareDoubleLists(.5);
                actual = rig.transformMoments(platForces[t]);
                cmpF.Compare(mcForces[t],actual);
                actual = rig.transform(mcDisp[t], true);
                cmp.Compare(platDisp[t], actual);
                actual = rig.transformMoments(mcForces[t]);
                cmpF.Compare(platForces[t], actual);
            }

        }
    }
}
