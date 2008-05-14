// LBCB_ConversionTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>
#include "LBCB_Conversion.h"
#include<iostream>
#include<sstream>
#include<fstream>

using namespace std;

#define MAX_THREADS 20

const char* OutFileRoot = "c:\\Documents and Settings\\adminmbletzin\\Desktop\\Logs\\LBCB_ConversionTest";
DWORD WINAPI ThreadCalc( LPVOID lpParam );

int _tmain(int argc, _TCHAR* argv[])
{

	HANDLE  hThreadArray[MAX_THREADS]; 
	DWORD   dwThreadIdArray[MAX_THREADS];
	long size = 1;
	long type = 1;
//	LBCB_Conversion_Init(size);
//	LBCB_Conversion_SetErrorLogFile("c:\\Documents and Settings\\adminmbletzin\\Desktop\\Logs\\DLLError.txt",65);

	for (int i=0; i < MAX_THREADS; i++) {
		int* sleept = new int(1);
		*sleept = (i+1)*5;
//		ThreadCalc((LPVOID)sleept);
		hThreadArray[i] = CreateThread( 
			NULL,                   // default security attributes
			0,                      // use default stack size  
			ThreadCalc,       // thread function name
			sleept,          // argument to thread function 
			0,                      // use default creation flags 
			&dwThreadIdArray[i]);   // returns the thread identifier 

	}
	WaitForMultipleObjects(MAX_THREADS, hThreadArray, TRUE, INFINITE);

	 // Close all thread handles and free memory allocations.

	for(int i=0; i<MAX_THREADS; i++)
	{
		CloseHandle(hThreadArray[i]);
	}

	return 0;
}
DWORD WINAPI ThreadCalc( LPVOID lpParam )
{
	double motion_center[] = {-71.6724, 38.1921, -2.22738}; // 3 elements
	long length = 12;
	double sensor_readings[] = {-5.27793,-6.42469,-3.41438,-3.6171,-4.04886,-4.33768,-214.824,-246.598,-260.05,-287.751,-215.424,-243.457};;
	double return_sensor_readings[] = {0.0, 0.0, 0.0,0.0,0.0,0.0,0.0, 0.0, 0.0,0.0,0.0,0.0};
	double cartesian_value[] = {0.0, 0.0, 0.0,0.0,0.0,0.0,0.0, 0.0, 0.0,0.0,0.0,0.0};
	long error;

	int* sleeptime = (int*)lpParam;
	ostringstream filenamestrm;
	filenamestrm << OutFileRoot << sleeptime<<".txt";
	string filename = filenamestrm.str();
	long type = 0;

	for (int r=1; r <= 300; r++) { 
		LBCB_Conversion_A2C(type, motion_center,length, sensor_readings, cartesian_value,&error);
		LBCB_conversion_C2A(type, motion_center, return_sensor_readings, cartesian_value, &error);
		ofstream Logout (filename.c_str(), ios_base::out | ios_base::app);
		for (int i = 0; i < 6; i++) {
			Logout<<(return_sensor_readings[i] - sensor_readings[i])<<",";
		}
		Logout<<endl;
		Logout.close();
		Sleep(*sleeptime);
		type = ! type;
	}
	return 0;
}
