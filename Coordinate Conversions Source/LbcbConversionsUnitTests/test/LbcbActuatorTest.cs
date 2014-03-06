using LbcbConversions;
using NUnit.Framework;
using System.Reflection;

namespace LbcbConversionsUnitTests.test
{
    [TestFixture]
    public class LbcbActuatorTest
    {
        private ActuatorPinPositions l1pins;
        private ActuatorPinPositions l2pins;
        [Test]
        [Category("CI")]
        public void test01PinPositions()
        {
            double[] lengths = new double[] { 72.9711, 72.9711, 55.9129, 56, 56, 56 };
            LbcbActuatorPosition[] pins1 = l1pins.getActuatorPositions();
            LbcbActuatorPosition[] pins2 = l2pins.getActuatorPositions();
            for (int a = 0; a < 6; a++)
            {
                Assert.That(pins1[a].getLength(), Is.EqualTo(lengths[a]).Within(0.001));
                Assert.That(pins2[a].getLength(), Is.EqualTo(lengths[a]).Within(0.001));
            }
        }
        [Test]
        //       [CI]
        public void test02DiffCalculations()
        {
            //            MatrixDataAccessor mda = new MatrixDataAccessor();
            //           mda.Run();

            double[] cart = new double[] { 0, 0, 0, 0, 0, 0 };
            double[] expected0 = new double[] { 0.9507, 0, 0.3101, 7.4413, -3.8690, -22.8173 };
            double[] expected1 = new double[] { 0.9507, 0, 0.3101, 7.4612, -3.8691, -22.8591 };
            double[] expected2 = new double[] { 0.9507, 0, 0.3101, 7.4413, -3.7207, -22.7798 };
            double[] expected3 = new double[] { 0.9507, 0, 0.3101, 7.3994, -3.8319, -22.7258 };
            LbcbActuatorPosition[] pins1 = l1pins.getActuatorPositions();
            LbcbActuator x1 = new LbcbActuator("X1", pins1[0]);
            CompareDoubleLists cdl = new CompareDoubleLists(expected0);
            cdl.Compare(x1.calcNewDiffs(cart));
            cart[3] = 0.005;
            cdl = new CompareDoubleLists(expected1);
            cdl.Compare(x1.calcNewDiffs(cart));
            cart[3] = 0.0;
            cart[4] = 0.005;
            cdl = new CompareDoubleLists(expected2);
            cdl.Compare(x1.calcNewDiffs(cart));
            cart[4] = 0.0;
            cart[5] = 0.005;
            cdl = new CompareDoubleLists(expected3);
            cdl.Compare(x1.calcNewDiffs(cart));
        }
        [Test]
        public void test03Updates()
        {
            double[][] cartesians = 
            {
            new double[] {0.1, 0, 0, 0, 0, 0},
            new double[] {0, 0.2, 0, 0, 0, 0},
            new double[] {0, 0, 0.45, 0, 0, 0}, 
            new double[] {0, 0, 0, 0.005, 0, 0},
            new double[] {0, 0, 0, 0, 0.003, 0},
            new double[] {0, 0, 0, 0, 0, -0.002}
                                    };
            double[][] positions = 
            {
            new double[] {-26.9000,   24.0000,  -12.8750},
            new double[] {-27.0000,   24.2000,  -12.8750},
            new double[] {-27.0000,   24.0000,  -12.4250},
            new double[] {-27.0000,   24.0641,  -12.7548},
            new double[] {-27.0385,   24.0000,  -12.7939},
            new double[] {-26.9519,   24.0540,  -12.8750},
            };
            double[] lengths = { 73.0662, 72.9714, 73.1119, 73.0085, 72.9597, 73.0168 };
            LbcbActuatorPosition[] pins1 = l1pins.getActuatorPositions();
            LbcbActuator x1 = new LbcbActuator("X1", pins1[0]);
            for (int t = 0; t < 6; t++)
            {
                CompareDoubleLists cdl = new CompareDoubleLists(positions[t]);
                x1.update(cartesians[t]);
                LbcbActuatorPosition plat = x1.getCurrent();
                cdl.Compare(plat.getPlatformPin());
                Assert.That(plat.getLength(), Is.EqualTo(lengths[t]).Within(0.001));
            }
        }
        [SetUp]
        public void setup()
        {
            l1pins = new ActuatorPinPositions(Assembly.GetExecutingAssembly());
            l2pins = new ActuatorPinPositions(Assembly.GetExecutingAssembly());
            l1pins.loadLbcb("Lbcb1PinPositions.txt");
            l2pins.loadLbcb("Lbcb2PinPositions.txt");
        }
    }
}
