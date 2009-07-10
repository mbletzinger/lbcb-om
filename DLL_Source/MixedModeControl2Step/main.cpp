/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
/* Call Library Source File */

#include "extcode.h"
#include "windows.h"
#include <cmath>

extern "C" {
_declspec(dllexport) void MixedModeControl2Step(double *MixedCommand, long *ControlMode, long *Flag, double *CommandIncrement, double *PreviousForce, double *CurrentForce, double *ErrorRange, double *MaxIncrement, double *JacobianGain, double *Jacobian);
}

_declspec(dllexport) void MixedModeControl2Step(double *MixedCommand, long *ControlMode, long *Flag, double *CommandIncrement, double *PreviousForce, double *CurrentForce, double *ErrorRange, double *MaxIncrement, double *JacobianGain, double *Jacobian)
{

	int i,ErrorCheckIndex=6;
	int MaxErrorRatioIndex, IterDirecIndex;
	double ErrorRatio, MaxErrorRatio=0.0;

	// Check Force Error and Max Force Error Ratio Index
	for (i=0;i<6;i++)
	{
		if(ControlMode[i]==0){ErrorCheckIndex--;}
		else
		{
			ErrorRatio = fabs(MixedCommand[i]-CurrentForce[i])/ErrorRange[i];
			if (ErrorRatio <= 1) {ErrorCheckIndex--;}
			if (ErrorRatio > MaxErrorRatio){MaxErrorRatio=ErrorRatio; MaxErrorRatioIndex = i;}
		}
	}

	if (*Flag==1) // Initial Ramp
	{
		double TempCommand[6];		
		for(i=0;i<6;i++){TempCommand[i]=CommandIncrement[i];CommandIncrement[i] = 0;}
		
		if(ErrorCheckIndex==0) // Converged, DONE!
		{
			*Flag = 0;
		}
		else // Go to Iterative Ramp.
		{
			CommandIncrement[MaxErrorRatioIndex] = JacobianGain[MaxErrorRatioIndex]/Jacobian[7*MaxErrorRatioIndex]*(MixedCommand[MaxErrorRatioIndex]-CurrentForce[MaxErrorRatioIndex]);
			if (fabs(CommandIncrement[MaxErrorRatioIndex])>MaxIncrement[MaxErrorRatioIndex])
			{
				CommandIncrement[MaxErrorRatioIndex]=CommandIncrement[MaxErrorRatioIndex]/fabs(CommandIncrement[MaxErrorRatioIndex])*MaxIncrement[MaxErrorRatioIndex];
			}
			*Flag = 2;
		}

		// Update Directional Jacobian and Displacement Directional
		double U=0;
		for (i=0;i<6;i++){U = U + TempCommand[i]*TempCommand[i];}
		for (i=0;i<6;i++){CurrentForce[i] = (CurrentForce[i]-PreviousForce[i])/sqrt(U);}
		for (i=0;i<6;i++){PreviousForce[i]= TempCommand[i]/sqrt(U);}
		
	}

	else if (*Flag==2)
	{
		int NewCommandIndex=false;
		// Find the Direction in the Last Iterative Ramp
		for(i=0;i<6;i++){if(CommandIncrement[i]!=0){IterDirecIndex = i; NewCommandIndex=true;}}

		if(NewCommandIndex)
		{
			// Update Diagonal Jacobian
			for(i=0;i<6;i++){Jacobian[6*i+IterDirecIndex] = (CurrentForce[i]-PreviousForce[i])/CommandIncrement[IterDirecIndex];}
		}

		for(i=0;i<6;i++){CommandIncrement[i] = 0;}
		if(ErrorCheckIndex==0) // Converged, DONE!
		{
			*Flag = 0;
		}
		else
		{
			// Update Command
			CommandIncrement[MaxErrorRatioIndex] = JacobianGain[MaxErrorRatioIndex]/Jacobian[7*MaxErrorRatioIndex]*(MixedCommand[MaxErrorRatioIndex]-CurrentForce[MaxErrorRatioIndex]);
			if (fabs(CommandIncrement[MaxErrorRatioIndex])>MaxIncrement[MaxErrorRatioIndex])
			{
				CommandIncrement[MaxErrorRatioIndex]=CommandIncrement[MaxErrorRatioIndex]/fabs(CommandIncrement[MaxErrorRatioIndex])*MaxIncrement[MaxErrorRatioIndex];
			}
		}
	}
	
	return;
}
