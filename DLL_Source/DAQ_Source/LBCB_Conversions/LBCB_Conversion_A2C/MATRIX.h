// MATRIX.h: interface for the MATRIX class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MATRIX_H__BB56D4B1_555E_46B6_A585_7C31890E0139__INCLUDED_)
#define AFX_MATRIX_H__BB56D4B1_555E_46B6_A585_7C31890E0139__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "VECTOR.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
#include <vector>

#include "ErrorLogger.h"

using namespace std;

class MATRIX  
{
public:
	// Constructor and Destructor
	MATRIX( int n_rows=1, int n_cols=1 );
	~MATRIX();
	MATRIX( const MATRIX& Matrix ); // Copy Constructor

	// Member Function with Access to the Member Variables
	void Set_Size( int n_rows );
	void Set_Size( int n_rows, int n_cols );
	void Set_Value( double value );
	void Set_Value( int row, double value );
	void Set_Value( int row, int col, double value );

	// Member Function to show the Member Variables
	int SizeRow() const;
	int SizeColumn() const;
	double Value( int row ) const;
	double Value( int row, int col ) const;
	
	// Operator Overloaded
	double& operator() ( int num_elem ) const;
	double& operator() ( int row, int col ) const;
	MATRIX& operator= ( const MATRIX& Matrix );
	MATRIX  operator+ ( const MATRIX& Matrix ) const;
	MATRIX  operator- ( const MATRIX& Matrix ) const;
	MATRIX  operator* ( const MATRIX& Matrix ) const;
	VECTOR  operator* ( const VECTOR& Vector ) const;
	MATRIX  operator* ( const double value )   const;
	MATRIX  operator/ ( const double value )   const;

	// Matrix Function
	void Diagonal( const double value );
	void Identity();
	void LUDecompose( vector<int>& index, int d_sign );
	void LUDecompose( MATRIX& L, MATRIX& U, MATRIX& P ) const;
	void LinearSolver( const VECTOR& b, VECTOR& x ) const;
	void Inverse( MATRIX& Matrix ) const;
	void Transpose( MATRIX& Matrix ) const;
	//void Roll( const double angle );
	//void Pitch( const double angle );
	//void Yaw( const double angle );
	static void SetErrorLogger(ErrorLogger *log);

private:
	int num_rows, num_cols;
	double *matrix_ptr;
	static ErrorLogger *log;
};

#endif // !defined(AFX_MATRIX_H__BB56D4B1_555E_46B6_A585_7C31890E0139__INCLUDED_)
