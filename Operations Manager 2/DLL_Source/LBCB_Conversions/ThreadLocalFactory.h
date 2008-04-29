#pragma once

#include <windows.h>
#include <map>
#include "ThreadLocalObjects.h"

using namespace std;

class ThreadLocalFactory
{
public:
	ThreadLocalFactory(void);
	~ThreadLocalFactory(void);
	void SetLocalObjects(DWORD thread, ThreadLocalObjects* tlo);
	ThreadLocalObjects* GetLocalObjects(DWORD thread);
	static void InitCSV();
private:
	map<DWORD,ThreadLocalObjects*> ObjMap;
	static CRITICAL_SECTION critical_section;
};
