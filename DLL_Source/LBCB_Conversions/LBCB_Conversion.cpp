/* Copyright (C) 2007, University of Illinois.  All rights reserved.
Developed by Narutoshi Nakata <nakata@uiuc.edu>
Prof. B F Spencer Jr <bfs@uiuc.edu>
Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
/* Call Library Source File */
#include "LBCB_Conversion.h"
#include <string>
#include "LBCB.h"
#include "LBCB_Parameters.h"
#include "VECTOR.h"
#include "MATRIX.h"
#include "RotationalMatrix.h"
#include "RigidTransform.h"
#include "ErrorLogger.h"
#include "ThreadLocalFactory.h"
#include "ThreadLocalObjects.h"
#include "MemoryCounterFactory.h"

using namespace std;
ThreadLocalFactory* tspace = NULL;

ThreadLocalObjects* GetThreadLocalObjects()
{

	DWORD threadid = GetCurrentThreadId();
	if(tspace == NULL) {
		ErrorLogger elog;
		elog.getErrorStream()<<"LBCB_Conversions has not been initialized";
		elog.addedError();
		elog.SetPrefix("Main");
		elog.flush(0);
		return NULL;
	}
	ThreadLocalObjects* tlo = tspace->GetLocalObjects(threadid);
	if(tlo != NULL)
	{
		return tlo;
	}
	MemoryCounterFactory* mcf = new MemoryCounterFactory(); 
	tlo = new ThreadLocalObjects();
	tlo->SetMemoryCounterFactory(mcf);
	tlo->AddMemoryCounter(string("LBCB"));
	tlo->AddMemoryCounter(string("LBCB_Actuator"));
	tlo->AddMemoryCounter("Parameters");
	tlo->AddMemoryCounter("MATRIX");
	tlo->AddMemoryCounter("MATRIX.doubles");
	tlo->AddMemoryCounter("RotationalMatrix");
	tlo->AddMemoryCounter("VECTOR");
	tlo->AddMemoryCounter("VECTOR.doubles");
	tspace->SetLocalObjects(threadid,tlo);
	return tlo;
}

int ProcessErrors(string name, ThreadLocalObjects* tlo)
{
	int result = 0;
	ErrorLogger* elog = tspace->getErrorLog();
	elog->SetPrefix(name);
	if(elog->hasError()) {
		result = 1;
		tlo->flush();
	}

	MemoryCounterFactory* mcf = tlo->GetMemoryCounterFactory(); 
	if(mcf->IsRunCounterExpired())
	{
		mcf->LogMemoryUse();
		tlo->flush();
	}
	return result;
}

_declspec(dllexport) void LBCB_Conversion_A2C(long type, double motion_center[], long length, double sensor_reading[], double cartesian_value[], long* error)
{
	int i;

#ifdef FINE_MEM_COUNT
	elog.getErrorStream() << "LBCB_conversion_A2C started";
	elog.addedError();
#endif

	ThreadLocalObjects* tlo = GetThreadLocalObjects();
	if(tlo == NULL) {
		return;
	}
	VECTOR MotionCenter(3,tlo), PlatformCenter(3,tlo), ActuatorSpace(12,tlo), CartesianData(12,tlo), MotionCenterData(12,tlo), Limitation(6,tlo);
	for(i=0; i<3; i++){MotionCenter(i+1) = motion_center[i];}

	for( i = 0; i<6; i++)
	{
		ActuatorSpace(i+1) = sensor_reading[i];
		if (length == 12) {ActuatorSpace(i+7) = sensor_reading[i+6];}
		Limitation(i+1) = 0.00001;
	}
	LBCB lbcb(type, tlo);
	lbcb.Actuator2Cartesian( ActuatorSpace, CartesianData, Limitation );
	RigidTransform( PlatformCenter, CartesianData, MotionCenter, MotionCenterData,tlo );

	for( i = 0; i<6; i++)
	{
		cartesian_value[i] = MotionCenterData(i+1);
		if (length == 12) {cartesian_value[i+6] = MotionCenterData(i+7);}
	}

#ifdef FINE_MEM_COUNT
	elog.getErrorStream() << "LBCB_conversion_A2C finished";
	elog.addedError();
#endif

	*error = ProcessErrors("LBCB_Conversion_A2C",tlo);

	return;
}

