/* Copyright (C) 2007, University of Illinois.  All rights reserved.
Developed by Narutoshi Nakata <nakata@uiuc.edu>
Prof. B F Spencer Jr <bfs@uiuc.edu>
Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
// LBCB.cpp: implementation of the LBCB class.
//
//////////////////////////////////////////////////////////////////////

#include "LBCB.h"
#include "VECTOR.h"
#include "MATRIX.h"
#include "LBCB_Actuator.h"
#include "LBCB_Parameters.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
//#include <assert.h>
#include <exception>

//#define NDEBUG

//////////////////////////////////////////////////////////////////////
// Function for the singleton
//////////////////////////////////////////////////////////////////////

#ifdef FINE_MEM_COUNT
int LBCB::CtorCount = 0;
int LBCB::NewCount = 0;
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LBCB::LBCB(ThreadLocalObjects* mytlo ) : tlo(mytlo), currentcartesian(6,mytlo)
{
	Actuator_ptr = new LBCB_Actuator[6];
	tlo->GetMemoryCounterFactory()->UpdateCount("LBCB",1);

	VECTOR NomLength(6, tlo);
	VECTOR temp(3, tlo);
	LBCB_Parameters* Params = LBCB_Parameters::GetInstance();
	VECTOR* BasePin = Params->GetBasePin();
	VECTOR* PlatformPin = Params->GetPlatformPin();

	for (int i=0; i<=5; i++)
	{
		temp = PlatformPin[i] - BasePin[i];
		NomLength(i+1) = temp.Norm();
	}

	for ( int i=0; i<=5; i++)
	{
		Actuator_ptr[i].SetThreadLocalObjects(tlo);
		Actuator_ptr[i].Set_NominalLength( NomLength(i+1) );
		Actuator_ptr[i].Set_BasePin( BasePin[i] );
		Actuator_ptr[i].Set_NominalPlatFormPin( PlatformPin[i] );
	}

#ifdef FINE_MEM_COUNT
	CtorCount++;
	log->getErrorStream() << "LBCB Constructed: " << CtorCount;
	log->addedError();
#endif
}

LBCB::~LBCB()
{
	delete [] Actuator_ptr;
	//delete [] instance;
	tlo->GetMemoryCounterFactory()->UpdateCount("LBCB",-1);
#ifdef FINE_MEM_COUNT
	CtorCount--;
	log->getErrorStream() << "LBCB Destroyed: " << CtorCount;
	log->addedError();
#endif
}


//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////


VECTOR LBCB::CurrentCartesianCoordinates( void ) const
{
	return( currentcartesian );
}

VECTOR LBCB::CurrentActuatorLength( void ) const
{
	VECTOR temp(6,tlo);
	for (int i=0; i<=5; i++)
	{temp(i+1) = Actuator_ptr[i].CurrentLength();}
	return( temp );
}

VECTOR LBCB::CurrentActuatorStroke( void ) const
{
	VECTOR temp(6,tlo);
	for (int i=0; i<=5; i++)
	{temp(i+1) = Actuator_ptr[i].CurrentStroke();}
	return( temp );
}

//////////////////////////////////////////////////////////////////////
// Member Function with access to the Member Variables
//////////////////////////////////////////////////////////////////////	
void LBCB::Cartesian2Actuator( VECTOR const & Cart_Disp, VECTOR const & Cart_Force, VECTOR & Act_Stroke, VECTOR & Act_Force)
{
	//assert( cartesianinput.Size() != 6 );
	//assert( actuatorstroke.Size() != 6 );

	MATRIX Convert_Matrix(6,6,tlo);
	VECTOR BasePin_vec(3,tlo), Directional_vec(3,tlo), temp(3,tlo), Moment_vec(3,tlo);
	double k;

	for( int i=0; i<=5; i++)
	{
		Actuator_ptr[i].CartesianCoordinatesInput( Cart_Disp );
		Act_Stroke(i+1) = Actuator_ptr[i].CurrentStroke();

		temp = Actuator_ptr[i].CurrentPlatFormPin() - Actuator_ptr[i].BasePin();
		Directional_vec = temp.NormalizedVector();
		BasePin_vec = Actuator_ptr[i].BasePin();

		k = 0;
		for (int j=1; j<=3; j++){k += BasePin_vec(j)*Directional_vec(j);}
		for (int j=1; j<=3; j++){temp(j) = BasePin_vec(j) - k*Directional_vec(j);}

		Moment_vec = temp.CrossProduct( Directional_vec );

		for (int j=1; j<=3; j++){
			Convert_Matrix(j,i+1) = Directional_vec(j);
			Convert_Matrix(j+3,i+1) = Moment_vec(j);
		}
	}

	Convert_Matrix.LinearSolver( Cart_Force, Act_Force );
	currentcartesian = Cart_Disp;

	return;
}

void LBCB::Actuator2Cartesian( VECTOR const & actuatorstroke, VECTOR const & loadcellreading, VECTOR & cartesiandisp, VECTOR & cartesianforce, VECTOR const & limitation )
{

	//if( actuatorstroke.Size()!=6||limitation.Size()!=6){return;}
	// Temporary actuator stroke vector 
	VECTOR temp_stroke( CurrentActuatorStroke() );
	VECTOR error(6,tlo);

	// Current Cartesian Displacement as starting point
	cartesiandisp = currentcartesian;

	// Error in actuator stroke
	error = actuatorstroke - temp_stroke;
	MATRIX JacobianMatrix(6,6,tlo);
	VECTOR DL_Dd(6,tlo), D_cartesian(6,tlo), cartesiantrans(3,tlo);
	VECTOR force(3,tlo), moment(3,tlo), temp_check(6,tlo);
	VECTOR dummy1(6,tlo),dummy2(6,tlo);
	int check=true;
	int num_iteration;
	num_iteration = 0;

	while(check)
	{
		for(int i=0; i<=5; i++)
		{
			Actuator_ptr[i].Jacobian( cartesiandisp, DL_Dd );
			for (int j=0; j<= 5; j++)
			{JacobianMatrix(i+1,j+1) = DL_Dd(j+1);}
		}

		JacobianMatrix.LinearSolver( error, D_cartesian );

		cartesiandisp = cartesiandisp + D_cartesian;
		Cartesian2Actuator( cartesiandisp, dummy1, temp_stroke, dummy2 );
		error = actuatorstroke - temp_stroke;

		for( int j=1; j<=6; j++)
		{
			if(fabs(error(j))>fabs(limitation(j))){temp_check(j)=1;}
			else{temp_check(j)=0;}
		}

		if(temp_check(1)==1||temp_check(2)==1||temp_check(3)==1||temp_check(4)==1||temp_check(5)==1||temp_check(6)==1)
		{check=true;}
		else{check=false;}

		num_iteration++;
		if (num_iteration>10){check=false;}

	}

	VECTOR *Directional_Vector, *ForceArm_Vector;
	Directional_Vector = new VECTOR[6];
	ForceArm_Vector = new VECTOR[6];

	for(int i = 0; i < 6; i++) 
	{
		Directional_Vector[i].SetThreadLocalObjects(tlo);
		ForceArm_Vector[i].SetThreadLocalObjects(tlo);
	}

	cartesiantrans(1) = cartesiandisp(1);
	cartesiantrans(2) = cartesiandisp(2);
	cartesiantrans(3) = cartesiandisp(3);

	for ( int i=0; i<=5; i++)
	{
		Directional_Vector[i] = Actuator_ptr[i].CurrentPlatFormPin() - Actuator_ptr[i].BasePin();
		Directional_Vector[i] = Directional_Vector[i].NormalizedVector();
		ForceArm_Vector[i] = Actuator_ptr[i].CurrentPlatFormPin() - cartesiantrans;
		force = force + Directional_Vector[i] * loadcellreading(i+1);
		moment = moment + ForceArm_Vector[i].CrossProduct( Directional_Vector[i] ) * loadcellreading(i+1);
	}

	cartesianforce(1) = force(1);
	cartesianforce(2) = force(2);
	cartesianforce(3) = force(3);
	cartesianforce(4) = moment(1);
	cartesianforce(5) = moment(2);
	cartesianforce(6) = moment(3);

	delete [] Directional_Vector;
	delete [] ForceArm_Vector;

	return;
}

void LBCB::Cartesian2Actuator( VECTOR const & CartesianData, VECTOR & ActuatorSpaceData )
{
	VECTOR Cart_Disp(6,tlo), Cart_Force(6,tlo), Act_Stroke(6,tlo), Act_Force(6,tlo);
	// Force and Moment conversion is not necessary because all force commands are transformed into displacement commands

	for (int i=1; i<=6; i++){
		Cart_Disp(i)  = CartesianData(i);
		//		Cart_Force(i) = CartesianData(i+6);
	}

	Cartesian2Actuator( Cart_Disp, Cart_Force, Act_Stroke, Act_Force );

	for (int i=1; i<=6; i++){
		ActuatorSpaceData(i)   = Act_Stroke(i);
		//		ActuatorSpaceData(i+6) = Act_Force(i);
	}

	return;
}

void LBCB::Actuator2Cartesian( VECTOR const & ActuatorSpaceData, VECTOR & CartesianData, VECTOR const & Limitation  )
{
	VECTOR Cart_Disp(6,tlo), Cart_Force(6,tlo), Act_Stroke(6,tlo), Act_Force(6,tlo);

	for (int i=1; i<=6; i++){
		Act_Stroke(i) = ActuatorSpaceData(i);
	}

	Actuator2Cartesian( Act_Stroke, Act_Force, Cart_Disp, Cart_Force, Limitation );

	for (int i=1; i<=6; i++){
		CartesianData(i)   = Cart_Disp(i);
	}

	return;
}