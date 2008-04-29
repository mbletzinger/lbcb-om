#pragma once
#include <map>
#include <string>
#include <vector>
#include "MemoryCounter.h"

using namespace std;

class MemoryCounterFactory
{
public:
	MemoryCounterFactory(void);
	~MemoryCounterFactory(void);
	void SetMemoryCounter(string Name, MemoryCounter* mcnt);
	MemoryCounter* GetMemoryCounter(string Name);
	vector<MemoryCounter*>& GetAllMemoryCounters();
	bool IsRunCounterExpired();
	void UpdateCount(string Name, int change);
	void LogMemoryUse();

private:
	map<string,MemoryCounter*> McntMap;
	vector<MemoryCounter*> Counters;
	long RunCounter;
	static const long MemoryDumpCount = 50;
};
