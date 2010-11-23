#pragma once

#include "ErrorLogger.h"
#include <string>
using namespace std;

class MemoryCounter
{
public:
	MemoryCounter(void);
	MemoryCounter(string MyName);
	MemoryCounter(const MemoryCounter&mcnt);
	~MemoryCounter(void);
	void UpdateCount(int count);
	void LogMemory();
	void SetErrorLogger(ErrorLogger* elog);
	void SetName(string Name);

	MemoryCounter& operator=(const MemoryCounter&mcnt);
	bool operator<(const MemoryCounter&mcnt);
	bool operator==(const MemoryCounter&mcnt);
	
private:
	ErrorLogger* log;
	long memCount;
	string Name;
};
