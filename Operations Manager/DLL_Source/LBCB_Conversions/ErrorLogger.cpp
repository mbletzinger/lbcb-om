#include "ErrorLogger.h"
#include <fstream>
using namespace std;

CRITICAL_SECTION ErrorLogger::critical_section;
string ErrorLogger::LogFilename("c:\\LbcbDllLog.txt");

ErrorLogger::ErrorLogger(DWORD id) : threadid(id)
{
	ContainsErrors = false;
	ErrorStream = new ostringstream();
}

ErrorLogger::~ErrorLogger(void)
{
}
void ErrorLogger::SetPrefix(string pfx)
{
	prefix = pfx;
}

void ErrorLogger::flush()
{
	if(! ContainsErrors) return;
	ostringstream prfx;
	prfx<<prefix<<"["<<threadid<<"]";

	EnterCriticalSection(&critical_section);
	ofstream Logout (LogFilename.c_str(), ios_base::out | ios_base::app);
	Logout << prfx.str()<< ":START"<<endl<<ErrorStream->str()<<prfx.str()<<":END"<<endl;
	Logout.close();
	LeaveCriticalSection(&critical_section);
	delete ErrorStream;
	ErrorStream = new ostringstream();
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
	*ErrorStream << endl;
	ContainsErrors = true;
}

bool ErrorLogger::hasError()
{
	return ContainsErrors;
	}

ostream& ErrorLogger::getErrorStream()
{
	return *ErrorStream;
}
void ErrorLogger::InitCSV()
{
	InitializeCriticalSection(&critical_section);
}
