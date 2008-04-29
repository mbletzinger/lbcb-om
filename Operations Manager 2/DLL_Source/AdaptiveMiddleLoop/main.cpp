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
_declspec(dllexport) void AdaptiveMiddleLoop(long *Flag, double TargetCommand[], double MeasuredValue[], double MiddleConstant[], double IGain[], double Tolerance[], double MiddleLimit[], double InitError[], double Time[]);
}

_declspec(dllexport) void AdaptiveMiddleLoop(long *Flag, double TargetCommand[], double MeasuredValue[], double MiddleConstant[], double IGain[], double Tolerance[], double MiddleLimit[], double InitError[], double Time[])	
{

	// Time[0]: Elapsed Time (sec)
	// Time[1]: Time Increment (sec)
	// Time[2]: Initial Holding Time (sec)
	// Time[3]: Evaluation Time (sec)

	if (*Flag==0){Time[0] = 0;}
	else  // Middle Loop Start
	{
		Time[0] = Time[0] + Time[1];

		if (Time[0]<=Time[2])  // Initial Holding -No Update
		{
			for (int i=0; i<6; i++)
			{InitError[i] = TargetCommand[i] - MeasuredValue[i];} // Initial Error
		} 
		else  // Middle Loop ON
		{
			int index = 0, update=0, limit;
			double error;

			if(Time[0]>Time[2]+Time[3]){Time[0]=Time[2];update=1;}

			for (int i=0; i<6; i++)
			{
				limit = 0;
				error = TargetCommand[i] - MeasuredValue[i];
	
				// Update Middle Loop Constant
				MiddleConstant[i] = MiddleConstant[i] + IGain[i] * error * Time[1];


				// Check Middle Loop Limit
				if (fabs(MiddleConstant[i]) > MiddleLimit[i])
				{
					MiddleConstant[i] = MiddleConstant[i]/fabs(MiddleConstant[i])*MiddleLimit[i];
					limit = 1;
				}
				if (fabs(error) > Tolerance[i]) // Not Converged Yet!	
				{
					if (limit==0){index = 1;}
					if(error * InitError[i] < 0){IGain[i] = IGain[i]/2;InitError[i] = error;} // Gain is too high!
					if(update==1&&error/InitError[i]>1/2){IGain[i] = 2*IGain[i];InitError[i] = error;} // Gain is too small!
				} 			
			}
			if (index == 0){*Flag = 0;} // Converged!
		}

	}
	for (int i=0; i<6; i++){TargetCommand[i] = TargetCommand[i] + MiddleConstant[i];}

	return;

}