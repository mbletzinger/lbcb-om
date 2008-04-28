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
	ThreadLocalObjects* tlo = tspace->GetLocalObjects(threadid);
	if(tlo != NULL)
	{
		return tlo;
	}
	ErrorLogger* elog = new ErrorLogger(threadid);
	MemoryCounterFactory* mcf = new MemoryCounterFactory(); 
	tlo = new ThreadLocalObjects();
	tlo->SetErrorLogger(elog);
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
	ErrorLogger* elog = tlo->GetErrorLogger();
	elog->SetPrefix(name);
	if(elog->hasError()) {
		result = 1;
		elog->flush();
	}

	MemoryCounterFactory* mcf = tlo->GetMemoryCounterFactory(); 
	if(mcf->IsRunCounterExpired())
	{
		mcf->LogMemoryUse();
		elog->flush();
	}
	return result;
}

_declspec(dllexport) void LBCB_Conversion_A2C( double motion_center[], long length, double sensor_reading[], double cartesian_value[], long* error)
{
	int i;

#ifdef FINE_MEM_COUNT
	elog.getErrorStream() << "LBCB_conversion_A2C started";
	elog.addedError();
#endif

	ThreadLocalObjects* tlo = GetThreadLocalObjects();
	VECTOR MotionCenter(3,tlo), PlatformCenter(3,tlo), ActuatorSpace(12,tlo), CartesianData(12,tlo), MotionCenterData(12,tlo), Limitation(6,tlo);
	for(i=0; i<3; i++){MotionCenter(i+1) = motion_center[i];}

	for( i = 0; i<6; i++)
	{
		ActuatorSpace(i+1) = sensor_reading[i];
		if (length == 12) {ActuatorSpace(i+7) = sensor_reading[i+6];}
		Limitation(i+1) = 0.00001;
	}
	LBCB lbcb(tlo);
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

_declspec(dllexport) void LBCB_conversion_C2A(double motion_center[], double sensor_reading[], double cartesian_value[], long* error)
{

	int i;

	ThreadLocalObjects* tlo = GetThreadLocalObjects();

	VECTOR ActuatorSpace(6,tlo), CartesianData(6,tlo);
	VECTOR MotionCenterData(6,tlo);
	VECTOR MotionCenter(3,tlo), PlatformCenter(3,tlo);

	LBCB lbcb(tlo);

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

_declspec(dllexport) void LBCB_Conversion_Init(long size, long type)
{

	ThreadLocalFactory::InitCSV();
	ErrorLogger::InitCSV();
	tspace = new ThreadLocalFactory();
	ThreadLocalObjects* tlo = GetThreadLocalObjects();
	MATRIX basepin(3,6,tlo), platformpin(3,6,tlo);

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

	LBCB_Parameters::Create(  basepin, platformpin,tlo );
	ErrorLogger* elog = tlo->GetErrorLogger();
	elog->SetPrefix("LBCB_Conversion_Init");

	MemoryCounterFactory* mcf = tlo->GetMemoryCounterFactory(); 
	mcf->LogMemoryUse();
	elog->flush();
}

_declspec(dllexport) void LBCB_Conversion_SetErrorLogFile(char* filename, long length)
{
	string Filename(filename,filename + length);
	ErrorLogger::setFile(Filename);
}
