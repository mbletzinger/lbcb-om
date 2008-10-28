/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
// LBCB_Actuator.cpp: implementation of the LBCB_Actuator class.
//
//////////////////////////////////////////////////////////////////////

#include "LBCB_Actuator.h"
#include "RotationalMatrix.h"
#include "VECTOR.h"
#include "MATRIX.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
//#include <assert.h>
#include <exception>

//#define NDEBUG


#ifdef FINE_MEM_COUNT
int LBCB_Actuator::CtorCount = 0;
int LBCB_Actuator::NewCount = 0;
#endif
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LBCB_Actuator::LBCB_Actuator()
:nom_length(0),cur_length(0)
{
	PartiallyConstructed = true;

#ifdef FINE_MEM_COUNT
	CtorCount++;
	log->getErrorStream() << "LBCB_Actuator Constructed: " << CtorCount;
	log->addedError();
#endif
}

LBCB_Actuator::~LBCB_Actuator()
{
	tlo->GetMemoryCounterFactory()->UpdateCount("LBCB_Actuator",-1);
#ifdef FINE_MEM_COUNT
	CtorCount--;
	log->getErrorStream() << "LBCB_Actuator Destroyed: " << CtorCount;
	log->addedError();
#endif
}

//////////////////////////////////////////////////////////////////////
// Member Function with access to the Member Variables
//////////////////////////////////////////////////////////////////////

void LBCB_Actuator::Set_NominalLength( const double length )
{
	nom_length = length;
	cur_length = length;
	return;
}

void LBCB_Actuator::Set_BasePin( const VECTOR point )
{
	//assert( point.Size() != 3 );
	basepin = point;
	return;
}

void LBCB_Actuator::Set_NominalPlatFormPin( const VECTOR point )
{
	//assert( point.Size() != 3 );
	nominalplatformpin = point;
	currentplatformpin = point;
	return;
}

/*void LBCB_Actuator::Set_ID( string name )
{
	id = name;
	return;
}*/

//////////////////////////////////////////////////////////////////////
// Member Function to change the Actuator Status
//////////////////////////////////////////////////////////////////////
void LBCB_Actuator::CartesianCoordinatesInput( VECTOR const &cartesianinput )
{
	//assert( cartesianinput.Size() != 6 );
	double roll_angle, pitch_angle, yaw_angle;
	VECTOR translation(3,tlo);
	VECTOR directional_vector(3,tlo);
	//MATRIX Roll(3), Pitch(3), Yaw(3);
	RotationalMatrix Roll( 0, 1,tlo );
	RotationalMatrix Pitch( 0, 2, tlo );
	RotationalMatrix Yaw( 0, 3, tlo );

	translation(1) = cartesianinput(1);
	translation(2) = cartesianinput(2);
	translation(3) = cartesianinput(3);
	roll_angle     = cartesianinput(4);
	pitch_angle    = cartesianinput(5);
	yaw_angle      = cartesianinput(6);

//	Roll.Roll( roll_angle );
//	Pitch.Pitch( pitch_angle );
//	Yaw.Yaw( yaw_angle );

	Roll.InputAngle( roll_angle );
	Pitch.InputAngle( pitch_angle );
	Yaw.InputAngle( yaw_angle );

	// Translation from Cartesian Coordinate Input 
	currentplatformpin = Roll() * Pitch() * Yaw() * nominalplatformpin + translation;

	directional_vector = currentplatformpin - basepin;
	cur_length = directional_vector.Norm();

	return;
}

