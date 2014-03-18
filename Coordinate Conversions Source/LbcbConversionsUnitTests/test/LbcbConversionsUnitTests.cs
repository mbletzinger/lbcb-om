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
    public class LbcbConversionsUnitTests
    {
        private ExpectedLbcbValues[] expected1;
        private ExpectedLbcbValues[] expected2;
        private LbcbConversionFactory lbcbFactory;
        private static readonly ILog log = LogManager.GetLogger(typeof(LbcbConversionsUnitTests));

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
            lbcbFactory = new LbcbConversionFactory();
            double[] motionCenter = new double[] { 0.0, 0.0, 0.0 };
            lbcbFactory.setLbcb(false, l1pins.getFlattenedPins(),motionCenter);
            lbcbFactory.setLbcb(true, l2pins.getFlattenedPins(), motionCenter);
            string [] lnames = new string [] {"Command", "Readings"};
            foreach (string n in lnames)
            {
                lbcbFactory.create(n + " 1", false);
                lbcbFactory.create(n + " 2", true);
            }
        }
        [NUnit.Framework.Test]
        public void ConvertActuatorDisplacements2Cartesian()
        {
            foreach (ExpectedLbcbValues ev in expected1)
            {
                LbcbConversion control1 = lbcbFactory.get("Command 1");
                LbcbConversion daq1 = lbcbFactory.get("Readings 1");
                CompareDoubleLists cmp = new CompareDoubleLists();
                double[] carts = control1.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActCommands));
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);
                carts = control1.getCartesianDisplacements();
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);

                carts = daq1.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActLvdts));
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
                carts = daq1.getCartesianDisplacements();
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
            }
            foreach (ExpectedLbcbValues ev in expected2)
            {
                LbcbConversion control2 = lbcbFactory.get("Command 2");
                LbcbConversion daq2 = lbcbFactory.get("Readings 2");
                CompareDoubleLists cmp = new CompareDoubleLists();
                double[] carts = control2.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActCommands));
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);
                carts = control2.getCartesianDisplacements();
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);

                carts = daq2.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActLvdts));
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
                carts = daq2.getCartesianDisplacements();
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
            }
 
         }
        [NUnit.Framework.Test]
        public void ConvertActuatorForces2Cartesian()
        {
            foreach (ExpectedLbcbValues ev in expected1)
            {
                LbcbConversion daq1 = lbcbFactory.get("Readings 1");
                CompareDoubleLists cmp = new CompareDoubleLists();
                double[] carts = daq1.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActLvdts));
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
                carts = daq1.convertActuator2CartesianForces(ev.getDofs(DofType.ActLoadCells));
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
                carts = daq1.getCartesianForces();
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
            }
            foreach (ExpectedLbcbValues ev in expected2)
            {
                LbcbConversion daq2 = lbcbFactory.get("Readings 2");
                CompareDoubleLists cmp = new CompareDoubleLists();
                double [] carts = daq2.convertActuator2CartesianDisplacements(ev.getDofs(DofType.ActLvdts));
                cmp.Compare(ev.getDofs(DofType.CartDisplacements), carts);
                carts = daq2.convertActuator2CartesianForces(ev.getDofs(DofType.ActLoadCells));
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
                carts = daq2.getCartesianForces();
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
            }
        }
        [NUnit.Framework.Test]
        public void ConvertCartesian2Actuator()
        {
            List2String l2s = new List2String();
            foreach (ExpectedLbcbValues ev in expected1)
            {
                LbcbConversion control1 = lbcbFactory.get("Command 1");
                LbcbConversion daq1 = lbcbFactory.get("Readings 1");
                CompareDoubleLists cmp = new CompareDoubleLists();
                log.Debug("Setting Cart Disp:" + l2s.ToString(ev.getDofs(DofType.CartCommands)));
                log.Debug("Before " + control1.getLbcb());
                double[] acts = control1.convertCartesian2ActuatorDisplacements(ev.getDofs(DofType.CartCommands));
                log.Debug("After " + control1.getLbcb());
                cmp.Compare(ev.getDofs(DofType.ActCommands), acts);
                acts = control1.getActuatorDisplacements();
                cmp.Compare(ev.getDofs(DofType.ActCommands), acts);

                acts = daq1.convertCartesian2ActuatorDisplacements(ev.getDofs(DofType.CartDisplacements));
                cmp.Compare(ev.getDofs(DofType.ActLvdts), acts);
                acts = daq1.getActuatorDisplacements();
                cmp.Compare(ev.getDofs(DofType.ActLvdts), acts);
            }
            foreach (ExpectedLbcbValues ev in expected2)
            {
                LbcbConversion control2 = lbcbFactory.get("Command 2");
                LbcbConversion daq2 = lbcbFactory.get("Readings 2");
                CompareDoubleLists cmp = new CompareDoubleLists();
                log.Debug("Setting Cart Disp:" + l2s.ToString(ev.getDofs(DofType.CartCommands)));
                double[] acts = control2.convertCartesian2ActuatorDisplacements(ev.getDofs(DofType.CartCommands));
                cmp.Compare(ev.getDofs(DofType.ActCommands), acts);
                acts = control2.getActuatorDisplacements();
                cmp.Compare(ev.getDofs(DofType.ActCommands), acts);

                acts = daq2.convertCartesian2ActuatorDisplacements(ev.getDofs(DofType.CartDisplacements));
                cmp.Compare(ev.getDofs(DofType.ActLvdts), acts);
                acts = daq2.getActuatorDisplacements();
                cmp.Compare(ev.getDofs(DofType.ActLvdts), acts);
            }
        }
    }
}
