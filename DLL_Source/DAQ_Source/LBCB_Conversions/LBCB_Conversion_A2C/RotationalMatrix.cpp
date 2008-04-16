/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
// RotationalMatrix.cpp: implementation of the RotationalMatrix class.
//
//////////////////////////////////////////////////////////////////////

#include "RotationalMatrix.h"
#include "MATRIX.h"
#include "VECTOR.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
//#include <assert.h>
#include <exception>

using std::string;
ErrorLogger* RotationalMatrix::log = NULL;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

RotationalMatrix::RotationalMatrix( const double theta, const int flg )
:angle( theta ), type(flg)
{
	RotMatrix.Set_Size(3,3);
	TypeChange( theta, type );
}

RotationalMatrix::~RotationalMatrix()
{
}

void RotationalMatrix::TypeChange( const int flg )
{
	RotMatrix.Identity();
	if ( flg == 1 )  // Roll
	{
		RotMatrix(2,2) =  cos( angle );
		RotMatrix(2,3) = -sin( angle );
		RotMatrix(3,2) =  sin( angle );
		RotMatrix(3,3) =  cos( angle );
	}
	else if ( flg == 2 )
	{
		RotMatrix(1,1) =  cos( angle );
		RotMatrix(1,3) =  sin( angle );
		RotMatrix(3,1) = -sin( angle );
		RotMatrix(3,3) =  cos( angle );
	}
	else if ( flg == 3 )
	{
		RotMatrix(1,1) =  cos( angle );
		RotMatrix(1,2) = -sin( angle );
		RotMatrix(2,1) =  sin( angle );
		RotMatrix(2,2) =  cos( angle );
	}
	return;

}

void RotationalMatrix::TypeChange( const double theta, const int flg )
{
	angle = theta;
	type = flg;
	TypeChange( type );
	return;
}

void RotationalMatrix::InputAngle( const double theta )
{
	angle = theta;
	TypeChange( type );
	return;
}

MATRIX RotationalMatrix::operator () ( void )
{
	return( RotMatrix );
}

MATRIX RotationalMatrix::operator () ( const double theta )
{
	angle = theta;
	TypeChange( type );
	return( RotMatrix );
}

MATRIX RotationalMatrix::operator () ( const double theta, const int flg)
{
	angle = theta;
	type = flg;
	TypeChange( angle, type );
	return( RotMatrix );
}
 void RotationalMatrix::SetErrorLogger(ErrorLogger* log)
{
	RotationalMatrix::log = log;
}
