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

#define PI 3.1415926535

extern "C" {
_declspec(dllexport) void StepwiseRamp(long *Trigger, long *Start, long *Pause, long *Auto, long Size, long Type[], double PreSignal[], double TarSignal[], double RampTime[], double *Ratio, long Time[], long MiddleLoop[]);
}

_declspec(dllexport) void StepwiseRamp(long *Trigger, long *Start, long *Pause, long *Auto, long Size, long Type[], double PreSignal[], double TarSignal[], double RampTime[], double *Ratio, long Time[], long MiddleLoop[])
	{

	int i;
	// Case-OFF
	if (*Start==0)
	{
		// Change 'Pause' to 'Off'
		*Pause = 0;
		*Trigger = 0;
		*Auto = 0;

		for(i=0; i<Size; i++)
		{	
			if (Type[i] == 0) // Sine Wave
			{
				PreSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*sin((*Ratio+1.5)*PI);
			}
			else if (Type[i] == 1 ) // Triangle Wave
			{
				PreSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*(2*(*Ratio)-1);
			}
		}
	}
	// Case-ON
	else
	{
		if (*Trigger==1)
		{
			// Set Time Properties
			Time[1] = Time[0];           // Initial Time  = Current Time;

			// Reset Trigger
			*Trigger = 0;
		}
		else
		{
			if (*Pause==1 || MiddleLoop[1]==1)
			{
				Time[1] = Time[0] - int(1000*(*Ratio)*RampTime[0]);
			}
			else
			{
				double  t = (double(Time[0]) - double(Time[1]))/1000;
				*Ratio = t/RampTime[0];
			}
							
			if (*Ratio < 1)
			{
				for(i=0; i<Size; i++)
				{	
					if (Type[i] == 0) // Sine Wave
					{
						PreSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*sin((*Ratio+1.5)*PI);
					}
					else if (Type[i] == 1 ) // Triangle Wave
					{
						PreSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*(2*(*Ratio)-1);
					}
				}
				*Auto = 1;
			}	
			else
			{
				for(i=0; i<Size; i++){PreSignal[i] = TarSignal[i];}

				if (MiddleLoop[0] == 1 && MiddleLoop[2] == 1) {MiddleLoop[1]=1;*Auto=2;}
				else if (MiddleLoop[0] == 1 && MiddleLoop[1] == 1) {MiddleLoop[1]=1;*Auto=2;} 
				else
				{
					if(RampTime[1] == 0)  // Done
					{
						if (*Auto==1){*Trigger=1; Time[1]=Time[0];}
						else {*Start=0;*Trigger=0;}
						*Ratio = 0;
						*Auto = 0;
					}
					else
					{
						if (*Ratio < 1+RampTime[1]/RampTime[0]){*Auto = 3;}
						else
						{
							if (*Auto==1){*Trigger=1; Time[1]=Time[0];}
							else {*Start=0;*Trigger=0;}
							*Ratio = 0;
							*Auto = 0;
						}
					}
				}
			}
		}
	}
	return;

	}