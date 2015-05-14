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
    public class TransducerTestData
    {
        private ExpectedTransducerValues[] expected;
        private ILog log = LogManager.GetLogger(typeof(TransducerTestData));
        public TransducerTestData(String cartFilename, String sensorFilename)
        {
            const int timeIndex = 3;

            List<ExpectedTransducerValues> result = new List<ExpectedTransducerValues>();
            ExpectedTransducerValues transducer = new ExpectedTransducerValues();

                List<String[]> ctokens = readTokens(cartFilename);
                List<String[]> stokens = readTokens(sensorFilename);
            for(int r = 0; r < ctokens.Count; r++) {
                int offset = 0;
                double[] values = convertTokens(ctokens[r], timeIndex + offset);
                transducer.setDofs(TransType.L1_Cart, values);
                values = convertTokens(stokens[r], timeIndex + offset);
                transducer.setDofs(TransType.L1_Sensors, values);
                offset += 6;
                values = convertTokens(stokens[r], timeIndex + offset);
                transducer.setDofs(TransType.L2_Sensors, values);
                offset += 6;
                values = convertTokens(ctokens[r], timeIndex + offset);
                transducer.setDofs(TransType.L2_Cart, values);
                result.Add(transducer);
            }
            expected = result.ToArray();
        }

        private double[] convertTokens(string[] tokens, int offset)
        {
            double[] values = new double[6];
            //String line = "";
            //Boolean first = true;
            //foreach (String t in tokens)
            //{
            //    line += (first ? "" : ",") + t;
            //    first = false;
            //}
            //log.Debug("Parsing \"" + line + "\"\n starting at " + offset);
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
        public ExpectedTransducerValues[] getExpectedTransducerValues()
        {
            return expected;
        }
        private List<String []> readTokens(String filename)
        {
            List<String[]> result = new List<String[]>(); 
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
                result.Add(tokens);
            }
            return result;
        }
    }
}
