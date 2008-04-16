#include "ErrorLogger.h"
#using <mscorlib.dll> 
using namespace System;
using namespace System::IO; 

ErrorLogger::ErrorLogger(void)
{
	ContainsErrors = false;
}

ErrorLogger::~ErrorLogger(void)
{
}

void ErrorLogger::flush()
{
	if(! ContainsErrors) return;

	String^ SFilename = gcnew String(LogFilename.c_str());
	String^ SMsg = gcnew String(ErrorStream.str().c_str());
	StreamWriter^ sw = File::AppendText(SFilename);
	sw->Write(SMsg);
	sw->Close();

	ContainsErrors = false;
}
void ErrorLogger::setFile(string Filename)
{
	String^ SFilename = gcnew String(Filename.c_str());
	if (!File::Exists(SFilename))
	{
		StreamWriter^ sw = File::CreateText(SFilename);
		sw->WriteLine("Starting DLL Log");
		sw->Close();
	}
	LogFilename = Filename;
}
void ErrorLogger::addError(string Error)
{
	ErrorStream << Error << endl;
	ContainsErrors = true;
}
