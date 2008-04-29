
#include "ThreadLocalObjects.h"

ThreadLocalObjects::ThreadLocalObjects(void)
{
}

ThreadLocalObjects::~ThreadLocalObjects(void)
{
}
void ThreadLocalObjects::SetErrorLogger(ErrorLogger* elog)
{
	log = elog;
}
ErrorLogger* ThreadLocalObjects::GetErrorLogger()
{
	return log;
}
void ThreadLocalObjects::SetMemoryCounterFactory(MemoryCounterFactory* lmcnt)
{
	mcnt = lmcnt;
}
MemoryCounterFactory* ThreadLocalObjects::GetMemoryCounterFactory()
{
	return mcnt;
}
void ThreadLocalObjects::AddMemoryCounter(string name) {
	MemoryCounter* mc = new MemoryCounter(name);
	mcnt->SetMemoryCounter(name,mc);
	mc->SetErrorLogger(log);
}
