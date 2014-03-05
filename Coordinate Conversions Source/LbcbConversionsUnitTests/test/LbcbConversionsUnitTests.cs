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
        private ExpectedLbcbValues[] albcb1;
        private ExpectedLbcbValues[] albcb2;
        private static readonly ILog log = LogManager.GetLogger(typeof(LbcbConversionsUnitTests));

        [NUnit.Framework.SetUp]
        public void setup()
        {
            _assembly = Assembly.GetExecutingAssembly();
            albcb1 = parseDataFile("LBCB1_Snapshot.txt");
            albcb2 = parseDataFile("LBCB2_Snapshot.txt");

        }
        [NUnit.Framework.Test]
        [NUnit.Framework.Category("LU")]
        public void ConvertActuator2Cartesian()
        {
        }
        private ExpectedLbcbValues[] parseDataFile(String filename)
        {
            const int timeIndex = 2;

            List<ExpectedLbcbValues> result = new List<ExpectedLbcbValues>();

            StringBuilder canonicalFilename = new StringBuilder("LbcbConversionsUnitTests.resources.");
            canonicalFilename.Append(filename);
            log.Debug("Opening file \"" + canonicalFilename + "\"");
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
                log.Debug("LBCB added " + lbcb.ToString());
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
