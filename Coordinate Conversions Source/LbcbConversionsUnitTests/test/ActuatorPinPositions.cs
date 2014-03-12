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
        private double[][] pins = new double[6][];

        public ActuatorPinPositions(Assembly _assembly)
        {
            this._assembly = _assembly;
        }
        private Stream open(String resourceName)
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
                return null;
            }
            if (strm == null)
            {
                log.Error("Cannot open file \"" + canonicalFilename.ToString() + "\" because the stream is null");
                return null;
            }

            return strm;
        }
        public void loadPins(String resourceName)
        {
            Stream strm = open(resourceName);
            if (strm == null)
            {
                log.Error("Aborting LBCB pin position load");
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
                    log.Debug("Parsing of file \"" + resourceName + "\" aborted", e);
                    break;
                }
                if (line == null)
                {
                    log.Debug("Parsing of file \"" + resourceName + "\" finished");
                    break;
                }
                string[] tokens = line.Split('\t');
                double[] values = convertTokens(tokens);
                pins[actuator] = values;
                actuator++;
            }
        }
        public LbcbActuatorPosition [] getActuatorPositions() {
        LbcbActuatorPosition[] actuatorPositions = new LbcbActuatorPosition[6];
            for (int a = 0; a < 6; a++)
            {
                actuatorPositions[a] = new LbcbActuatorPosition(((ActuatorLabels)a).ToString(), pins[a]);
                log.Debug("Created Actuator Position: " + actuatorPositions[a]);
            }
            return actuatorPositions;
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
        public double[][] getPins()
        {
            return pins;
        }
    }
}
