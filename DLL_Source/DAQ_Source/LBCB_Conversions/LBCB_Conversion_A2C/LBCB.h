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
#include "ErrorLogger.h"

class LBCB  
{
public:
	static LBCB* Create( );
	//virtual ~LBCB();

	//LBCB();
	~LBCB();

	// Set LBCB Parameters
	void Set_PinParam( MATRIX const & basepin, MATRIX const & platformpin );
	//void Set_PlatFormPin( MATRIX const & platformpin );

	// Member Function to show the Member Variables
	//void Display_BasePin( void )               const;
	//void Display_PlatFormPin( void )           const;
	VECTOR CurrentCartesianCoordinates( void ) const;
	VECTOR CurrentActuatorLength( void )       const;
	VECTOR CurrentActuatorStroke( void )       const;

	// Member Function with access to the Member Variables
	void Cartesian2Actuator( VECTOR const & Cart_Disp, VECTOR const & Cart_Force, VECTOR & Act_Stroke, VECTOR & Act_Force);
	void Actuator2Cartesian( VECTOR const & Act_Stroke, VECTOR const & ACt_Force, VECTOR & Cart_Disp, VECTOR & Cart_Force, VECTOR const & Limitation );
	void Cartesian2Actuator( VECTOR const & CartesianData, VECTOR & ActuatorSpace);
	void Actuator2Cartesian( VECTOR const & ActuatorSpace, VECTOR & CartesianData, VECTOR const & Limitation );
	static void SetErrorLogger(ErrorLogger* log);
private:
	LBCB();
	static bool flag;
	static LBCB *instance;
	LBCB_Actuator *Actuator_ptr;
	VECTOR *BasePin, *PlatFormPin;
	VECTOR currentcartesian;
	static ErrorLogger *log;
};

#endif // _MSC_VER > 1000
