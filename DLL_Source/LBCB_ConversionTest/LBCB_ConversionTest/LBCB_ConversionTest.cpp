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
	double cartesian_value6[] = {0.0,0.0,0.0,0.0,0.0,0.0};
	double sensor_readings12[] = {6.035, -0.17, -1.109,0.0,0.0,0.0,6.035, -0.17, -1.109,0.0,0.0,0.0};
	double cartesian_value12[] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
	long error;
	LBCB_conversion_A2C_Init();
	LBCB_conversion_A2C_SetErrorLogFile("c:\\Documents and Settings\\adminmbletzin\\Desktop\\DLLError.txt",60);
	LBCB_conversion_A2C(size, type, motion_center,length, sensor_readings6, cartesian_value6,&error);

	for (int i = 0; i < 6; i++) {
		cout<<"cart["<<i<<"]="<<cartesian_value6[i]<<endl;
	}

	return 0;
}

