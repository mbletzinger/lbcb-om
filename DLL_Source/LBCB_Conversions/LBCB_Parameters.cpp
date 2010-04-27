/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
// LBCB_Parameters.cpp: implementation of the LBCB_Parameters class.
//
//////////////////////////////////////////////////////////////////////

#include "LBCB_Parameters.h"
#include "VECTOR.h"
#include <string>
#include "ThreadLocalObjects.h"
#include "ErrorLogger.h"

//#define NDEBUG

//////////////////////////////////////////////////////////////////////
// Function for the singleton
//////////////////////////////////////////////////////////////////////
LBCB_Parameters* LBCB_Parameters::instance = NULL;

#ifdef FINE_MEM_COUNT
	int LBCB_Parameters::CtorCount = 0;
	int LBCB_Parameters::NewCount = 0;
#endif

void LBCB_Parameters::Create( MATRIX const & rbasepin, MATRIX const & rplatformpin, MATRIX const & lbasepin, MATRIX const & lplatformpin, ThreadLocalObjects* tlo )
{
		instance = new LBCB_Parameters( rbasepin, rplatformpin, lbasepin, lplatformpin, tlo );
}
LBCB_Parameters* LBCB_Parameters::GetInstance()
{
	return instance;
}

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LBCB_Parameters::LBCB_Parameters( MATRIX const & rbasepin, MATRIX const & rplatformpin, MATRIX const & lbasepin, MATRIX const & lplatformpin, ThreadLocalObjects* mytlo ) 
: tlo(mytlo)
{
	RightBasePin = new VECTOR[6];
	RightPlatformPin = new VECTOR[6];
	LeftBasePin = new VECTOR[6];
	LeftPlatformPin = new VECTOR[6];

#ifdef FINE_MEM_COUNT
	CtorCount++;
	log->getErrorStream() << "LBCB_Parameters Constructed: " << CtorCount;
	log->addedError();
#endif
	//////////////////////////
	// Vector declaration for actuator pin locations
	for ( int i=0; i<=5; i++)
	{
		RightBasePin[i].SetThreadLocalObjects(tlo);
		RightBasePin[i].Set_Size( 3 );
		RightPlatformPin[i].SetThreadLocalObjects(tlo);
		RightPlatformPin[i].Set_Size( 3 );
		LeftBasePin[i].SetThreadLocalObjects(tlo);
		LeftBasePin[i].Set_Size( 3 );
		LeftPlatformPin[i].SetThreadLocalObjects(tlo);
		LeftPlatformPin[i].Set_Size( 3 );
		for (int j=1; j<=3; j++)
		{
			RightBasePin[i](j)     = rbasepin(j,i+1);
			RightPlatformPin[i](j) = rplatformpin(j,i+1);
			LeftBasePin[i](j)     = lbasepin(j,i+1);
			LeftPlatformPin[i](j) = lplatformpin(j,i+1);
		}
	}
}

LBCB_Parameters::~LBCB_Parameters()
{
	delete [] RightBasePin;
	delete [] RightPlatformPin;
	delete [] LeftBasePin;
	delete [] LeftPlatformPin;
#ifdef FINE_MEM_COUNT
	CtorCount--;
	log->getErrorStream() << "LBCB_Parameters Destroyed: " << CtorCount;
	log->addedError();
#endif
}


//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////
VECTOR* LBCB_Parameters::GetBasePin(long type)
{
	if(type == 0) {
		return RightBasePin;
	}
	return LeftBasePin;
}

VECTOR* LBCB_Parameters::GetPlatformPin(long type)
{
	if(type == 0) {
		return RightPlatformPin;
	}
	return LeftPlatformPin;
}

