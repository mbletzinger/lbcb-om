
#include "ThreadLocalFactory.h"
#include <process.h>

ThreadLocalFactory::ThreadLocalFactory(void)
{
	errors = new ErrorLogger();
}

ThreadLocalFactory::~ThreadLocalFactory(void)
{
}
void ThreadLocalFactory::SetLocalObjects(DWORD thread, ThreadLocalObjects* tlo)
{
	critical_section.Enter();
	tlo->SetErrorLogger(errors);
	tlo->setThreadId(thread);
	ObjMap[thread] = tlo;
	critical_section.Leave();
}
ThreadLocalObjects* ThreadLocalFactory::GetLocalObjects(DWORD thread)
{
	ThreadLocalObjects* result;
	critical_section.Enter();
	result =  ObjMap[thread];
	critical_section.Leave();
	return result;
}
ErrorLogger* ThreadLocalFactory::getErrorLog()
{
	return errors;
}
