#pragma once

#include <windows.h>
#include <map>
#include "ThreadLocalObjects.h"
#include "ErrorLogger.h"

using namespace std;

class ThreadLocalFactory
{
public:
	ThreadLocalFactory(void);
	~ThreadLocalFactory(void);
	void SetLocalObjects(DWORD thread, ThreadLocalObjects* tlo);
	ThreadLocalObjects* GetLocalObjects(DWORD thread);
	ErrorLogger* getErrorLog();
private:
	map<DWORD,ThreadLocalObjects*> ObjMap;
	CriticalSection critical_section;
	ErrorLogger* errors;
};
