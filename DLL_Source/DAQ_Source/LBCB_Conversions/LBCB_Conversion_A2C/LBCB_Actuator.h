// LBCB_Actuator.h: interface for the LBCB_Actuator class.
//
//////////////////////////////////////////////////////////////////////
#if !defined(AFX_LBCB_ACTUATOR_H__095CA48F_0888_4433_8BEA_A4012E070AAF__INCLUDED_)
#define AFX_LBCB_ACTUATOR_H__095CA48F_0888_4433_8BEA_A4012E070AAF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#include "VECTOR.h"
#include "MATRIX.h"
#include <string>
#include "ThreadLocalObjects.h"

class LBCB_Actuator  
{
public:

	// Constructor and Destructor
	LBCB_Actuator();
	~LBCB_Actuator();

	// Member Function with access to the Member Variables
	void Set_MaximumLength( const double length );
	void Set_MinimumLength( const double length );
	void Set_NominalLength( const double length );
	void Set_BasePin( const VECTOR point );
	void Set_NominalPlatFormPin( const VECTOR point );
	//void Set_ID( string );

	// Member Function to change the Actuator Status
	void CartesianCoordinatesInput( VECTOR const &cartesianinput );
	//void LengthInput( double );
	//void StrokeInput( double );

	// Member Function to give the Jacobian Element
	void Jacobian( VECTOR const &cartesian, VECTOR &DL_Dd ) const;

	// Member Function to show the Member Variables
	double NominalLength( void )      const;
	double CurrentLength( void )      const;
	double CurrentStroke( void )      const;
	VECTOR BasePin( void )            const;
	VECTOR NominalPlatFormPin( void ) const;
	VECTOR CurrentPlatFormPin( void ) const;
	//void   Display( void )            const;
//    string ID( void ) const
	void SetThreadLocalObjects(ThreadLocalObjects* mytlo);

private:
	double nom_length;
	double cur_length;
	VECTOR basepin;
	VECTOR nominalplatformpin;
	VECTOR currentplatformpin;
	//string id;
	ThreadLocalObjects* tlo;
	bool PartiallyConstructed;

#ifdef FINE_MEM_COUNT
	static int NewCount;
	static int CtorCount;
#endif
};

#endif 
