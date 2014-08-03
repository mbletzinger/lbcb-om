using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LbcbConversions;
using log4net;


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
        new double[] {       0.99985,        0.9997,      1.029998,          0.01,         -0.01,             0},
	    new double[] {        0.9997,      0.969702,      1.029697,          0.01,         -0.01,         -0.01},
	    new double[] {       -0.5003,      0.969702,      1.029697,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0}
        };
        private double[][] mcDisp1 = new double[][] { 
        new double[] {     0.3484108,     0.3468434,      1.313479,          0.01,         -0.01,             0},
	    new double[] {     0.3468109,    0.02686493,      1.310263,          0.01,         -0.01,         -0.01},
	    new double[] {     -1.153189,    0.02686493,      1.310263,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0}
        };
        private double[][] mcDisp2 = new double[][] { 
        new double[] {     0.6755554,     0.6733717,      1.436748,          0.01,         -0.01,             0},
	    new double[] {      1.226069,     0.7805594,      1.443326,          0.01,         -0.01,         -0.01},
	    new double[] {    -0.2739313,     0.7805594,      1.443326,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0}
        };
        private double[][] platForces = new double[][] { 
        new double[] {    0.0568e3,     0.0217e3,     0.3595e3,     1.6722e3,    -6.2027e3,     0.0014e3},
        new double[] {    0.0572e3,     0.0209e3,     0.3590e3,     1.7098e3,    -6.1463e3,    -0.3031e3},
        new double[] {   -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3},
        new double[] {   -0.0000e3,     0.0000e3,     0.0000e3,     0.0001e3,    -0.0005e3,    -0.0000e3},
        };
        private double[][] mcForces = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,        1672.2,       -5124.2,         -63.7},
	    new double[] {          57.2,          20.9,           359,        1709.8,       -5069.3,        -365.8},
	    new double[] {            -6,          19.6,         338.1,        1654.3,       -4753.8,        -276.4},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,            -0}

        };
        private double[][] mcForces1 = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,        3082.7,        1609.3,          -693},
	    new double[] {          57.2,          20.9,           359,        3068.3,        1623.7,        -971.9},
	    new double[] {            -6,          19.6,         338.1,        2928.3,        5441.1,        -844.8},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,            -0}
       };
        private double[][] mcForces2 = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,     -17395.05,      -12003.2,        3364.1},
	    new double[] {          57.2,          20.9,           359,     -17355.95,      -11954.3,        3072.8},
	    new double[] {            -6,          19.6,         338.1,      -16304.2,       -9292.2,          -332},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,             0}

       };
        private ILog log = LogManager.GetLogger(typeof(RigidTransformationTests));
        [Test]
        public void testTransform1()
        {
            RigidTransform rig = new RigidTransform(new double[] { 3, 0, 0 }, new double[,] { 
             {1.0, 0.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 1.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 1.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 1.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 1.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 0.0, 1.0} 
        });
            log.Debug("Testing small motion center");
            testTransform(rig, mcDisp, mcForces);
        }
        [Test]
        public void testTransform2()
        {
            RigidTransform rig = new RigidTransform(new double[] { 32, 0, 65 }, new double[,] { 
             {1.0, 0.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 1.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 1.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 1.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 1.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 0.0, 1.0} 
        });
            log.Debug("Testing large motion center");
            testTransform(rig, mcDisp1, mcForces1);

        }
        [Test]
        public void testTransform3()
        {
            RigidTransform rig = new RigidTransform(new double[] { -11, 55, 32.5, }, new double[,] { 
             {1.0, 0.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 1.0, 0.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 1.0, 0.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 1.0, 0.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 1.0, 0.0}, 
             {0.0, 0.0, 0.0, 0.0, 0.0, 1.0} 
        });
            log.Debug("Testing large motion center");
            testTransform(rig, mcDisp2, mcForces2);

        }
        private void testTransform(RigidTransform rig, double[][] exDisp, double[][] exForce)
        {
            for (int t = 0; t < 4; t++)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                double[] actual = rig.transform(platDisp[t], false);
                log.Debug("Checking mc disp");
                cmp.Compare(exDisp[t], actual);
                actual = rig.transformMoments(platForces[t]);
                log.Debug("Checking mc force");
                cmp.Compare(exForce[t], actual);
                actual = rig.transform(exDisp[t], true);
                log.Debug("Checking plat disp");
                cmp.Compare(platDisp[t], actual);
                actual = rig.transformMoments(exForce[t]);
                log.Debug("Checking plat force");
                cmp.Compare(platForces[t], actual);
            }
        }
    }
}
