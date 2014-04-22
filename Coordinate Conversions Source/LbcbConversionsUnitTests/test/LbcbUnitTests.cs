using System;
using System.IO;
using System.Reflection;
using log4net;
using System.Text;
using System.Collections.Generic;
using log4net.Config;
using LbcbConversions;

namespace LbcbConversionsUnitTests.test
{
    [NUnit.Framework.TestFixture]
    public class LbcbUnitTests
    {
        private ExpectedLbcbValues[] expected1;
        private ExpectedLbcbValues[] expected2;
        private Lbcb lbcb1;
        private Lbcb lbcb2;
        private static readonly ILog log = LogManager.GetLogger(typeof(LbcbUnitTests));

        [NUnit.Framework.SetUp]
        public void setup()
        {
            LbcbData data = new LbcbData("LBCB1_Snapshot.txt");
            expected1 = data.getExpectedLbcbValues();
            data = new LbcbData("LBCB2_Snapshot.txt");
            expected2 = data.getExpectedLbcbValues();
            ActuatorPinLocationData l1pins = new ActuatorPinLocationData(Assembly.GetExecutingAssembly());
            ActuatorPinLocationData l2pins = new ActuatorPinLocationData(Assembly.GetExecutingAssembly());
            l1pins.loadPins("Lbcb1PinPositions.txt");
            l2pins.loadPins("Lbcb2PinPositions.txt");
            lbcb1 = new Lbcb("LBCB 1", l1pins.getPins());
            lbcb2 = new Lbcb("LBCB 2", l2pins.getPins());

        }
        [NUnit.Framework.Test]
        public void ConvertActuatorDisplacements2Cartesian()
        {
           foreach (ExpectedLbcbValues ev in expected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                double [] carts = lbcb1.getCartesianDisp();
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);
            }
           foreach (ExpectedLbcbValues ev in expected2)
           {
               CompareDoubleLists cmp = new CompareDoubleLists();
               lbcb2.setActuatorDisp(ev.getDofs(DofType.ActCommands));
               double[] carts = lbcb2.getCartesianDisp();
               cmp.Compare(ev.getDofs(DofType.CartCommands), carts);
           }
 
         }
        [NUnit.Framework.Test]
        public void ConvertActuatorForces2Cartesian()
        {
            foreach (ExpectedLbcbValues ev in expected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                lbcb1.setActuatorForce(ev.getDofs(DofType.ActLoadCells));
                double[] carts = lbcb1.getCartesianForce();
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
            }
            foreach (ExpectedLbcbValues ev in expected2)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb2.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                lbcb2.setActuatorForce(ev.getDofs(DofType.ActLoadCells));
                double[] carts = lbcb2.getCartesianForce();
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
            }

        }
        [NUnit.Framework.Test]
        public void ConvertCartesian2Actuator()
        {
            log.Debug("Start " + lbcb1);
            foreach (ExpectedLbcbValues ev in expected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setCartesianDisp(ev.getDofs(DofType.CartCommands));
                log.Debug("Current " + lbcb1);
                double[] carts = lbcb1.getActuatorDisp();
                cmp.Compare(ev.getDofs(DofType.ActCommands),carts);
            }
            log.Debug("Start " + lbcb2);
            foreach (ExpectedLbcbValues ev in expected2)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb2.setCartesianDisp(ev.getDofs(DofType.CartCommands));
                log.Debug("Current " + lbcb2);
                double[] carts = lbcb2.getActuatorDisp();
                cmp.Compare(ev.getDofs(DofType.ActCommands), carts);
            }
        }
    }
}
