
#include "ThreadLocalObjects.h"

ThreadLocalObjects::ThreadLocalObjects(void)
{
}

ThreadLocalObjects::~ThreadLocalObjects(void)
{
}
void ThreadLocalObjects::SetErrorLogger(ErrorLogger* elog)
{
	m_log = elog;
}
ErrorLogger* ThreadLocalObjects::GetErrorLogger()
{
	return m_log;
}
void ThreadLocalObjects::SetMemoryCounterFactory(MemoryCounterFactory* lmcnt)
{
	m_mcnt = lmcnt;
}
MemoryCounterFactory* ThreadLocalObjects::GetMemoryCounterFactory()
{
	return m_mcnt;
}
void ThreadLocalObjects::AddMemoryCounter(string name) {
	MemoryCounter* mc = new MemoryCounter(name);
	m_mcnt->SetMemoryCounter(name,mc);
	mc->SetErrorLogger(m_log);
}
void ThreadLocalObjects::flush() {
	m_log->flush(m_threadid);
}
void ThreadLocalObjects::setThreadId(DWORD id) {
	m_threadid = id;
}