using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;


namespace LbcbConversionsUnitTests.test
{
    [SetUpFixture]
    public class NunitSetup
    {
        [SetUp]
        public void RunBeforeAnyTests()
        {
            Console.WriteLine("Yay NUnit found me!!!");
            Assembly assembly = Assembly.GetExecutingAssembly();
            string[] names = assembly.GetManifestResourceNames();
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
            Console.WriteLine(msg);
            Stream strm = null;
            String file = "LbcbConversionsUnitTests.resources.nunitLog.config";
            try
            {
                strm = assembly.GetManifestResourceStream(file);
            }
            catch (Exception e)
            {
                Console.WriteLine("NunitSetup ERROR Cannot open file \"" + file + "\" because:" + e.Message);
                return;
            }
            if (strm == null)
            {
                Console.WriteLine("NunitSetup ERROR Cannot open file \"" + file + "\" because the stream is null");
                return;
            }
            log4net.Config.XmlConfigurator.Configure(strm);
            log4net.Util.LogLog.InternalDebugging = true;
        }

        [TearDown]
        public void RunAfterAnyTests()
        {
            // ...
        }
    }
}
