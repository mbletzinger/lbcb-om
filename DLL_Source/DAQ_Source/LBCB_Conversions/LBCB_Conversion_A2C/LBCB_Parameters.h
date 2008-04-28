// LBCB_Parameters.h: interface for the LBCB_Parameters class.
//
//////////////////////////////////////////////////////////////////////
#if !defined(AFX_LBCB_Parameters_H__26797DC5_931A_4415_9007_AC5310218C04__INCLUDED_)
#define AFX_LBCB_Parameters_H__26797DC5_931A_4415_9007_AC5310218C04__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#include "VECTOR.h"
#include "MATRIX.h"
#include "LBCB_Actuator.h"
#include "ThreadLocalObjects.h"

class LBCB_Parameters  
{
public:
	static void Create( MATRIX const & basepin, MATRIX const & platformpin ,ThreadLocalObjects* tlo);
	static LBCB_Parameters* GetInstance( );

	//LBCB_Parameters();
	~LBCB_Parameters();

	VECTOR* GetBasePin();
	VECTOR* GetPlatformPin();


private:
	LBCB_Parameters( MATRIX const & basepin, MATRIX const & platformpin, ThreadLocalObjects* tlo );
	static LBCB_Parameters *instance;
	VECTOR *BasePin, *PlatformPin;
	ThreadLocalObjects* tlo;

#ifdef FINE_MEM_COUNT
	static int CtorCount;
	static int NewCount;
#endif
};

#endif // _MSC_VER > 1000
