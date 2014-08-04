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
        new double[] {    -0.0000,    0.0001,    0.0001,    0.0000,   -0.0000,   -0.0000},        
    	new double[] {     -2.490573,     0.8491766,     0.3518559,  -0.004393813,   0.007244046,    0.01572947}
        };
        private double[][] mcDisp = new double[][] { 
        new double[] {       0.99985,        0.9997,      1.029998,          0.01,         -0.01,             0},
	    new double[] {        0.9997,      0.969702,      1.029697,          0.01,         -0.01,         -0.01},
	    new double[] {       -0.5003,      0.969702,      1.029697,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0},
        new double[] {     -2.491023,     0.8962672,     0.3299196,  -0.004393813,   0.007244046,    0.01572947}

        };
        private double[][] mcDisp1 = new double[][] { 
        new double[] {     0.3484108,     0.3468434,      1.313479,          0.01,         -0.01,             0},
	    new double[] {     0.3468109,    0.02686493,      1.310263,          0.01,         -0.01,         -0.01},
	    new double[] {     -1.153189,    0.02686493,      1.310263,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0},
    	new double[] {     -2.024512,      1.637065,      0.115535,  -0.004393813,   0.007244046,    0.01572947}
        };
        private double[][] mcDisp2 = new double[][] { 
        new double[] {     0.6755554,     0.6733717,      1.436748,          0.01,         -0.01,             0},
	    new double[] {      1.226069,     0.7805594,      1.443326,          0.01,         -0.01,         -0.01},
	    new double[] {    -0.2739313,     0.7805594,      1.443326,          0.01,         -0.01,         -0.01},
	    new double[] {             0,        0.0001,        0.0001,             0,             0,             0},
    	new double[] {     -3.118557,     0.8119989,     0.1957604,  -0.004393813,   0.007244046,    0.01572947}
        };
        private double[][] mcDisp3 = new double[][] { 
        new double[] {      0.567688,     0.5364638,     0.8332692,    0.01006705,  -0.009998323,  -8.831275e-05},
	    new double[] {     0.5608326,      0.718721,     0.8391579,    0.01013821,  -0.009746268,   -0.01025145},
	    new double[] {    -0.9640569,     0.7324925,     0.8289009,    0.01017121,  -0.009750768,   -0.01125195},
	    new double[] {    -6.133e-07,   9.74934e-05,  0.0001026886,       8.7e-09,      -2.8e-09,     -2.65e-08},
	    new double[] {     -2.197343,     0.7652251,     0.4878561,  -0.004426768,   0.006803606,    0.01461147}
        };
        private double[][] platForces = new double[][] { 
        new double[] {    0.0568e3,     0.0217e3,     0.3595e3,     1.6722e3,    -6.2027e3,     0.0014e3},
        new double[] {    0.0572e3,     0.0209e3,     0.3590e3,     1.7098e3,    -6.1463e3,    -0.3031e3},
        new double[] {   -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3},
        new double[] {   -0.0000e3,     0.0000e3,     0.0000e3,     0.0001e3,    -0.0005e3,    -0.0000e3},
        new double[] {   -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3},
        };
        private double[][] mcForces = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,        1672.2,       -5124.2,         -63.7},
	    new double[] {          57.2,          20.9,           359,        1709.8,       -5069.3,        -365.8},
	    new double[] {            -6,          19.6,         338.1,        1654.3,       -4753.8,        -276.4},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,            -0},
	    new double[] {            -6,          19.6,         338.1,        1654.3,       -4753.8,        -276.4}
        };
        private double[][] mcForces1 = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,        3082.7,        1609.3,          -693},
	    new double[] {          57.2,          20.9,           359,        3068.3,        1623.7,        -971.9},
	    new double[] {            -6,          19.6,         338.1,        2928.3,        5441.1,        -844.8},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,            -0},
    	new double[] {            -6,          19.6,         338.1,        2928.3,        5441.1,        -844.8}
       };
        private double[][] mcForces2 = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,     -17395.05,      -12003.2,        3364.1},
	    new double[] {          57.2,          20.9,           359,     -17355.95,      -11954.3,        3072.8},
	    new double[] {            -6,          19.6,         338.1,      -16304.2,       -9292.2,          -332},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,             0},
    	new double[] {            -6,          19.6,         338.1,      -16304.2,       -9292.2,          -332}
       };
        private double[][] mcForces3 = new double[][] { 
        new double[] {          56.8,          21.7,         359.5,      2658.877,     -15256.34,           392},
	    new double[] {          57.2,          20.9,           359,      2660.102,     -15209.13,          73.1},
	    new double[] {            -6,          19.6,         338.1,      2545.492,     -11581.09,         135.2},
	    new double[] {            -0,             0,             0,           0.1,          -0.5,             0},
	    new double[] {            -6,          19.6,         338.1,      2545.492,     -11581.09,         135.2}

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
        [Test]
        public void testTransform4()
        {
            RigidTransform rig = new RigidTransform(new double[] { -18.0000, 0, 45.4690 }, new double[,] { 
            {1.016593, -0.000047, -0.006086, 0.122384, -1.617186, 0.775084},
            {-0.009181, 1.003122, -0.028188, 1.501314, -0.060338, -0.176663},
            {0.006838, 0.025004, 1.001882, -0.282000, -0.167350, 0.043025},
            {-0.000022, -0.000022, 0.000109, 1.001187, 0.000965, -0.007494},
            {0.000003, -0.000029, 0.000001, 0.001187, 0.999678, -0.025727},
            {0.000667, 0.000011, -0.000276, 0.006026, 0.029385, 1.016522},
        });
            log.Debug("Testing alignment matrix");
            testTransform(rig, mcDisp3, mcForces3);

        }

        private void testTransform(RigidTransform rig, double[][] exDisp, double[][] exForce)
        {
            for (int t = 0; t < 5; t++)
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
