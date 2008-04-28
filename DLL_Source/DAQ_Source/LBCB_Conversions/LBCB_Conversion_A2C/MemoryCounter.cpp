
#include "MemoryCounter.h"

MemoryCounter::MemoryCounter(void)
{
	memCount = 0;
}
MemoryCounter::MemoryCounter(string MyName)
{
	Name = MyName;
	memCount = 0;
}
MemoryCounter::MemoryCounter(const MemoryCounter&mcnt)
{
	Name = mcnt.Name;
	memCount = mcnt.memCount;
	log = mcnt.log;
}
MemoryCounter::~MemoryCounter(void)
{
}
void MemoryCounter::UpdateCount(int count) {
	memCount += count;
}
void MemoryCounter::LogMemory(){
	log->getErrorStream() << "Memory Count "<<Name<<": " << memCount;
	log->addedError();
}
void MemoryCounter::SetErrorLogger(ErrorLogger* elog){
	log = elog;
}
void MemoryCounter::SetName(string MyName){
	Name = MyName;
}
MemoryCounter& MemoryCounter::operator=(const MemoryCounter&mcnt)
{
	Name = mcnt.Name;
	memCount = mcnt.memCount;
	log = mcnt.log;
	return *this;
}
bool MemoryCounter::operator<(const MemoryCounter&mcnt)
{
	return (Name < mcnt.Name);
}
bool MemoryCounter::operator==(const MemoryCounter&mcnt)
{
	return (Name == mcnt.Name);
}