#pragma once
#include <windows.h>

class CriticalSection
{
public:
	CriticalSection(void);
	~CriticalSection(void);
	void Enter();
	void Leave();
private:
	CRITICAL_SECTION m_Section;
};
