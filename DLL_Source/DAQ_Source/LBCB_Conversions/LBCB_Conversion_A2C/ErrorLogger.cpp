#include "ErrorLogger.h"
#include <fstream>

using namespace std;

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
	ofstream Logout (LogFilename.c_str(), ios_base::out | ios_base::app);
	Logout << ErrorStream.str();
	Logout.close();
	ContainsErrors = false;
}
void ErrorLogger::setFile(string Filename)
{
	LogFilename = Filename;
}
void ErrorLogger::addedError()
{
	ErrorStream << endl;
	ContainsErrors = true;
}

bool ErrorLogger::hasError()
{
	return ContainsErrors;
	}

ostream& ErrorLogger::getErrorStream()
{
	return ErrorStream;
}