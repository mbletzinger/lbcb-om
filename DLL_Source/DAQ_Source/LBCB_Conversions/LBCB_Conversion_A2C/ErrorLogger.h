#pragma once
#include<string>
#include<sstream>
#include<ostream>

using namespace std;

class ErrorLogger
{
public:
	ErrorLogger(void);
	~ErrorLogger(void);
	void flush();
	void setFile(string Filename);
	void addedError();
	ostream& getErrorStream();
	bool hasError();
private:
	ostringstream ErrorStream;
	string LogFilename;
	bool ContainsErrors;
};
