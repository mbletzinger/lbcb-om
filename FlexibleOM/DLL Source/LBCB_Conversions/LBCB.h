// LBCB.h: interface for the LBCB class.
//
//////////////////////////////////////////////////////////////////////
#if !defined(AFX_LBCB_H__26797DC5_931A_4415_9007_AC5310218C04__INCLUDED_)
#define AFX_LBCB_H__26797DC5_931A_4415_9007_AC5310218C04__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#include "VECTOR.h"
#include "MATRIX.h"
#include "LBCB_Actuator.h"
#include "ThreadLocalObjects.h"

class LBCB  
{
public:

	LBCB(long type, ThreadLocalObjects* tlo);
	~LBCB();

	VECTOR CurrentCartesianCoordinates( void ) const;
	VECTOR CurrentActuatorLength( void )       const;
	VECTOR CurrentActuatorStroke( void )       const;

	// Member Function with access to the Member Variables
	void Cartesian2ActuatorDisplacement( VECTOR const & Cart_Disp,VECTOR & Act_Stroke);
	void Cartesian2ActuatorForces( VECTOR const & Cart_Force, VECTOR & Act_Force);
	void Actuator2CartesianDisplacement( VECTOR const & actuatorstroke, VECTOR & cartesiandisp, VECTOR const & limitation );
	void Actuator2CartesianForces(VECTOR const & loadcellreading, VECTOR & cartesiandisp, VECTOR & cartesianforce);
	private:
	LBCB_Actuator *Actuator_ptr;
	VECTOR currentcartesian;
	ThreadLocalObjects* tlo;
#ifdef FINE_MEM_COUNT
	static int CtorCount;
	static int NewCount;
#endif
};

#endif // _MSC_VER > 1000
