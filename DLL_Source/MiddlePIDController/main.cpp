/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
/* Call Library Source File */

#include "extcode.h"
#include "windows.h"
#include "string.h"
#include <cmath>

extern "C" {
_declspec(dllexport) void MiddlePIDController(long *Flag, double TargetCommand[], double MeasuredValue[], double MiddleConstant[], double PGain[], double IGain[], double DGain[], double Tolerance[], double AccumError[], double PreError[], double dt);
}

_declspec(dllexport) void MiddlePIDController(long *Flag, double TargetCommand[], double MeasuredValue[], double MiddleConstant[], double PGain[], double IGain[], double DGain[], double Tolerance[], double AccumError[], double PreError[], double dt)
	{

	if (*Flag==0)
	{
		for (int i=0; i<6; i++)
		{
			TargetCommand[i] = TargetCommand[i] + MiddleConstant[i];
			AccumError[i] = 0;
			PreError[i] = 0;
		}
		*Flag = 0;
	}
	else
	{
		int index = 1;
		double Error;

		for (int i=0; i<6; i++)
		{
			Error = TargetCommand[i] - MeasuredValue[i];
			AccumError[i] = IGain[i] * Error * dt + AccumError[i];

			double TempP, TempD;

			if (fabs(Error)>=Tolerance[i])
			{
				index = 0;
				TempP = PGain[i] * Error;
				TempD = DGain[i] * (Error - PreError[i]);
				MiddleConstant[i] = MiddleConstant[i] + TempP + TempD + AccumError[i];
			}
			PreError[i] = Error;
			TargetCommand[i] = TargetCommand[i] + MiddleConstant[i];
			*Flag = 1;

			if (index==1)
			{
				*Flag = 0;
				for (int i=0; i<6; i++){AccumError[i] = 0; PreError[i]=0;}	
			}			
		}
	}

	return;

	}