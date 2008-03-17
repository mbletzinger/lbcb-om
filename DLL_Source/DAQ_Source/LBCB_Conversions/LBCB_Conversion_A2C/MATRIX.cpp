/* Copyright (C) 2007, University of Illinois.  All rights reserved.
   Developed by Narutoshi Nakata <nakata@uiuc.edu>
				Prof. B F Spencer Jr <bfs@uiuc.edu>
				Prof. Amr S Elnashai <aelnash@uiuc.edu> 
*/
// MATRIX.cpp: implementation of the MATRIX class.
//
//////////////////////////////////////////////////////////////////////

#include "MATRIX.h"
#include "VECTOR.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
//#include <assert.h>
#include <exception>

//#define NDEBUG

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

MATRIX::MATRIX( size_t n_rows, size_t n_cols )
:num_rows(n_rows), num_cols(n_cols), matrix_ptr(NULL)
{
	//assert( n_rows < 1 );
	//assert( n_cols < 1 );
	matrix_ptr = new double[num_rows*num_cols];
	Set_Value(0.0);
	//for ( int i=1; i<=num_rows*num_cols; i++)
	//{(*this)(i) = 0;}
}

MATRIX::~MATRIX()
{
	delete [] matrix_ptr;
}

MATRIX::MATRIX( const MATRIX& Matrix )
{
	num_rows = Matrix.num_rows;
	num_cols = Matrix.num_cols;
	matrix_ptr = new double[num_rows*num_cols];
	for ( int i=1; i<=num_rows*num_cols;i++ )
	{(*this)(i) = Matrix(i);}
}

//////////////////////////////////////////////////////////////////////
// Member Function with Access to the Member Variables
//////////////////////////////////////////////////////////////////////
void MATRIX::Set_Size( size_t n_rows )
{
	//assert( n_rows < 1 );
	num_rows = n_rows;
	num_cols = 1;
	delete [] matrix_ptr;
	matrix_ptr = new double[num_rows*num_cols];
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{(*this)(i) = 0;}
	return;
}

void MATRIX::Set_Size( size_t n_rows, size_t n_cols )
{
	//assert( n_rows < 1 );
	//assert( n_cols < 1 );
	num_rows = n_rows;
	num_cols = n_cols;
	delete [] matrix_ptr;
	matrix_ptr = new double[num_rows*num_cols];
	Set_Value(0.0);
	return;
}

void MATRIX::Set_Value( double value )
{
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{(*this)(i) = value;}
	return;
}

void MATRIX::Set_Value( int row, double value )
{
	//assert( row < 1 );
	//assert( row > num_rows );
	for ( int i=1; i<=num_cols; i++ )
	{(*this)(row,i) = value;}
	return;
}

void MATRIX::Set_Value( int row, int col, double value )
{
	//assert( row < 1 );
	//assert( row > num_rows );
	//assert( col < 1 );
	//assert( col > num_cols );
	(*this)(row,col) = value;
}

//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////
int MATRIX::SizeRow() const
{
	return( num_rows );
}

int MATRIX::SizeColumn() const
{
	return( num_cols );
}

double MATRIX::Value( int row ) const
{
	//assert( row < 1 );
	//assert( row > num_rows*num_cols );
	return( (*this)(row) );
}

double MATRIX::Value( int row, int col ) const
{
	//assert( row < 1 );
	//assert( row > num_rows );
	//assert( col < 1 );
	//assert( col > num_cols );
	return( (*this)(row, col) );
}

//////////////////////////////////////////////////////////////////////
// Operator Overloaded
//////////////////////////////////////////////////////////////////////
double& MATRIX::operator ()( int num_elem ) const
{
	//assert( row < 1 );
	//assert( row > num_rows*num_cols );
	return( matrix_ptr[(num_elem-1)] );
}

double& MATRIX::operator ()( int row, int col ) const
{
	//assert( row < 1 );
	//assert( row > num_rows );
	//assert( col < 1 );
	//assert( col > num_cols );
	return( matrix_ptr[(row-1)*num_cols+(col-1)] );
}

