
#include "MemoryCounterFactory.h"
#include <vector>



MemoryCounterFactory::MemoryCounterFactory(void) : McntMap(),Counters(100),RunCounter(0)
{
}

MemoryCounterFactory::~MemoryCounterFactory(void)
{
}
void MemoryCounterFactory::SetMemoryCounter(string Name, MemoryCounter* mcnt)
{
	McntMap[Name] = mcnt;
	Counters.push_back(mcnt);
}
MemoryCounter* MemoryCounterFactory::GetMemoryCounter(string Name)
{
	return McntMap[Name];
}
vector<MemoryCounter*>& MemoryCounterFactory::GetAllMemoryCounters()
{
	vector<MemoryCounter*> &result = Counters;
	return result;
}

bool MemoryCounterFactory::IsRunCounterExpired()
{
	if (RunCounter >= MemoryDumpCount) {
		RunCounter = 0;
		return true;
	}
	RunCounter++;
	return false;
}
void MemoryCounterFactory::UpdateCount(string Name, int change)
{
	MemoryCounter* mc = McntMap[Name];
	mc->UpdateCount(change);
}
void MemoryCounterFactory::LogMemoryUse()
{
	for(int i = 0; i < (int)Counters.size(); i++) {
		Counters[i]->LogMemory();
	}
}
