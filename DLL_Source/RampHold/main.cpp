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
_declspec(dllexport) void RampHold(long *Trigger, long *Start, long Pause, long Auto, long Size, long Type[], double PreSignal[], double CurSignal[], double TarSignal[], double RampTime[], double *Ratio, long Time[], long MiddleLoop[]);
}

_declspec(dllexport) void RampHold(long *Trigger, long *Start, long Pause, long Auto, long Size, long Type[], double PreSignal[], double CurSignal[], double TarSignal[], double RampTime[], double *Ratio, long Time[], long MiddleLoop[])
	{

	int i;
	// Case - Idle
	if (*Start==0)
	{
		// Change 'Pause' to 'Off'
		*Trigger = 0;
		Time[2] = 0;  // Status -Idle

		for(i=0; i<Size; i++){PreSignal[i] = CurSignal[i];}

	}
	// Case - Ramp, Convergence and Hold
	else
	{
		if(RampTime[0] <= 0){*Start = 0;Time[2] = 4;return;}

		if (*Trigger==1) // Start Ramp
		{
			// Set Time Properties
			Time[1] = Time[0];           // Initial Time  = Current Time;

			// Reset Trigger
			*Trigger = 0;
		}
		else
		{
			if (Pause==1 || MiddleLoop[1]==1)  // Pause or Middle Loop mode
			{
				Time[1] = Time[0] - int(1000*(*Ratio)*RampTime[0]);
			}
			else // Advancing Clock
			{
				double  t = (double(Time[0]) - double(Time[1]))/1000;
				*Ratio = t/RampTime[0];
			}
							
			if (*Ratio < 1)  // Case - Ramp
			{
				for(i=0; i<Size; i++)
				{	
					if (Type[i] == 0) // Sine Wave
					{
						CurSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*sin((*Ratio+1.5)*PI);
					}
					else if (Type[i] == 1 ) // Triangle Wave
					{
						CurSignal[i] = (TarSignal[i]+PreSignal[i])/2+(TarSignal[i]-PreSignal[i])/2*(2*(*Ratio)-1);
					}
				}
				Time[2] = 1; // Status -Ramp
			}	
			else
			{
				// Set Previous and Current Signals to the Target Signal
				for(i=0; i<Size; i++){CurSignal[i] = TarSignal[i];} 

				if (MiddleLoop[0] == 1 && Time[2] == 1) 
				{
					MiddleLoop[1]=1;Time[2]=2;
					for(i=0; i<Size; i++){PreSignal[i] = TarSignal[i];} 
				} // Just after Ramp
				else if (MiddleLoop[0] == 1 && MiddleLoop[1] == 1) 
				{
					MiddleLoop[1]=1;Time[2]=2;
					for(i=0; i<Size; i++){PreSignal[i] = TarSignal[i];} 
				} // In Convergence
				else
				{
					if(RampTime[1] == 0)  // Done (No Holding)
					{
						for(i=0; i<Size; i++){PreSignal[i] = TarSignal[i];} 
						if (Auto==1){*Trigger=1; Time[1]=Time[0];}
						else {*Start=0;*Trigger=1;}
						*Ratio = 0;  // Initialization
						Time[2] = 0; // Status -Idle
					}
					else
					{
						if (*Ratio < 1+RampTime[1]/RampTime[0]){Time[2] = 3;}  // Status -Hold
						else
						{
							for(i=0; i<Size; i++){PreSignal[i] = TarSignal[i];} 
							if (Auto==1){*Trigger=1; Time[1]=Time[0];}
							else {*Start=0;*Trigger=1;}
							*Ratio = 0;
							Time[2] = 0; // Status -Idle
						}
					}
				}
			}
		}
	}
	return;

	}