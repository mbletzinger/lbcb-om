#include "CriticalSection.h"

CriticalSection::CriticalSection(void)
{
	InitializeCriticalSection(&m_Section);
}

CriticalSection::~CriticalSection(void)
{
	DeleteCriticalSection(&m_Section);
}
void CriticalSection::Enter()
{
		EnterCriticalSection(&m_Section);
}
void CriticalSection::Leave()
{
	LeaveCriticalSection(&m_Section);
}