_declspec(dllexport) void LBCB_conversion_C2A(long type, double motion_center[], double sensor_reading[], double cartesian_value[], long* error)
{

	int i;

	ThreadLocalObjects* tlo = GetThreadLocalObjects();

	if(tlo == NULL) {
		return;
	}
	VECTOR ActuatorSpace(6,tlo), CartesianData(6,tlo);
	VECTOR MotionCenterData(6,tlo);
	VECTOR MotionCenter(3,tlo), PlatformCenter(3,tlo);

	LBCB lbcb(type, tlo);

	for( i = 0; i<6; i++)
	{
		MotionCenterData(i+1) = cartesian_value[i];
	}

	for( i = 0; i<3; i++)
	{
		MotionCenter(i+1) = motion_center[i];
	}

	RigidTransform( MotionCenter, MotionCenterData, PlatformCenter, CartesianData,tlo );
	lbcb.Cartesian2Actuator( CartesianData, ActuatorSpace );

	for( i = 0; i<6; i++)
	{
		sensor_reading[i] = ActuatorSpace(i+1);
	}

	*error = ProcessErrors("LBCB_Conversion_C2A",tlo);
	return;

}

_declspec(dllexport) void LBCB_Conversion_Init(long size,char* filename, long length)
{

	tspace = new ThreadLocalFactory();
	ThreadLocalObjects* tlo = GetThreadLocalObjects();
	MATRIX rbasepin(3,6,tlo), rplatformpin(3,6,tlo), lbasepin(3,6,tlo), lplatformpin(3,6,tlo);

	if (size == 0){// Small Scale LBCB
		rbasepin(1,1) = -19.184;
		rbasepin(2,1) = 4.8039;
		rbasepin(3,1) = -7.0262;
		rplatformpin(1,1) = -5.4347;
		rplatformpin(2,1) = 4.7978;
		rplatformpin(3,1) = -2.5940;

		rbasepin(1,2) = -19.184;
		rbasepin(2,2) = -4.8039;
		rbasepin(3,2) = -7.0262;
		rplatformpin(1,2) = -5.4347;
		rplatformpin(2,2) = -4.7978;
		rplatformpin(3,2) = -2.5940;

		rbasepin(1,3) = 0.079;
		rbasepin(2,3) = -7.6005;
		rbasepin(3,3) = -6.8945;
		rplatformpin(1,3) = -0.1013;
		rplatformpin(2,3) = 3.3364;
		rplatformpin(3,3) = -3.9908;

		rbasepin(1,4) = -5.6232;
		rbasepin(2,4) = 0.0038;
		rbasepin(3,4) = -13.63;
		rplatformpin(1,4) = -5.6253;
		rplatformpin(2,4) = 0.0477;
		rplatformpin(3,4) = -2.62;

		rbasepin(1,5) = 5.9788;
		rbasepin(2,5) = 4.8056;
		rbasepin(3,5) = -13.63;
		rplatformpin(1,5) = 6.0049;
		rplatformpin(2,5) = 4.8093;
		rplatformpin(3,5) = -2.62;

		rbasepin(1,6) = 5.9788;
		rbasepin(2,6) = -4.8056;
		rbasepin(3,6) = -13.63;
		rplatformpin(1,6) = 6.0049;
		rplatformpin(2,6) = -4.8093;
		rplatformpin(3,6) = -2.62;

		lbasepin(1,1) = 19.225;
		lbasepin(2,1) = 4.8;
		lbasepin(3,1) = -7.13;
		lplatformpin(1,1) = 5.4;
		lplatformpin(2,1) = 4.8;
		lplatformpin(3,1) = -2.5;

		lbasepin(1,2) = 19.225;
		lbasepin(2,2) = -4.8;
		lbasepin(3,2) = -7.13;
		lplatformpin(1,2) = 5.4;
		lplatformpin(2,2) = -4.8;
		lplatformpin(3,2) = -2.5;

		lbasepin(1,3) = -0.1;
		lbasepin(2,3) = -7.7;
		lbasepin(3,3) = -7.05;
		lplatformpin(1,3) = -0.1;
		lplatformpin(2,3) = 3.3;
		lplatformpin(3,3) = -4;

		lbasepin(1,4) = 5.6025;
		lbasepin(2,4) = 0.0;
		lbasepin(3,4) = -13.80;
		lplatformpin(1,4) = 5.6025;
		lplatformpin(2,4) = 0.0;
		lplatformpin(3,4) = -2.625;

		lbasepin(1,5) = -5.9775;
		lbasepin(2,5) = 4.8;
		lbasepin(3,5) = -13.80;
		lplatformpin(1,5) = -5.9775;
		lplatformpin(2,5) = 4.8;
		lplatformpin(3,5) = -2.625;

		lbasepin(1,6) = -5.9775;
		lbasepin(2,6) = -4.8;
		lbasepin(3,6) = -13.80;
		lplatformpin(1,6) = -5.9775;
		lplatformpin(2,6) = -4.8;
		lplatformpin(3,6) = -2.625;
	}
	else if (size == 1) { // Large Scale LBCB
		rbasepin(1,1) = -96.375;
		rbasepin(2,1) = 24;
		rbasepin(3,1) = -35.5;
		rplatformpin(1,1) = -27;
		rplatformpin(2,1) = 24;
		rplatformpin(3,1) = -12.875;

		rbasepin(1,2) = -96.375;
		rbasepin(2,2) = -24;
		rbasepin(3,2) = -35.5;
		rplatformpin(1,2) = -27;
		rplatformpin(2,2) = -24;
		rplatformpin(3,2) = -12.875;

		rbasepin(1,3) = 0.5;
		rbasepin(2,3) = -37.375;
		rbasepin(3,3) = -34.75;
		rplatformpin(1,3) = 0.5;
		rplatformpin(2,3) = 16.625;
		rplatformpin(3,3) = -20.25;

		rbasepin(1,4) = -28;
		rbasepin(2,4) = 0.0;
		rbasepin(3,4) = -68.875;
		rplatformpin(1,4) = -28;
		rplatformpin(2,4) = 0.0;
		rplatformpin(3,4) = -12.875;

		rbasepin(1,5) = 30;
		rbasepin(2,5) = 24;
		rbasepin(3,5) = -68.875;
		rplatformpin(1,5) = 30;
		rplatformpin(2,5) = 24;
		rplatformpin(3,5) = -12.875;

		rbasepin(1,6) = 30;
		rbasepin(2,6) = -24;
		rbasepin(3,6) = -68.875;
		rplatformpin(1,6) = 30;
		rplatformpin(2,6) = -24;
		rplatformpin(3,6) = -12.875;

		lbasepin(1,1) = 96.375;
		lbasepin(2,1) = 24;
		lbasepin(3,1) = -35.5;
		lplatformpin(1,1) = 27;
		lplatformpin(2,1) = 24;
		lplatformpin(3,1) = -12.875;

		lbasepin(1,2) = 96.375;
		lbasepin(2,2) = -24;
		lbasepin(3,2) = -35.5;
		lplatformpin(1,2) = 27;
		lplatformpin(2,2) = -24;
		lplatformpin(3,2) = -12.875;

		lbasepin(1,3) = -0.5;
		lbasepin(2,3) = -37.375;
		lbasepin(3,3) = -34.75;
		lplatformpin(1,3) = -0.5;
		lplatformpin(2,3) = 16.625;
		lplatformpin(3,3) = -20.25;

		lbasepin(1,4) = 28;
		lbasepin(2,4) = 0.0;
		lbasepin(3,4) = -68.875;
		lplatformpin(1,4) = 28;
		lplatformpin(2,4) = 0.0;
		lplatformpin(3,4) = -12.875;

		lbasepin(1,5) = -30;
		lbasepin(2,5) = 24;
		lbasepin(3,5) = -68.875;
		lplatformpin(1,5) = -30;
		lplatformpin(2,5) = 24;
		lplatformpin(3,5) = -12.875;

		lbasepin(1,6) = -30;
		lbasepin(2,6) = -24;
		lbasepin(3,6) = -68.875;
		lplatformpin(1,6) = -30;
		lplatformpin(2,6) = -24;
		lplatformpin(3,6) = -12.875;
	} else if (size == 2) { // Portable LBCB 
		rbasepin(1,1) = -19.236625;
		rbasepin(2,1) = 1.7395;
		rbasepin(3,1) = -5.163;
		rplatformpin(1,1) = -5.3;
		rplatformpin(2,1) = 4.8;
		rplatformpin(3,1) = -2.98;

		rbasepin(1,2) = -19.236625;
		rbasepin(2,2) = -2.198;
		rbasepin(3,2) = -5.163;
		rplatformpin(1,2) = -5.3;
		rplatformpin(2,2) = -4.8;
		rplatformpin(3,2) = -2.98;

		rbasepin(1,3) = -0.161875;
		rbasepin(2,3) = -9.504;
		rbasepin(3,3) = -5.163;
		rplatformpin(1,3) = 0.282;
		rplatformpin(2,3) = 1.491;
		rplatformpin(3,3) = -2.98;

		rbasepin(1,4) = -5.963125;
		rbasepin(2,4) = -0.213;
		rbasepin(3,4) = -13.5165;
		rplatformpin(1,4) = -5.8;
		rplatformpin(2,4) = 0.0;
		rplatformpin(3,4) = -2.355;

		rbasepin(1,5) = 5.647125;
		rbasepin(2,5) = 4.537;
		rbasepin(3,5) = -13.5165;
		rplatformpin(1,5) = 5.8;
		rplatformpin(2,5) = 4.8;
		rplatformpin(3,5) = -2.355;

		rbasepin(1,6) = 5.647125;
		rbasepin(2,6) = -5.0255;
		rbasepin(3,6) = -13.5165;
		rplatformpin(1,6) = 5.8;
		rplatformpin(2,6) = -4.8;
		rplatformpin(3,6) = -2.355;

		lbasepin(1,1) = -19.236625;
		lbasepin(2,1) = 1.7395;
		lbasepin(3,1) = -5.163;
		lplatformpin(1,1) = -5.3;
		lplatformpin(2,1) = 4.8;
		lplatformpin(3,1) = -2.98;

		lbasepin(1,2) = -19.236625;
		lbasepin(2,2) = -2.198;
		lbasepin(3,2) = -5.163;
		lplatformpin(1,2) = -5.3;
		lplatformpin(2,2) = -4.8;
		lplatformpin(3,2) = -2.98;

		lbasepin(1,3) = -0.161875;
		lbasepin(2,3) = -9.504;
		lbasepin(3,3) = -5.163;
		lplatformpin(1,3) = 0.282;
		lplatformpin(2,3) = 1.491;
		lplatformpin(3,3) = -2.98;

		lbasepin(1,4) = -5.963125;
		lbasepin(2,4) = -0.213;
		lbasepin(3,4) = -13.5165;
		lplatformpin(1,4) = -5.8;
		lplatformpin(2,4) = 0.0;
		lplatformpin(3,4) = -2.355;

		lbasepin(1,5) = 5.647125;
		lbasepin(2,5) = 4.537;
		lbasepin(3,5) = -13.5165;
		lplatformpin(1,5) = 5.8;
		lplatformpin(2,5) = 4.8;
		lplatformpin(3,5) = -2.355;

		lbasepin(1,6) = 5.647125;
		lbasepin(2,6) = -5.0255;
		lbasepin(3,6) = -13.5165;
		lplatformpin(1,6) = 5.8;
		lplatformpin(2,6) = -4.8;
		lplatformpin(3,6) = -2.355;
	} else if (size == 3) { // Mid-sized LBCB @ the University of Houston. 
	
/*		X1		X2		Y		Z1		Z2		Z3
Base
	x	-36.813	-36.813	0		-12		12		12
	y	12		-12		-19.062	0		12		-12
	z	-15.28	-15.28	-17.698	-30.688	-30.688	-30.688

Platx	-9.525	-9.525	0		-12		12		12
	y	12		-12		12		0		12		-12
	z	-6.875	-6.875	-8.625	-4.25	-4.25	-4.25
*/
		
		rbasepin(1,1) = -36.813;
		rbasepin(2,1) = 12;
		rbasepin(3,1) = -15.28;
		rplatformpin(1,1) = -9.525;
		rplatformpin(2,1) = 12;
		rplatformpin(3,1) = -6.875;

		rbasepin(1,2) = -36.813;
		rbasepin(2,2) = -12;
		rbasepin(3,2) = -15.28;
		rplatformpin(1,2) = -9.525;
		rplatformpin(2,2) = -12;
		rplatformpin(3,2) = -6.875;

		rbasepin(1,3) = 0;
		rbasepin(2,3) = -19.062;
		rbasepin(3,3) = -17.698;
		rplatformpin(1,3) = 0;
		rplatformpin(2,3) = 12;
		rplatformpin(3,3) = -8.625;

		rbasepin(1,4) = -12;
		rbasepin(2,4) = 0;
		rbasepin(3,4) = -30.688;
		rplatformpin(1,4) = -12;
		rplatformpin(2,4) = 0.0;
		rplatformpin(3,4) = -4.25;

		rbasepin(1,5) = 12;
		rbasepin(2,5) = 12;
		rbasepin(3,5) = -30.688;
		rplatformpin(1,5) = 12;
		rplatformpin(2,5) = 12;
		rplatformpin(3,5) = -4.25;

		rbasepin(1,6) = 12;
		rbasepin(2,6) = -12;
		rbasepin(3,6) = -30.688;
		rplatformpin(1,6) = 12;
		rplatformpin(2,6) = -12;
		rplatformpin(3,6) = -4.25;

		lbasepin(1,1) = -36.813;
		lbasepin(2,1) = 12;
		lbasepin(3,1) = -15.28;
		lplatformpin(1,1) = -9.525;
		lplatformpin(2,1) = 12;
		lplatformpin(3,1) = -6.875;

		lbasepin(1,2) = -36.813;
		lbasepin(2,2) = -12;
		lbasepin(3,2) = -15.28;
		lplatformpin(1,2) = -9.525;
		lplatformpin(2,2) = -12;
		lplatformpin(3,2) = -6.875;

		lbasepin(1,3) = 0;
		lbasepin(2,3) = -19.062;
		lbasepin(3,3) = -17.698;
		lplatformpin(1,3) = 0;
		lplatformpin(2,3) = 12;
		lplatformpin(3,3) = -8.625;

		lbasepin(1,4) = -12;
		lbasepin(2,4) = 0;
		lbasepin(3,4) = -30.688;
		lplatformpin(1,4) = -12;
		lplatformpin(2,4) = 0.0;
		lplatformpin(3,4) = -4.25;

		lbasepin(1,5) = 12;
		lbasepin(2,5) = 12;
		lbasepin(3,5) = -30.688;
		lplatformpin(1,5) = 12;
		lplatformpin(2,5) = 12;
		lplatformpin(3,5) = -4.25;

		lbasepin(1,6) = 12;
		lbasepin(2,6) = -12;
		lbasepin(3,6) = -30.688;
		lplatformpin(1,6) = 12;
		lplatformpin(2,6) = -12;
		lplatformpin(3,6) = -4.25;

	}

	LBCB_Parameters::Create(rbasepin, rplatformpin, lbasepin, lplatformpin, tlo );
	LBCB_Conversion_SetErrorLogFile(filename,length);
	ProcessErrors("LBCB_Conversion_Init",tlo);
}

_declspec(dllexport) void LBCB_Conversion_SetErrorLogFile(char* filename, long length)
{
	string Filename(filename,filename + length);
	tspace->getErrorLog()->setFile(Filename);
}
