#pragma once

#include "ErrorLogger.h"
#include <string>
using namespace std;

class MemoryCounter
{
public:
	MemoryCounter(void);
	MemoryCounter(string MyName);
	~MemoryCounter(void);
	void UpdateCount(int count);
	void LogMemory();
	static void SetErrorLogger(ErrorLogger* elog);
	void SetName(string Name);
private:
	static ErrorLogger* log;
	long memCount;
	string Name;
};
