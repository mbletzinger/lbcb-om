/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
/* Call Library Source File */

/* 

  Source Code for a Mixed-mode Control Algorithm for Load and Boundary Condition Boxes(LBCBs)

									Narutoshi Nakata (nakata@uiuc.edu)
							University of Illinois at Urbana-Champaign
														March 26, 2006

  */
#include "extcode.h"
#include "windows.h"
#include <cmath>

void ConvergenceCheck( long ControlMode[], double TargetCommand[], double CurrentCartesian[], double ErrorRange[], long &ErrorIndex, long *MaxErrorIndex);
void UpdateJacobian( double CartesianIncrement[], double Jacobian[] );
void UpdateCommand( double TargetMixCommand[], double TargetDispCommand[], double CurrentCartesian[], double Jacobian[], double JacobianGain[], double MaxIncrement[], long *MaxErrorIndex);

extern "C" {
_declspec(dllexport) void MixedMode2DirecMethod(long *Start, long *Trigger, long *Flag, long ControlMode[], double TargetMixCommand[], double TargetDispCommand[], double CurrentCartesian[], double LastCartesian[], double Jacobian[], double JacobianGain[], double ErrorRange[], double MaxIncrement[], long *MaxErrorIndex);
}

_declspec(dllexport) void MixedMode2DirecMethod(long *Start, long *Trigger, long *Flag, long ControlMode[], double TargetMixCommand[], double TargetDispCommand[], double CurrentCartesian[], double LastCartesian[], double Jacobian[], double JacobianGain[], double ErrorRange[], double MaxIncrement[], long *MaxErrorIndex)
{
	/*                   DATA SYNTAX and SIZE
	INPUT                                            OUTPUT
	Start (Top) <1> -------------------------------> Start (Ramp) <1>
	Trigger (Ramp) <1> ----------------------------> Convergence (Top) <1>
	Flag (Process State) <1> ----------------------> Flag (Process State) <1>
	Control Mode (0: Displacement, 1: Load) <6>
	TargetMixCommand <6>
	TargetDispCommand <6> -------------------------> TargetDispCommand <6>
	CurrentCartesian <12> -------------------------> CurrentCartesian <12>
	LastCartesian <12> ----------------------------> LastCartesian <12>
	Jacobian <36> ---------------------------------> Jacobian <36>
	Jacobian Gain <6> --------------||-------------> DisplacementDirectional <6>
	ErrorRange <6> -----------------||-------------> DirectionalJacobian <6>
	MaxIncrement <6> ---------------||-------------> LastMixedCommand <6>
	MaxErrorIndex <1> -----------------------------> MaxErrorIndex <1>
	*/

	long i;

	if (*Start == 0) // Status -Idle, waiting for start
	{
		*Flag = 0; // Status - Idle
		for ( i=0; i<6; i++)
		{
			TargetDispCommand[i] = TargetMixCommand[i];
			if (ControlMode[i]==1){TargetDispCommand[i] = LastCartesian[i];} // Set Initial Ramp
			LastCartesian[i]   = CurrentCartesian[i];     // Put CurrentCartesian in LastCartesian
			LastCartesian[i+6] = CurrentCartesian[i+6]; 
		}
	}
	else // Status -Running
	{	
		// Internal Variables
		long ErrorIndex = 0;

		if (*Flag == 0) // Start Initial Ramp
		{
			*Start = 0;
			*Trigger = 0; // Reset Convergence 0

			// Check whether it should go to Initial Ramp or Iterative Ramp
			long InitialIndex = 0;
			for ( i=0; i<6; i++)
			{
				if (ControlMode[i]==0 && TargetDispCommand[i]!=CurrentCartesian[i]){InitialIndex = 1;}
			}

			if (InitialIndex){ *Flag = 1;}  // Go to the Initial Ramp
			else { *Flag = 3;}                 // Go to the Iterative Ramp
		}
		else if (*Flag == 1)  // Running Initial Ramp
		{
			if (*Trigger == 1) // Initial Ramp Done!
			{
				*Start = 0;   // Stop Ramp
				*Flag = 2;    // Go to the Decision Making Step
				*Trigger = 0;
			}
		}
		else if (*Flag == 2)  // Decision Making Step, Converged or Go to Iterative Ramp?
		{
				*Start = 0; // Temporary Stop Ramp
				
				// Check Force Convergence
				ConvergenceCheck( ControlMode, TargetMixCommand, CurrentCartesian, ErrorRange, ErrorIndex, MaxErrorIndex);

				if (ErrorIndex == 0)
				{			
					for (i=0; i<6; i++){MaxIncrement[i] = TargetMixCommand[i];}
					*Flag = 6;
				} // Converged!
				else { *Flag = 3;}               // Not Converged.

				// Update LastCartesian
				double CartesianIncrement[12];
				for ( i=0; i<12; i++) 
				{
					CartesianIncrement[i] = CurrentCartesian[i] - LastCartesian[i];
					LastCartesian[i] = CurrentCartesian[i];
				}

				// Update Jacobian Properties
				double U = 0.0;
				for (i=0; i<6; i++){U = U + CartesianIncrement[i]*CartesianIncrement[i];}
				for (i=0; i<6; i++)
				{	
					JacobianGain[i] = CartesianIncrement[i]/U;
					ErrorRange[i] = CartesianIncrement[i+6]/U;
				}
		}
		else if (*Flag == 3)
		{
			// Update Command 
			UpdateCommand( TargetMixCommand, TargetDispCommand, CurrentCartesian, Jacobian, JacobianGain, MaxIncrement, MaxErrorIndex);
			*Flag = 4;  // Go to the Iterative Ramp
			*Start = 1; // Start Ramp
		}
		else if (*Flag == 4)
		{
			if (*Trigger == 1) // Iterative Ramp Done!
			{
				*Start = 0; // Stop Ramp
				*Flag = 5;
				*Trigger = 0;
			}			
		}
		else if (*Flag == 5)  // Decision Making Step, Converged or Go back to Iterative Ramp?
		{
				*Start = 0; // Temporary Stop Ramp
				
				// Calculate Cartesian Increment and Update LastCartesian
				double CartesianIncrement[12];
				for ( i=0; i<12; i++) 
				{
					CartesianIncrement[i] = CurrentCartesian[i] - LastCartesian[i];
					LastCartesian[i] = CurrentCartesian[i];
				}

				// Put Update Jacobian
				UpdateJacobian( CartesianIncrement, Jacobian );

				// Check Force Convergence
				ConvergenceCheck( ControlMode, TargetMixCommand, CurrentCartesian, ErrorRange, ErrorIndex, MaxErrorIndex);

				if (ErrorIndex == 0)
				{			
					for (i=0; i<6; i++){MaxIncrement[i] = TargetMixCommand[i];}
					*Flag = 6;
				} // Converged!
				else { *Flag = 3;}               // Not Converged.
		}
		else if (*Flag == 6) // Converged, go to the next step!
		{
			*Trigger = 1;
			*Start = 0;
			*Flag = 0;
		}
	}

	return;
}

