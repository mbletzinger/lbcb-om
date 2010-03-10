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
	void setThreadId(DWORD id);
	void flush();
private:
	ErrorLogger* m_log;
	MemoryCounterFactory* m_mcnt;
	DWORD m_threadid;
};
