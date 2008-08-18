#pragma once
#include "MemoryCounterFactory.h"
#include "ErrorLogger.h"

class ThreadLocalObjects
{
public:
	ThreadLocalObjects(void);
	~ThreadLocalObjects(void);
	void SetErrorLogger(ErrorLogger* log);
	ErrorLogger* GetErrorLogger();
	void SetMemoryCounterFactory(MemoryCounterFactory* mcnt);
	MemoryCounterFactory* GetMemoryCounterFactory();
	void AddMemoryCounter(string name);
private:
	ErrorLogger* log;
	MemoryCounterFactory* mcnt;
};
