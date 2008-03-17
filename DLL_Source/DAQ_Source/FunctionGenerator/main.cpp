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
double SineWave( double, double, double );
double TriangleWave( double, double, double );

extern "C" {
_declspec(dllexport) void FunctionGenerator(long Trigger, long *Start, long *Pause, long Size, double Signal[], long Type[], double Amplitude[], double Frequency[], double Cycle[], double InitialPhase[], double AdjustPhase[], double LastPhase[], double Offset[], double LastSignal[], long Time[]);
}

_declspec(dllexport) void FunctionGenerator(long Trigger, long *Start, long *Pause, long Size, double Signal[], long Type[], double Amplitude[], double Frequency[], double Cycle[], double InitialPhase[], double AdjustPhase[], double LastPhase[], double Offset[], double LastSignal[], long Time[])
	{

	int i;
	// Case-OFF
	if (*Start==0)
	{
		// Change 'Pause' to 'Off'
		*Pause = 0;
	}
	// Case-ON
	else
	{
		if (Trigger==1)
		{
			// Set All Adjust Phase Zero
			for(i=0; i<Size; i++){AdjustPhase[i]=0;}

			// Set Time Properties
			Time[1] = Time[0];           // Previous Time = Current Time;
			Time[2] = Time[0];           // Initial Time  = Current Time;

			// Calcurate the Final Signals
			for(i=0; i<Size; i++)
			{
				if (Type[i] == 1) // Sine Wave
				{
					Offset[i] = Signal[i] - Amplitude[i]*sin(InitialPhase[i]);
					LastSignal[i] = Amplitude[i]*sin(2*PI*Cycle[i]+InitialPhase[i]) + Offset[i];
				}
				else if (Type[i] == 2) // Triangle Wave
				{
					Offset[i] = Signal[i] - Amplitude[i]*TriangleWave( 0, 0, InitialPhase[i]);
					LastSignal[i] = Amplitude[i]*TriangleWave( 0, 0, 2*PI*Cycle[i]+InitialPhase[i]) + Offset[i];
				}
			}
		}
		else
		{

			if (*Pause==0) // Pause is 'Off', means running.
			{
				double  t = (double(Time[0]) - double(Time[2]))/1000;
				double dt = (double(Time[0]) - double(Time[1]))/1000;
				Time[1] = Time[0];
				double TempCycle;
	
				for(i=0; i<Size; i++)
				{
					TempCycle = Cycle[i] - Frequency[i]*dt;
				
					if (TempCycle < 0) // Number of Cycle is zero
					{
						Signal[i] = LastSignal[i];
						Cycle[i] = 0;
					}
					else // Main Loop
					{
						if (Type[i] == 1) // Sine Wave
						{
							Signal[i] = Amplitude[i]*SineWave(t,Frequency[i],InitialPhase[i]+AdjustPhase[i])+Offset[i];
						}
						else if (Type[i] == 2 ) // Triangle Wave
						{
							Signal[i] = Amplitude[i]*TriangleWave(t,Frequency[i],InitialPhase[i]+AdjustPhase[i])+Offset[i];
						}
						LastPhase[i] = fmod(2*PI*Frequency[i]*t+InitialPhase[i]+AdjustPhase[i],2*PI);
						Cycle[i] = TempCycle;
					}
				}

				// Check if all the cycles are zero or not
				int index = 0;
				for (i=0; i<Size; i++)
				{
					if (Cycle[i]>0){index=1;}
				}
				if( index == 0 ){*Start=0;}
			}
			else // Pause is 'On'.
			{
				for(i=0; i<Size; i++){ AdjustPhase[i] = LastPhase[i] - InitialPhase[i];}
				Time[1] = Time[0];
				Time[2] = Time[0];
			}
		}
	}

	return;

	}

// Local Functions
double SineWave ( double t, double f, double ph )
{
	return( sin(2*PI*f*t+ph) );
}

double TriangleWave ( double t, double f, double ph )
{
	double rem = fmod(2*PI*f*t+ph, 2*PI);

	if (rem<PI/2){return( rem/(PI/2) );}
	else if (rem>=PI/2 && rem<=1.5*PI) { return(2-2*rem/PI);}
	else { return( rem/(PI/2) - 4 );}
}
