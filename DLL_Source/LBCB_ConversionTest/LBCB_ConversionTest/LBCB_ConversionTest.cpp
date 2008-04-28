// LBCB_ConversionTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>
#include "LBCB_Conversion.h"
#include<iostream>
#include<sstream>
#include<fstream>

using namespace std;

#define MAX_THREADS 5

const char* OutFileRoot = "c:\\Documents and Settings\\adminmbletzin\\Desktop\\LBCB_ConversionTest";
DWORD WINAPI ThreadCalc( LPVOID lpParam );
HANDLE  hThreadArray[MAX_THREADS]; 
DWORD   dwThreadIdArray[MAX_THREADS];

int _tmain(int argc, _TCHAR* argv[])
{

	long size = 1;
	long type = 1;
	LBCB_Conversion_Init(size, type);
	LBCB_Conversion_SetErrorLogFile("c:\\Documents and Settings\\adminmbletzin\\Desktop\\DLLError.txt",60);

	for (int i=1; i <= MAX_THREADS; i++) {
		int* sleept = new int(1);
		*sleept = i*10;
		ThreadCalc((LPVOID)sleept);
		//hThreadArray[i] = CreateThread( 
		//	NULL,                   // default security attributes
		//	0,                      // use default stack size  
		//	ThreadCalc,       // thread function name
		//	sleept,          // argument to thread function 
		//	0,                      // use default creation flags 
		//	&dwThreadIdArray[i]);   // returns the thread identifier 

	}
//	WaitForMultipleObjects(MAX_THREADS, hThreadArray, TRUE, INFINITE);

	// Close all thread handles and free memory allocations.

	//for(int i=0; i<MAX_THREADS; i++)
	//{
	//	CloseHandle(hThreadArray[i]);
	//}

	return 0;
}
DWORD WINAPI ThreadCalc( LPVOID lpParam )
{
	double motion_center[] = {-12.0, -6.0, 48.78}; // 3 elements
	long length = 6;
	double sensor_readings6[] = {6.035, -0.17, -1.109,0.0,0.0,0.0};
	double return_sensor_readings6[] = {0.0, 0.0, 0.0,0.0,0.0,0.0};
	double cartesian_value6[] = {0.0,0.0,0.0,0.0,0.0,0.0};
	long error;

	int* sleeptime = (int*)lpParam;
	ostringstream filenamestrm;
	filenamestrm << OutFileRoot << sleeptime<<".txt";
	string filename = filenamestrm.str();

	for (int r=1; r <= 300; r++) { 
		LBCB_Conversion_A2C(motion_center,length, sensor_readings6, cartesian_value6,&error);
		LBCB_conversion_C2A(motion_center, return_sensor_readings6, cartesian_value6, &error);
		ofstream Logout (filename.c_str(), ios_base::out | ios_base::app);
		for (int i = 0; i < 6; i++) {
			Logout<<(return_sensor_readings6[i] - sensor_readings6[i])<<",";
		}
		Logout<<endl;
		Logout.close();
		Sleep(*sleeptime);
	}
	return 0;
}
