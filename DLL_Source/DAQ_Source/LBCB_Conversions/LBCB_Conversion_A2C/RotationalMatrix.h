// RotationalMatrix.h: interface for the RotationalMatrix class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ROTATIONALMATRIX_H__5D24F279_AF6B_48EE_8A8C_673B01380508__INCLUDED_)
#define AFX_ROTATIONALMATRIX_H__5D24F279_AF6B_48EE_8A8C_673B01380508__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "VECTOR.h"
#include "MATRIX.h"
#include <iostream>
#include <string>
#include "ErrorLogger.h"
#include "MemoryCounter.h"

//typedef basic_string <char> string;
using std::string;

class RotationalMatrix  
{
public:
	RotationalMatrix(const double theta=0.0, const int flg=1);
	virtual ~RotationalMatrix();

	void TypeChange(int flg);
	void TypeChange(const double theta, const int flg);
	void InputAngle(const double theta );

	MATRIX operator() (void);
	MATRIX operator() (const double theta );
	MATRIX operator() (const double theta, const int flg);
	static void SetErrorLogger(ErrorLogger *log);
	static void LogMemory();

private:
	double angle; // Angle in radian
	MATRIX RotMatrix;
	int type;     // [1:Roll, 2:Pitch, 3:Yaw]
	static ErrorLogger *log;
	static MemoryCounter* CtorCounter;
};

#endif // !defined(AFX_ROTATIONALMATRIX_H__5D24F279_AF6B_48EE_8A8C_673B01380508__INCLUDED_)