MATRIX& MATRIX::operator = ( const MATRIX& Matrix ) 
{
	if(matrix_ptr==Matrix.matrix_ptr){return(*this);}
	num_rows = Matrix.num_rows;
	num_cols = Matrix.num_cols;
	delete [] matrix_ptr;
	matrix_ptr = new double[num_rows*num_cols];
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{(*this)(i) = Matrix(i);}
	return( *this );
}

MATRIX MATRIX::operator + ( const MATRIX& Matrix ) const
{
	//assert( num_rows != Matrix.num_rows );
	//assert( num_cols != Matrix.num_cols );
	MATRIX temp(num_rows, num_cols);
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{temp(i) = (*this)(i) + Matrix(i);}
	return( temp );
}

MATRIX MATRIX::operator - ( const MATRIX& Matrix ) const
{
	//assert( num_rows != Matrix.num_rows );
	//assert( num_cols != Matrix.num_cols );
	MATRIX temp(num_rows, num_cols);
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{temp(i) = (*this)(i)-Matrix(i);}
	return( temp );
}

MATRIX MATRIX::operator * ( const MATRIX& Matrix ) const
{
	//assert( num_cols != Matrix.num_rows );
	MATRIX temp( num_rows, Matrix.num_cols );
	double sum;
	for ( int i=1; i<=num_rows; i++ )
	{
		for ( int j=1; j<=Matrix.num_cols; j++ )
		{
			sum = 0.0;
			for ( int k=1; k<=num_cols; k++ )
			{sum += (*this)(i,k)*Matrix(k,j);}
			temp(i,j) = sum;
		}
	}
	return( temp );
}

VECTOR MATRIX::operator * ( const VECTOR& Vector ) const
{
	//assert( num_cols != Vector.Size() );
	VECTOR temp( num_rows );
	double sum;
	for ( int i=1; i<=num_rows; i++)
	{
		sum = 0.0;
		for ( int j=1; j<=num_cols; j++ )
		{sum += (*this)(i,j) * Vector(j);}
		temp(i) = sum;
	}
	return( temp );
}

MATRIX MATRIX::operator * ( const double value ) const
{
	MATRIX temp(num_rows, num_cols);
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{temp(i) = (*this)(i) * value;}
	return( temp );
}

MATRIX MATRIX::operator / ( const double value ) const
{
	//assert( value == 0.0 );
	MATRIX temp(num_rows, num_cols);
	for ( int i=1; i<=num_rows*num_cols; i++ )
	{temp(i) = (*this)(i) / value;}
	return( temp );
}

//////////////////////////////////////////////////////////////////////
// Matrix Function
//////////////////////////////////////////////////////////////////////
void MATRIX::Diagonal( const double value )
{
	//assert( num_rows != num_cols );
	Set_Value( 0.0 );
	for ( int i=1; i<=num_rows; i++ )
	{(*this)(i,i) = value;}
	return;
}

void MATRIX::Identity()
{
	Diagonal( 1.0 );
	return;
}

void MATRIX::LUDecompose( VECTOR& index, int det_sign )
{
	int i, j, k, m, imax;
	double big, dum, sum, temp;
	VECTOR temp_vector( num_rows );
	index.Set_Size( num_rows );
	det_sign = 1;

	for (i=1; i<=num_rows; i++)
	{
		index(i) = i;
		big = 0.0;
		for (j=1; j<=num_rows; j++)
		{
			if (temp=fabs((*this)(i,j)) > big){big = temp;}
		}
		if (big==0.0){return;} // Singular Matrix
		temp_vector(i) = 1.0/big;
	}

	for (j=1; j<=num_rows; j++)
	{
		for (i=1; i<j; i++)
		{
			sum=(*this)(i,j);
			for (k=1; k<i; k++){sum -= (*this)(i,k) * (*this)(k,j);}
			(*this)(i,j) = sum;
		}
		big = 0.0;
		for (i=j; i<=num_rows; i++)
		{
			sum = (*this)(i,j);
			for (k=1; k<j; k++){sum -= (*this)(i,k) * (*this)(k,j);}
			(*this)(i,j) = sum;
			if ( (dum=temp_vector(i)*fabs(sum)) > big )
			{
				big = dum;
				imax = i;
			}
		}
		if (j != imax) 
		{
			for (k=1; k<=num_rows; k++)
			{
				dum = (*this)(imax,k);
				(*this)(imax,k) = (*this)(j,k);
				(*this)(j,k) = dum;
			}
			det_sign *= -1;
			temp_vector(imax) = temp_vector(j);
			m = index(j);
			index(j) = index(imax);
			index(imax) = m;
		}

		if ((*this)(j,j) ==0.0){return;}

		if (j != num_rows )
		{
			dum = 1.0/(*this)(j,j);
			for (i=j+1; i<=num_rows; i++){(*this)(i,j) *= dum;}
		}
	}
	return;
}

