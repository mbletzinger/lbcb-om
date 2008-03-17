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
_declspec(dllexport) void AutoBalanceController2(double ServoError[], double BalanceGain[], double SafeRange[], double Command[], double BestCommand[], double MinError[], long *AutoBalance, long *index, long length);
}

_declspec(dllexport) void AutoBalanceController2(double ServoError[], double BalanceGain[], double SafeRange[], double Command[], double BestCommand[], double MinError[], long *AutoBalance, long *index, long length)
	{

	if (*index <=10 && *index > 0)
	{
		*AutoBalance = 1;
		for (int i=0; i<length; i++)
		{
			if (fabs(ServoError[i]) < fabs(MinError[i]))
			{
				BestCommand[i] = Command[i];
				MinError[i] = ServoError[i];
			}
			else if (fabs(ServoError[i]) > SafeRange[i]){*index = 100;*AutoBalance = 0;}

			Command[i] = Command[i] - BalanceGain[i] * ServoError[i];
		}
		if (*AutoBalance==1){*index = *index - 1;}
		*AutoBalance = 0;
	}
	else if (*index == 0)
	{
		*AutoBalance = 1;
		for (int i=0; i<length; i++)
		{
			if (fabs(ServoError[i]) > fabs(SafeRange[i])){*index = 100;*AutoBalance = 0;}
			Command[i] = BestCommand[i];
			MinError[i] = 100;
		}
	}
	else
	{
		*AutoBalance = 1;
		for (int i=0; i<length; i++)
		{
			Command[i] = Command[i] - BalanceGain[i] * ServoError[i];
			if (fabs(ServoError[i]) > fabs(SafeRange[i])){*AutoBalance = 0;}
		}
		if (*AutoBalance==1){*index = 10;}
		*AutoBalance = 0;
	}

	return;

	}