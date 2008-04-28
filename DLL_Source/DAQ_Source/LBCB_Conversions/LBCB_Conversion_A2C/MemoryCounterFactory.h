#pragma once
#include <map>
#include <string>
#include <vector>
#include "MemoryCounter.h"

using namespace std;

struct CmpMemCnt
{
	inline bool operator()(string s1, string s2) const
	{
		return s1.compare(s2)< 0;
	}
};
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
	map<string,MemoryCounter*, CmpMemCnt> McntMap;
	vector<MemoryCounter*> Counters;
	long RunCounter;
	static const long MemoryDumpCount = 50;
};
