#include "ErrorLogger.h"
#include <fstream>
using namespace std;

CRITICAL_SECTION ErrorLogger::critical_section;
string ErrorLogger::LogFilename = NULL;

ErrorLogger::ErrorLogger(string myprefix) : prefix(myprefix)
{
	ContainsErrors = false;
}

ErrorLogger::~ErrorLogger(void)
{
}

void ErrorLogger::flush()
{
	if(! ContainsErrors) return;
	EnterCriticalSection(&critical_section);
	ofstream Logout (LogFilename.c_str(), ios_base::out | ios_base::app);
	Logout << prefix<< ":START"<<endl<<ErrorStream.str()<<prefix<<":END"<<endl;
	Logout.close();
	LeaveCriticalSection(&critical_section);
	ContainsErrors = false;
}
void ErrorLogger::setFile(string Filename)
{
	EnterCriticalSection(&critical_section);
	LogFilename = Filename;
	LeaveCriticalSection(&critical_section);
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
void ErrorLogger::InitCSV()
{
	InitializeCriticalSection(&critical_section);
}