//////////////////////////////////////////////////////////////////////
// Member Function to give the Jacobian Element
//////////////////////////////////////////////////////////////////////
void LBCB_Actuator::Jacobian( VECTOR const & cartesian, VECTOR & DL_Dd ) const
{
	//assert( cartesian.Size() != 6 );
	//assert( DL_Dd.Size() != 6 );

	double x, y, z, theta_x, theta_y, theta_z;
	double Pbx, Pby, Pbz, Ppx, Ppy, Ppz;

	x       = cartesian(1);
	y       = cartesian(2);
	z       = cartesian(3);
	theta_x = cartesian(4);
	theta_y = cartesian(5);
	theta_z = cartesian(6);

	Pbx = basepin(1);
	Pby = basepin(2);
	Pbz = basepin(3);
	Ppx = nominalplatformpin(1);
	Ppy = nominalplatformpin(2);
	Ppz = nominalplatformpin(3);

	VECTOR phai(3, tlo);
	phai = currentplatformpin - basepin;
	phai = phai/cur_length;

	MATRIX J(3,3,tlo);
	
	// Jacobian Element
	J(1,1) = 0;
	J(1,2) = -sin(theta_y)*cos(theta_z)*Ppx+sin(theta_y)*sin(theta_z)*Ppy+cos(theta_y)*Ppz;
	J(1,3) = -cos(theta_y)*sin(theta_z)*Ppx-cos(theta_y)*cos(theta_z)*Ppy;
	J(2,1) = (cos(theta_x)*sin(theta_y)*cos(theta_z)-sin(theta_x)*sin(theta_z))*Ppx +
	        (-cos(theta_x)*sin(theta_y)*sin(theta_z)-sin(theta_x)*cos(theta_x))*Ppy 
       		 -cos(theta_x)*cos(theta_y)*Ppz;
	J(2,2) =  sin(theta_x)*cos(theta_y)*cos(theta_z)*Ppx-sin(theta_x)*cos(theta_y)*sin(theta_z)*Ppy
	         -sin(theta_x)*cos(theta_y)*Ppz;
	J(2,3) =(-sin(theta_x)*sin(theta_y)*sin(theta_z)*cos(theta_x)*cos(theta_z))*Ppx +
            (-sin(theta_x)*sin(theta_y)*cos(theta_z)-cos(theta_x)*sin(theta_z))*Ppy;
	J(3,1) =( sin(theta_x)*sin(theta_y)*cos(theta_z)+cos(theta_x)*sin(theta_z))*Ppx+
            (-sin(theta_x)*sin(theta_y)*sin(theta_z)+cos(theta_x)*cos(theta_z))*Ppy
	       	 -sin(theta_x)*cos(theta_y)*Ppz;
	J(3,2) = -cos(theta_x)*cos(theta_y)*cos(theta_z)*Ppx+cos(theta_x)*cos(theta_y)*sin(theta_z)*Ppy
             -cos(theta_x)*sin(theta_y)*Ppz;
	J(3,3) = (cos(theta_x)*sin(theta_y)*sin(theta_z)+sin(theta_x)*cos(theta_z))*Ppx
            +(cos(theta_x)*sin(theta_y)*cos(theta_z)-sin(theta_x)*sin(theta_z))*Ppy;

	DL_Dd(1) = phai(1);
	DL_Dd(2) = phai(2);
	DL_Dd(3) = phai(3);
	DL_Dd(4) = J(1,1)*phai(1) + J(2,1)*phai(2) + J(3,1)*phai(3);
	DL_Dd(5) = J(1,2)*phai(1) + J(2,2)*phai(2) + J(3,2)*phai(3);
	DL_Dd(6) = J(1,3)*phai(1) + J(2,3)*phai(2) + J(3,3)*phai(3);

	return;	
}


//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////


double LBCB_Actuator::NominalLength( void ) const
{
	return nom_length;
}

double LBCB_Actuator::CurrentLength( void ) const
{
	return cur_length;
}

double LBCB_Actuator::CurrentStroke( void ) const
{
	return (cur_length - nom_length );
}

VECTOR LBCB_Actuator::BasePin( void ) const
{
	return basepin;
}

VECTOR LBCB_Actuator::NominalPlatFormPin( void ) const
{
	return nominalplatformpin;
}

VECTOR LBCB_Actuator::CurrentPlatFormPin( void ) const
{
	return currentplatformpin;
}

/*void LBCB_Actuator::Display( void ) const
{
//	cout << "Actuator ID: " << id << endl;
	cout << "Maximum Length: " << max_length << endl;
	cout << "Minimum Length: " << min_length << endl;
	cout << "Nominal Length: " << nom_length << endl;
	cout << "Current Length: " << cur_length << endl;
    cout << "BasePinLocation " << endl;
	basepin.Display();
	cout << "NominalPlatFormPin " << endl;
	nominalplatformpin.Display();
	cout << "CurrentPlatFormPin " << endl;
	currentplatformpin.Display();

	return;
}*/

void LBCB_Actuator::SetThreadLocalObjects(ThreadLocalObjects* mytlo)
{
	tlo = mytlo;
	if(PartiallyConstructed)
	{
		tlo->GetMemoryCounterFactory()->UpdateCount("LBCB_Actuator",1);
		basepin.SetThreadLocalObjects(tlo);
		basepin.Set_Size(3);
		nominalplatformpin.SetThreadLocalObjects(tlo);
		nominalplatformpin.Set_Size(3);
		currentplatformpin.SetThreadLocalObjects(tlo);
		currentplatformpin.Set_Size(3);
		PartiallyConstructed = false;
	}
}

