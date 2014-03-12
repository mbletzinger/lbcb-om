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
        private Assembly _assembly;
        private ExpectedLbcbValues[] expected1;
        private ExpectedLbcbValues[] expected2;
        private Lbcb lbcb1;
        private Lbcb lbcb2;
        private static readonly ILog log = LogManager.GetLogger(typeof(LbcbConversionsUnitTests));

        [NUnit.Framework.SetUp]
        public void setup()
        {
            _assembly = Assembly.GetExecutingAssembly();
            expected1 = parseDataFile("LBCB1_Snapshot.txt");
            expected2 = parseDataFile("LBCB2_Snapshot.txt");
            ActuatorPinTests l1pins = new ActuatorPinTests(Assembly.GetExecutingAssembly());
            ActuatorPinTests l2pins = new ActuatorPinTests(Assembly.GetExecutingAssembly());
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
                CompareDoubleLists cmp = new CompareDoubleLists(ev.getDofs(DofType.CartCommands));
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                double [] carts = lbcb1.getCartesianDisp();
                cmp.Compare(carts);
            }
 
         }
        [NUnit.Framework.Test]
        public void ConvertActuatorForces2Cartesian()
        {
            foreach (ExpectedLbcbValues ev in expected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists(ev.getDofs(DofType.CartForces));
                lbcb1.setActuatorDisp(ev.getDofs(DofType.ActCommands));
                lbcb1.setActuatorForce(ev.getDofs(DofType.ActLoadCells));
                double[] carts = lbcb1.getCartesianForce();
                cmp.Compare(carts);
            }

        }
        [NUnit.Framework.Test]
        public void ConvertCartesian2Actuator()
        {
            log.Debug("Start " + lbcb1);
            foreach (ExpectedLbcbValues ev in expected1)
            {
                CompareDoubleLists cmp = new CompareDoubleLists(ev.getDofs(DofType.ActLvdts));
                lbcb1.setCartesianDisp(ev.getDofs(DofType.CartCommands));
                log.Debug("Current " + lbcb1);
                double[] carts = lbcb1.getActuatorDisp();
                cmp.Compare(carts);
            }
        }
        private ExpectedLbcbValues[] parseDataFile(String filename)
        {
            const int timeIndex = 4;

            List<ExpectedLbcbValues> result = new List<ExpectedLbcbValues>();

            StringBuilder canonicalFilename = new StringBuilder("LbcbConversionsUnitTests.resources.");
            canonicalFilename.Append(filename);
//            log.Debug("Opening file \"" + canonicalFilename + "\"");
            Stream strm = null;
            try
            {
                string[] names = _assembly.GetManifestResourceNames();
                StringBuilder msg = new StringBuilder("Resource Names [ ");
                bool first = true;
                foreach (var item in names)
                {
                    if (first == false)
                    {
                        msg.Append(", ");
                    }
                    first = false;
                    msg.Append(item);
                }
                msg.Append(" ]");
                log.Debug(msg);
                strm = _assembly.GetManifestResourceStream(canonicalFilename.ToString());
            }
            catch (Exception e)
            {
                log.Error("Cannot open file \"" + canonicalFilename.ToString() + "\" because:", e);
                return null;
            }
            if (strm == null)
            {
                log.Error("Cannot open file \"" + canonicalFilename.ToString() + "\" because the stream is null");
                return null;
            }
            StreamReader _textStreamReader = new StreamReader(strm);
            while (true)
            {
                string line;
                try
                {
                    line = _textStreamReader.ReadLine();
                }
                catch (SystemException e)
                {
                    log.Debug("Parsing of file \"" + canonicalFilename + "\" aborted", e);
                    break;
                }
                if (line == null)
                {
                    log.Debug("Parsing of file \"" + canonicalFilename + "\" finished");
                    break;
                }
                string[] tokens = line.Split('\t');
                ExpectedLbcbValues lbcb = new ExpectedLbcbValues();
                int offset = 0;
                double[] values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.CartCommands, values);
                offset += 6;
                values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.CartDisplacements, values);
                offset += 6;
                values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.CartForces, values);
                offset += 6;
                values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.ActCommands, values);
                offset += 6;
                values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.ActLvdts, values);
                offset += 6;
                values = convertTokens(tokens, timeIndex + offset);
                lbcb.setDofs(DofType.ActLoadCells, values);
//                log.Debug("LBCB added " + lbcb.ToString());
                result.Add(lbcb);
            }
            return result.ToArray();
        }

        private double[] convertTokens(string[] tokens, int offset)
        {
            double[] values = new double[6];
            for (int i = 0; i < 6; i++)
            {
                double val;
                try
                {
                    val = double.Parse(tokens[i + offset]);
                    values[i] = val;
                }
                catch (Exception e)
                {
                    log.Error("Could not parse \"" + tokens[i] + "\" because", e);
                    return null;
                }
            }

            return values;
        }
    }
}
