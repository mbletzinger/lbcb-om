
#include "ThreadLocalFactory.h"
#include <process.h>
CRITICAL_SECTION ThreadLocalFactory::critical_section;

ThreadLocalFactory::ThreadLocalFactory(void)
{
}

ThreadLocalFactory::~ThreadLocalFactory(void)
{
	DeleteCriticalSection(&critical_section);
}
void ThreadLocalFactory::SetLocalObjects(DWORD thread, ThreadLocalObjects* tlo)
{
	EnterCriticalSection(&critical_section);
	ObjMap[thread] = tlo;
	LeaveCriticalSection(&critical_section);
}
ThreadLocalObjects* ThreadLocalFactory::GetLocalObjects(DWORD thread)
{
	EnterCriticalSection(&critical_section);
	return ObjMap[thread];
	LeaveCriticalSection(&critical_section);
}
void ThreadLocalFactory::InitCSV()
{
	InitializeCriticalSection(&critical_section);
}