void MATRIX::LUDecompose( MATRIX& L, MATRIX& U, MATRIX& P ) const
{
	//assert( num_rows != num_cols );
	int i, j, det_sign=1;
	VECTOR index( num_rows );
	MATRIX A;
	A = (*this);

	L.Set_Size( num_rows, num_cols );
	U.Set_Size( num_rows, num_cols );
	P.Set_Size( num_rows, num_cols );
	L.Identity();

	A.LUDecompose( index, det_sign );
	
	for (j=1; j<=num_rows; j++)
	{
		for (i=1; i<=j; i++){U(i,j) = A(i,j);}
		for (i=j+1; i<=num_rows; i++){L(i,j) = A(i,j);}
		P(j,index(j)) = 1.0;
	}
	return;
}
		
void MATRIX::LinearSolver( const VECTOR& b, VECTOR& x ) const
{
	//assert( num_rows != b.Size() );
	int i, j, ii=0, d_sign=1;
	double sum;
	VECTOR index( num_rows );
	MATRIX A( num_rows, num_cols );

	x.Set_Size( num_rows );
	A = (*this);
	A.LUDecompose( index, d_sign );

	// Forward Substitution
	for (i=1; i<=num_rows; i++)
	{
		x(i) = b(index(i));
		sum = x(i);
		if (ii) 
		{
			for (j=ii; j<=i-1; j++){sum -= A(i,j)*x(j);}
		}
		else if (sum) {ii=i;}
		x(i) = sum;
	}

	// Backward Substitution
	for (i=num_rows; i>=1; i--)
	{
		sum = x(i);
		for (j=i+1; j<=num_rows; j++){sum -= A(i,j)*x(j);}
		x(i) = sum/A(i,i);
	}
	return;
}

void MATRIX::Inverse( MATRIX& rhs ) const
{
	int i, j;
	VECTOR unit_vec( num_rows ), temp_vec( num_rows );

	for (j=1; j<=num_rows; j++)
	{
		unit_vec.Set_Value( 0.0 );
		unit_vec(j) = 1.0;
		(*this).LinearSolver( unit_vec, temp_vec );
		for (i=1; i<=num_rows; i++){rhs(i,j) = temp_vec(i);}
	}
	return;
}

void MATRIX::Transpose( MATRIX& Matrix ) const
{
	Matrix.Set_Size(num_rows, num_cols);
	for ( int i=1; i<=num_rows; i++ )
	{
		for ( int j=1; j<=num_cols; j++ )
		{Matrix(j,i) = (*this)(i,j);}
	}
	return;
}

/*
void MATRIX::Roll( const double angle )
{
	Set_Size( 3, 3 );
	Identity();
	(*this)(2,2) =  cos( angle );
	(*this)(2,3) = -sin( angle );
	(*this)(3,2) =  sin( angle );
	(*this)(3,3) =  cos( angle );
	return;
}

void MATRIX::Pitch( const double angle )
{
	Set_Size( 3, 3 );
	Identity();
	(*this)(1,1) =  cos( angle );
	(*this)(1,3) =  sin( angle );
	(*this)(3,1) = -sin( angle );
	(*this)(3,3) =  cos( angle );
	return;
}

void MATRIX::Yaw( const double angle )
{
	Set_Size( 3, 3 );
	Identity();
	(*this)(1,1) =  cos( angle );
	(*this)(1,2) = -sin( angle );
	(*this)(2,1) =  sin( angle );
	(*this)(2,2) =  cos( angle );
	return;
}
*/