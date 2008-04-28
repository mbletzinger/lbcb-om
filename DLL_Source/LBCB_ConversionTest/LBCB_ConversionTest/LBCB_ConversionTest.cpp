// LBCB_ConversionTest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include "LBCB_Conversion.h"
#include<iostream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{

	long size = 1;
	long type = 1;
	double motion_center[] = {-12.0, -6.0, 48.78}; // 3 elements
	long length = 6;
	double sensor_readings6[] = {6.035, -0.17, -1.109,0.0,0.0,0.0};
	double return_sensor_readings6[] = {0.0, 0.0, 0.0,0.0,0.0,0.0};
	double cartesian_value6[] = {0.0,0.0,0.0,0.0,0.0,0.0};
	long error;
	LBCB_Conversion_Init(size, type);
	LBCB_Conversion_SetErrorLogFile("c:\\Documents and Settings\\adminmbletzin\\Desktop\\DLLError.txt",60);

	for (int r=1; r <= 3000; r++) { 
		LBCB_Conversion_A2C(motion_center,length, sensor_readings6, cartesian_value6,&error);
		LBCB_conversion_C2A(motion_center, return_sensor_readings6, cartesian_value6, &error);
		for (int i = 0; i < 6; i++) {
			cout<<"dif["<<i<<"]="<<(return_sensor_readings6[i] - sensor_readings6[i])<<endl;
		}
	}
	return 0;
}

