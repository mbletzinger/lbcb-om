using LbcbConversions;
using NUnit.Framework;
using System.Reflection;

namespace LbcbConversionsUnitTests.test
{
    [TestFixture]
    public class LbcbActuatorTest
    {
        private ActuatorPinLocationData l1pins;
        private ActuatorPinLocationData l2pins;
        [Test]
        [Category("CI")]
        public void test01PinPositions()
        {
            double[] lengths = new double[] { 72.9711, 72.9711, 55.9129, 56, 56, 56 };
            LbcbActuator[] pins1 = l1pins.getActuators();
            LbcbActuator[] pins2 = l2pins.getActuators();
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
            double[] expected0 = new double[] { 9.507188628e-01, 000000000, 3.100542597e-01, 7.441302234e+00, -3.869040345e+00, -2.281725271e+01 };
            double[] expected1 = new double[] { 9.507188628e-01, 000000000, 3.100542597e-01, 7.461168878e+00, -3.869144988e+00, -2.285910986e+01 };
            double[] expected2 = new double[] { 9.507188628e-01, 000000000, 3.100542597e-01, 7.441302234e+00, -3.720685810e+00, -2.277976114e+01 };
            double[] expected3 = new double[] { 9.507188628e-01, 000000000, 3.100542597e-01, 7.399352067e+00, -3.831938632e+00, -2.268862098e+01 };
            LbcbActuator[] pins1 = l1pins.getActuators();
            LbcbActuator x1 = pins1[0];
            CompareDoubleLists cdl = new CompareDoubleLists();

            cdl.Compare(expected0,x1.calcNewDiffs(cart));
            cart[3] = 0.005;
            cdl.Compare(expected1, x1.calcNewDiffs(cart));
            cart[3] = 0.0;
            cart[4] = 0.005;
            cdl.Compare(expected2, x1.calcNewDiffs(cart));
            cart[4] = 0.0;
            cart[5] = 0.005;
            cdl.Compare(expected3, x1.calcNewDiffs(cart));
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
            LbcbActuator[] pins1 = l1pins.getActuators();
            LbcbActuator x1 = pins1[0];
            for (int t = 0; t < 6; t++)
            {
                CompareDoubleLists cdl = new CompareDoubleLists();
                x1.update(cartesians[t]);
                cdl.Compare(positions[t], x1.getPlatformPin());
                Assert.That(x1.getLength(), Is.EqualTo(lengths[t]).Within(0.001));
            }
        }
        [SetUp]
        public void setup()
        {
            l1pins = new ActuatorPinLocationData(Assembly.GetExecutingAssembly());
            l2pins = new ActuatorPinLocationData(Assembly.GetExecutingAssembly());
            l1pins.loadPins("Lbcb1PinPositions.txt");
            l2pins.loadPins("Lbcb2PinPositions.txt");
        }
    }
}
