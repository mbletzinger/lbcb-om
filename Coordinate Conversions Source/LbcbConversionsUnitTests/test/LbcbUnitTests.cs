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
        private ExpectedLbcbValues[] lexpected1;
        private ExpectedLbcbValues[] lexpected2;
        private ExpectedTransducerValues[] sexpected;
        private Lbcb lbcb1;
        private Lbcb lbcb2;
        private TransducerSpace sensors1;
        private TransducerSpace sensors2;
        private static readonly ILog log = LogManager.GetLogger(typeof(LbcbUnitTests));

        [NUnit.Framework.SetUp]
        public void setup()
        {
            LbcbData data = new LbcbData("LBCB1_Snapshot.txt");
            lexpected1 = data.getExpectedLbcbValues();
            data = new LbcbData("LBCB2_Snapshot.txt");
            lexpected2 = data.getExpectedLbcbValues();
            TransducerTestData sdata = new TransducerTestData("ElasticDefReadings_2015_03_27_10_29_14.txt", 
                "ExternalSensors_2015_03_27_10_29_14.txt");
            sexpected = sdata.getExpectedTransducerValues();
            TransducerPinLocationData pins = new TransducerPinLocationData(Assembly.GetExecutingAssembly());
            pins.loadPins("Lbcb1PinPositions.txt");
            double[] errorWindow = new double[] { 0.00001, 0.00001, 0.00001, 0.00001, 0.00001, 0.00001 };
            lbcb1 = new Lbcb("LBCB 1", pins.getPins(), errorWindow);
            pins.loadPins("Lbcb2PinPositions.txt");
            lbcb2 = new Lbcb("LBCB 2", pins.getPins(), errorWindow);
            pins.loadPins("L1_SensorPins.txt");
            pins.loadLabels("L1_SensorLabels.txt");
            sensors1 = new TransducerSpace("Sensors 1", pins.getPins(), pins.getLabels(), errorWindow);
            pins.loadPins("L2_SensorPins.txt");
            pins.loadLabels("L2_SensorLabels.txt");
            sensors2 = new TransducerSpace("Sensors 2", pins.getPins(), pins.getLabels(), errorWindow);

        }
        [NUnit.Framework.Test]
        public void ConvertActuatorDisplacements2Cartesian()
        {
            foreach (ExpectedLbcbValues ev in lexpected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                double[] carts = lbcb1.getCartesianDisp();
                cmp.Compare(ev.getDofs(DofType.CartCommands), carts);
            }
            foreach (ExpectedLbcbValues ev in lexpected2)
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
            foreach (ExpectedLbcbValues ev in lexpected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                lbcb1.setActuatorForce(ev.getDofs(DofType.ActLoadCells));
                double[] carts = lbcb1.getCartesianForce();
                cmp.Compare(ev.getDofs(DofType.CartForces), carts);
            }
            foreach (ExpectedLbcbValues ev in lexpected2)
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
            foreach (ExpectedLbcbValues ev in lexpected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb1.setCartesianDisp(ev.getDofs(DofType.CartCommands));
                log.Debug("Current " + lbcb1);
                double[] carts = lbcb1.getActuatorDisp();
                cmp.Compare(ev.getDofs(DofType.ActCommands), carts);
            }
            log.Debug("Start " + lbcb2);
            foreach (ExpectedLbcbValues ev in lexpected2)
            {
                CompareDoubleLists cmp = new CompareDoubleLists();
                lbcb2.setCartesianDisp(ev.getDofs(DofType.CartCommands));
                log.Debug("Current " + lbcb2);
                double[] carts = lbcb2.getActuatorDisp();
                cmp.Compare(ev.getDofs(DofType.ActCommands), carts);
            }
        }
        [NUnit.Framework.Test]
        public void ConvertSensorDisplacements2Cartesian()
        {
            foreach (ExpectedTransducerValues ev in sexpected)
            {
                CompareDoubleLists cmp = new CompareDoubleLists(0.0005);
                sensors1.setTransducerDisp(ev.getDofs(TransType.L1_Sensors));
                double[] carts = sensors1.getCartesianDisp();
                cmp.Compare(ev.getDofs(TransType.L1_Cart), carts);
            }

        }
    }
}
