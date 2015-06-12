﻿using LbcbConversions;
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
    class TransducerPinLocationData
    {
        private ILog log = LogManager.GetLogger(typeof(TransducerPinLocationData));
        private Assembly _assembly;
        private double[][] pins = new double[6][];
        private String[] labels = new String[6];

        public TransducerPinLocationData(Assembly _assembly)
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
            int transducer = 0;
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
                pins[transducer] = values;
                transducer++;
            }
            _textStreamReader.Close();
            _textStreamReader.Dispose();
        }
        public void loadLabels(String resourceName)
        {
            Stream strm = open(resourceName);
            if (strm == null)
            {
                log.Error("Aborting LBCB pin position load");
                return;
            }
            StreamReader _textStreamReader = new StreamReader(strm);
                string line;
                try
                {
                    line = _textStreamReader.ReadLine();
                }
                catch (SystemException e)
                {
                    log.Debug("Parsing of file \"" + resourceName + "\" aborted", e);
                    _textStreamReader.Close();
                    _textStreamReader.Dispose();
                    return;
                }
                if (line == null)
                {
                    log.Debug("Parsing of file \"" + resourceName + "\" finished");
                    _textStreamReader.Close();
                    _textStreamReader.Dispose();
                    return;
                }
                labels = line.Split('\t');
        }
        public DispTransducer[] getActuators()
        {
        DispTransducer[] actuators = new DispTransducer[6];
            for (int a = 0; a < 6; a++)
            {
                actuators[a] = new DispTransducer(((ActuatorLabels)a).ToString(), pins[a]);
                log.Debug("Created Actuator Position: " + actuators[a]);
            }
            return actuators;
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
        public String [] getLabels()
        {
            return labels;
        }
        public double[] getFlattenedPins()
        {
            double[] result = new double[36];
            for (int r = 0; r < 6; r++)
            {
                pins[r].CopyTo(result, r * 6);
            }
            return result;
        }
    }
}