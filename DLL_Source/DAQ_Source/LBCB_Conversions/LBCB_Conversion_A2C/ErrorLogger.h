#pragma once
#include<string>
#include<sstream>
using namespace std;

class ErrorLogger
{
public:
	ErrorLogger(void);
	~ErrorLogger(void);
	void flush();
	void setFile(string Filename);
	void addError(string Error);
private:
	ostringstream ErrorStream;
	string LogFilename;
	bool ContainsErrors;
};
