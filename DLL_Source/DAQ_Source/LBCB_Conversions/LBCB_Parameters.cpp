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

void LBCB_Parameters::Create( MATRIX const & basepin, MATRIX const & platformpin,ThreadLocalObjects* tlo )
{
		instance = new LBCB_Parameters( basepin, platformpin, tlo );
}
LBCB_Parameters* LBCB_Parameters::GetInstance()
{
	return instance;
}

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LBCB_Parameters::LBCB_Parameters( MATRIX const & basepin, MATRIX const & platformpin,ThreadLocalObjects* mytlo ) 
: tlo(mytlo)
{
	BasePin = new VECTOR[6];
	PlatformPin = new VECTOR[6];

#ifdef FINE_MEM_COUNT
	CtorCount++;
	log->getErrorStream() << "LBCB_Parameters Constructed: " << CtorCount;
	log->addedError();
#endif
	//////////////////////////
	// Vector declaration for actuator pin locations
	for ( int i=0; i<=5; i++)
	{
		BasePin[i].SetThreadLocalObjects(tlo);
		BasePin[i].Set_Size( 3 );
		PlatformPin[i].SetThreadLocalObjects(tlo);
		PlatformPin[i].Set_Size( 3 );
		for (int j=1; j<=3; j++)
		{
			BasePin[i](j)     = basepin(j,i+1);
			PlatformPin[i](j) = platformpin(j,i+1);
		}
	}
}

LBCB_Parameters::~LBCB_Parameters()
{
	delete [] BasePin;
	delete [] PlatformPin;
#ifdef FINE_MEM_COUNT
	CtorCount--;
	log->getErrorStream() << "LBCB_Parameters Destroyed: " << CtorCount;
	log->addedError();
#endif
}


//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////
VECTOR* LBCB_Parameters::GetBasePin()
{
	return BasePin;
}

VECTOR* LBCB_Parameters::GetPlatformPin()
{
	return PlatformPin;
}

