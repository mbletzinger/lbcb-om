/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
/* Call Library Source File */

#include "extcode.h"
#include "windows.h"
#include "string.h"
#include "LBCB.h"
#include "LBCB_Actuator.h"
#include "VECTOR.h"
#include "MATRIX.h"
#include "RotationalMatrix.h"
#include "RigidTransform.h"

extern "C" {
_declspec(dllexport) void LBCB_conversion_A2C(long size, long type, double motion_center[], long length, double sensor_reading[], double cartesian_value[]);
}

_declspec(dllexport) void LBCB_conversion_A2C(long size, long type, double motion_center[], long length, double sensor_reading[], double cartesian_value[])
	{

	int i;

	VECTOR MotionCenter(3), PlatformCenter(3), ActuatorSpace(12), CartesianData(12), MotionCenterData(12), Limitation(6);
	MATRIX basepin(3,6), platformpin(3,6);

	for(i=0; i<3; i++){MotionCenter(i+1) = motion_center[i];}

	if (size == 0 && type == 0){// Right Hand Small Scale LBCB
		basepin(1,1) = -19.184;
		basepin(2,1) = 4.8039;
		basepin(3,1) = -7.0262;
		platformpin(1,1) = -5.4347;
		platformpin(2,1) = 4.7978;
		platformpin(3,1) = -2.5940;

		basepin(1,2) = -19.184;
		basepin(2,2) = -4.8039;
		basepin(3,2) = -7.0262;
		platformpin(1,2) = -5.4347;
		platformpin(2,2) = -4.7978;
		platformpin(3,2) = -2.5940;

		basepin(1,3) = 0.079;
		basepin(2,3) = -7.6005;
		basepin(3,3) = -6.8945;
		platformpin(1,3) = -0.1013;
		platformpin(2,3) = 3.3364;
		platformpin(3,3) = -3.9908;

		basepin(1,4) = -5.6232;
		basepin(2,4) = 0.0038;
		basepin(3,4) = -13.63;
		platformpin(1,4) = -5.6253;
		platformpin(2,4) = 0.0477;
		platformpin(3,4) = -2.62;

		basepin(1,5) = 5.9788;
		basepin(2,5) = 4.8056;
		basepin(3,5) = -13.63;
		platformpin(1,5) = 6.0049;
		platformpin(2,5) = 4.8093;
		platformpin(3,5) = -2.62;

		basepin(1,6) = 5.9788;
		basepin(2,6) = -4.8056;
		basepin(3,6) = -13.63;
		platformpin(1,6) = 6.0049;
		platformpin(2,6) = -4.8093;
		platformpin(3,6) = -2.62;
	}
	else if (size == 0 && type == 1){// Left Hand Small Scale LBCB
		basepin(1,1) = 19.225;
		basepin(2,1) = 4.8;
		basepin(3,1) = -7.13;
		platformpin(1,1) = 5.4;
		platformpin(2,1) = 4.8;
		platformpin(3,1) = -2.5;

		basepin(1,2) = 19.225;
		basepin(2,2) = -4.8;
		basepin(3,2) = -7.13;
		platformpin(1,2) = 5.4;
		platformpin(2,2) = -4.8;
		platformpin(3,2) = -2.5;

		basepin(1,3) = -0.1;
		basepin(2,3) = -7.7;
		basepin(3,3) = -7.05;
		platformpin(1,3) = -0.1;
		platformpin(2,3) = 3.3;
		platformpin(3,3) = -4;

		basepin(1,4) = 5.6025;
		basepin(2,4) = 0.0;
		basepin(3,4) = -13.80;
		platformpin(1,4) = 5.6025;
		platformpin(2,4) = 0.0;
		platformpin(3,4) = -2.625;

		basepin(1,5) = -5.9775;
		basepin(2,5) = 4.8;
		basepin(3,5) = -13.80;
		platformpin(1,5) = -5.9775;
		platformpin(2,5) = 4.8;
		platformpin(3,5) = -2.625;

		basepin(1,6) = -5.9775;
		basepin(2,6) = -4.8;
		basepin(3,6) = -13.80;
		platformpin(1,6) = -5.9775;
		platformpin(2,6) = -4.8;
		platformpin(3,6) = -2.625;
	}
	else if (size == 1 && type == 0) { // Right Hand Large Scale LBCB
		basepin(1,1) = -96.375;
		basepin(2,1) = 24;
		basepin(3,1) = -35.5;
		platformpin(1,1) = -27;
		platformpin(2,1) = 24;
		platformpin(3,1) = -12.875;

		basepin(1,2) = -96.375;
		basepin(2,2) = -24;
		basepin(3,2) = -35.5;
		platformpin(1,2) = -27;
		platformpin(2,2) = -24;
		platformpin(3,2) = -12.875;

		basepin(1,3) = 0.5;
		basepin(2,3) = -37.375;
		basepin(3,3) = -34.75;
		platformpin(1,3) = 0.5;
		platformpin(2,3) = 16.625;
		platformpin(3,3) = -20.25;

		basepin(1,4) = -28;
		basepin(2,4) = 0.0;
		basepin(3,4) = -68.875;
		platformpin(1,4) = -28;
		platformpin(2,4) = 0.0;
		platformpin(3,4) = -12.875;

		basepin(1,5) = 30;
		basepin(2,5) = 24;
		basepin(3,5) = -68.875;
		platformpin(1,5) = 30;
		platformpin(2,5) = 24;
		platformpin(3,5) = -12.875;

		basepin(1,6) = 30;
		basepin(2,6) = -24;
		basepin(3,6) = -68.875;
		platformpin(1,6) = 30;
		platformpin(2,6) = -24;
		platformpin(3,6) = -12.875;
	}
	else { // Left Hand Large Scale LBCB
		basepin(1,1) = 96.375;
		basepin(2,1) = 24;
		basepin(3,1) = -35.5;
		platformpin(1,1) = 27;
		platformpin(2,1) = 24;
		platformpin(3,1) = -12.875;

		basepin(1,2) = 96.375;
		basepin(2,2) = -24;
		basepin(3,2) = -35.5;
		platformpin(1,2) = 27;
		platformpin(2,2) = -24;
		platformpin(3,2) = -12.875;

		basepin(1,3) = -0.5;
		basepin(2,3) = -37.375;
		basepin(3,3) = -34.75;
		platformpin(1,3) = -0.5;
		platformpin(2,3) = 16.625;
		platformpin(3,3) = -20.25;

		basepin(1,4) = 28;
		basepin(2,4) = 0.0;
		basepin(3,4) = -68.875;
		platformpin(1,4) = 28;
		platformpin(2,4) = 0.0;
		platformpin(3,4) = -12.875;

		basepin(1,5) = -30;
		basepin(2,5) = 24;
		basepin(3,5) = -68.875;
		platformpin(1,5) = -30;
		platformpin(2,5) = 24;
		platformpin(3,5) = -12.875;

		basepin(1,6) = -30;
		basepin(2,6) = -24;
		basepin(3,6) = -68.875;
		platformpin(1,6) = -30;
		platformpin(2,6) = -24;
		platformpin(3,6) = -12.875;
	}

	LBCB *lbcb = LBCB::Create( );
	lbcb->Set_PinParam( basepin, platformpin );

	for( i = 0; i<6; i++)
	{
		ActuatorSpace(i+1) = sensor_reading[i];
		if (length == 12) {ActuatorSpace(i+7) = sensor_reading[i+6];}
		Limitation(i+1) = 0.00001;
	}

	lbcb->Actuator2Cartesian( ActuatorSpace, CartesianData, Limitation );
	RigidTransform( PlatformCenter, CartesianData, MotionCenter, MotionCenterData );


	for( i = 0; i<6; i++)
	{
		cartesian_value[i] = MotionCenterData(i+1);
		if (length == 12) {cartesian_value[i+6] = MotionCenterData(i+7);}
	}

	return;

	}