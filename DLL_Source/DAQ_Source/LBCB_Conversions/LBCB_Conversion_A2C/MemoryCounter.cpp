
#include "MemoryCounter.h"

ErrorLogger* MemoryCounter::log = NULL;

MemoryCounter::MemoryCounter(void)
{
	memCount = 0;
}
MemoryCounter::MemoryCounter(string MyName)
{
	Name = MyName;
	memCount = 0;
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
