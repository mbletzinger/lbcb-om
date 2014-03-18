using log4net;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversionsUnitTests.test
{
    public class LbcbData
    {
        private ExpectedLbcbValues[] expected;
        private ILog log = LogManager.GetLogger(typeof(LbcbData));
        public LbcbData(String filename)
        {
            const int timeIndex = 4;

            List<ExpectedLbcbValues> result = new List<ExpectedLbcbValues>();
            Assembly _assembly = Assembly.GetExecutingAssembly();
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
                return;
            }
            if (strm == null)
            {
                log.Error("Cannot open file \"" + canonicalFilename.ToString() + "\" because the stream is null");
                return;
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
            expected = result.ToArray();
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
        public ExpectedLbcbValues[] getExpectedLbcbValues()
        {
            return expected;
        }
    }
}
