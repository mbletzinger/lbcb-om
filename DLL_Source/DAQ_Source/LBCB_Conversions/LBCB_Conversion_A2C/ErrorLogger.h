#pragma once
#include<string>
#include<sstream>
#include<ostream>
#include <windows.h>
#include <process.h>

using namespace std;

class ErrorLogger
{
public:
	ErrorLogger(string prefix);
	~ErrorLogger(void);
	void flush();
	static void setFile(string Filename);
	void addedError();
	ostream& getErrorStream();
	bool hasError();
	static void InitCSV();
private:
	ostringstream ErrorStream;
	static string LogFilename;
	string prefix;
	bool ContainsErrors;
	static CRITICAL_SECTION critical_section;
};
