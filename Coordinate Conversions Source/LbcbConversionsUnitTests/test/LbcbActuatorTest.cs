using LbcbConversions;
using log4net.Config;
using NUnit.Framework;
using System;
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
            double[] lengths = new double [] { 72.9711, 72.9711, 55.9129, 56, 56, 56 };
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
            double[] cart = new double[] {0,0,0,0,0,0}; 
            double[] expected0 = new double[] { 0.9507, 0, 0.3101, 8.3920, -3.8690, -22.8173 };
            double[] expected1 = new double[] { 0.9507, 0, 0.3101, 8.4119, -3.8691, -22.8591 };
            double[] expected2 = new double[] { 0.9507, 0, 0.3101, 8.3920, -3.7207, -22.7798 };
            double[] expected3 = new double[] { 0.9507, 0, 0.3101, 8.3501, -3.8319, -22.7258 };
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
