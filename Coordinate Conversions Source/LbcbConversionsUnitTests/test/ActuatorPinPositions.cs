using LbcbConversions;
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
    class ActuatorPinPositions
    {
        private ILog log = LogManager.GetLogger(typeof(ActuatorPinPositions));
        private Assembly _assembly;
        private LbcbActuatorPosition[] actuatorPositions = new LbcbActuatorPosition[6];
        public ActuatorPinPositions(Assembly _assembly)
        {
            this._assembly = _assembly;
        }

        public void loadLbcb(String resourceName)
        {
            StringBuilder canonicalFilename = new StringBuilder("LbcbConversionsUnitTests.resources.");
            canonicalFilename.Append(resourceName);
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
                return;
            }
            if (strm == null)
            {
                log.Error("Cannot open file \"" + canonicalFilename.ToString() + "\" because the stream is null");
                return;
            }
            StreamReader _textStreamReader = new StreamReader(strm);
            int actuator = 0;
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
                double[] values = convertTokens(tokens);
                actuatorPositions[actuator] = new LbcbActuatorPosition(Enum.ToObject(typeof(ActuatorLabels),actuator).ToString(), values);
                log.Debug("Created Actuator Position: " + actuatorPositions[actuator]);
                actuator++;
            }
        }
        private double[] convertTokens(string[] tokens)
        {
            double[] values = new double[tokens.Length];
            for (int i = 0; i < tokens.Length; i++)
            {
                double val;
                try
                {
                    val = double.Parse(tokens[i]);
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
        public LbcbActuatorPosition[] getActuatorPositions()
        {
            return actuatorPositions;
        }
    }
}
