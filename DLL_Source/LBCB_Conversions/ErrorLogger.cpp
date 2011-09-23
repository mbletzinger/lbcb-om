#include <fstream>
using namespace std;
#include "ErrorLogger.h"

ErrorLogger::~ErrorLogger(void)
{
	m_ContainsErrors = false;
	m_ErrorStream = new ostringstream();
	m_LogFilename = "c:\\LbcbDllLog.txt";
}
void ErrorLogger::SetPrefix(string pfx)
{
	m_prefix = pfx;
}

void ErrorLogger::flush(DWORD threadid)
{
	if(! m_ContainsErrors) return;
	ostringstream prfx;
	prfx<<m_prefix<<"["<<threadid<<"]";

	m_CriticalSection.Enter();
	string lfn = m_LogFilename;
	m_CriticalSection.Leave();
//	ofstream Logout (lfn.c_str(), ios_base::out | ios_base::app);
//	Logout << prfx.str()<< ":START"<<endl<<m_ErrorStream->str()<<prfx.str()<<":END"<<endl;
//	Logout.close();
//	delete m_ErrorStream;
//	m_ErrorStream = new ostringstream();
	m_ContainsErrors = false;
}
void ErrorLogger::setFile(string Filename)
{
	m_CriticalSection.Enter();
	m_LogFilename = Filename;
	m_CriticalSection.Leave();
}
void ErrorLogger::addedError()
{
	*m_ErrorStream << endl;
	m_ContainsErrors = true;
}

bool ErrorLogger::hasError()
{
	return m_ContainsErrors;
	}

ostream& ErrorLogger::getErrorStream()
{
	return *m_ErrorStream;
}