// Subroutines
void ConvergenceCheck( long ControlMode[], double TargetCommand[], double CurrentCartesian[], double ErrorRange[], long &ErrorIndex, long *MaxErrorIndex)
{
	double ErrorRatio, MaxErrorRatio = 0.0;
	ErrorIndex = 6;

	for (long i=0; i<6; i++)
	{
		if (ControlMode[i]==0){ErrorIndex--;}
		else if (ErrorRange[i] == 0.0) {ErrorIndex--;} // If ErrorRange = 0, accept it regardless of error.
		else
		{
			ErrorRatio = fabs(TargetCommand[i]-CurrentCartesian[i+6])/ErrorRange[i];
			if (ErrorRatio <=1 ) {ErrorIndex--;}
			if (ErrorRatio > MaxErrorRatio ){MaxErrorRatio=ErrorRatio; *MaxErrorIndex = i;}
		}
	}	
	return;
}

void UpdateJacobian( double CartesianIncrement[], double Jacobian[] )
{
	long NewCommand = 0, IterDirecIndex;
	double temp;

	for (long i=0; i<6; i++){if(CartesianIncrement[i]!=0){IterDirecIndex = i; NewCommand = 1;}}

	if(NewCommand)
	{
		// Update Diagonal Jacobian
		for (i=0; i<6; i++)
		{
			temp = (Jacobian[6*i+IterDirecIndex]  + CartesianIncrement[i+6]/CartesianIncrement[IterDirecIndex]);
			if (i!=IterDirecIndex || temp != 0.0){Jacobian[6*i+IterDirecIndex] = temp;}
		}
	}
	return;
}

void UpdateCommand( double TargetMixCommand[], double TargetDispCommand[], double CurrentCartesian[], double Jacobian[], double JacobianGain[], double MaxIncrement[], long *MaxErrorIndex)
{
	double CommandIncrement =0.0;
	CommandIncrement = JacobianGain[*MaxErrorIndex]/Jacobian[7*(*MaxErrorIndex)]*(TargetMixCommand[*MaxErrorIndex] - CurrentCartesian[*MaxErrorIndex+6]);
	if (fabs(CommandIncrement) > MaxIncrement[*MaxErrorIndex])
	{
		CommandIncrement = CommandIncrement/fabs(CommandIncrement)*MaxIncrement[*MaxErrorIndex];
	}
	TargetDispCommand[*MaxErrorIndex] = TargetDispCommand[*MaxErrorIndex] + CommandIncrement;

	return;
}


