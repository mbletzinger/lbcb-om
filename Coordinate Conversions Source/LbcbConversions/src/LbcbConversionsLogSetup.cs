using log4net;
using log4net.Appender;
using log4net.Repository;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace LbcbConversions
{
    public class LbcbConversionsLogSetup
    {
        public void loadLogInstructions()
        {
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
            String file = "LbcbConversions.resources.LogFormat.log";
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
        public void loadLogInstructions(String path) {
            log4net.Config.XmlConfigurator.Configure(new FileInfo(path));
            log4net.Util.LogLog.InternalDebugging = true;

        }
        public void setLogFile(string path)
        {
            //get the current logging repository for this application
            ILoggerRepository repository = LogManager.GetRepository();
            //get all of the appenders for the repository
            IAppender[] appenders = repository.GetAppenders();
            //only change the file path on the 'FileAppenders'
            foreach (IAppender appender in (from iAppender in appenders
                                            where iAppender is FileAppender
                                            select iAppender))
            {
                FileAppender fileAppender = appender as FileAppender;
                fileAppender.File = path;
                //make sure to call fileAppender.ActivateOptions() to notify the logging
                //sub system that the configuration for this appender has changed.
                fileAppender.ActivateOptions();
            }
        }
    }
}
