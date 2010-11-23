#pragma once
#include<string>
#include<sstream>
#include<ostream>
#include <windows.h>
#include <process.h>
#include "CriticalSection.h"

using namespace std;

class ErrorLogger
{
public:
	~ErrorLogger(void);
	void flush(DWORD threadid);
	void setFile(string Filename);
	void addedError();
	ostream& getErrorStream();
	bool hasError();
	void SetPrefix(string pfx);
private:
	ostringstream* m_ErrorStream;
	string m_LogFilename;
	string m_prefix;
	bool m_ContainsErrors;
	CriticalSection m_CriticalSection;
};
