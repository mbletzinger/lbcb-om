// VECTOR.cpp: implementation of the VECTOR class.
//
//////////////////////////////////////////////////////////////////////

#include "VECTOR.h"
#include <iostream>
#include <string>
#include <iomanip>
#include <cmath>
#include <fstream>
#include <new>
//#include <assert.h>
#include <exception>

//#define NDEBUG

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

VECTOR::VECTOR( size_t n_rows )
:num_rows( n_rows ), vector_ptr(NULL)
{
	//assert( n_rows < 1 );
	if(num_rows<1){num_rows=1;}
	vector_ptr = new double[num_rows];
	for (int i=1; i<=num_rows; i++)
	{(*this)(i) = 0;}
}

VECTOR::~VECTOR()
{
	delete [] vector_ptr;
}

VECTOR::VECTOR( const VECTOR& Vector )
{
	num_rows = Vector.num_rows;
	vector_ptr = new double[num_rows];
	for (int i=1; i<=num_rows; i++)
	{(*this)(i) = Vector(i);}
}

//////////////////////////////////////////////////////////////////////
// Member Function with Access to the Member Variables
//////////////////////////////////////////////////////////////////////
void VECTOR::Set_Size( size_t n_rows )
{
	//assert( n_rows < 1 );
	if(n_rows<1){n_rows=1;}
	num_rows = n_rows;
	delete [] vector_ptr;
	vector_ptr = new double[num_rows];
	for (int i=1; i<=num_rows; i++)
	{(*this)(i) = 0;}
	return;
}

void VECTOR::Set_Value( double value )
{
	for (int i=1; i<=num_rows; i++){(*this)(i) = value;}
	return;
}

void VECTOR::Set_Value( int row, double value )
{
	//assert( row < 1 );
	if(row<1){row=1;}
	//assert( row > num_rows );
	if(row>num_rows){row=num_rows;}
	(*this)(row) = value;
	return;
}

//////////////////////////////////////////////////////////////////////
// Member Function to show the Member Variables
//////////////////////////////////////////////////////////////////////
size_t VECTOR::Size() const
{
	return( num_rows );
}

double VECTOR::Value( int row ) const
{
	//assert( row < 1 );
	if(row<1){row=1;}
	//assert( row > num_rows );
	if(row>num_rows){row=num_rows;}
	return( (*this)(row) );
}

double VECTOR::Norm() const
{
	double norm = 0.0;
	for ( int i=1; i<=num_rows; i++)
	{norm += (*this)(i)*(*this)(i);}
	return( sqrt(norm) );
}

VECTOR VECTOR::NormalizedVector() const
{
	VECTOR temp(num_rows);
	if(Norm==0){return(temp);}

	for( int i=1; i<=num_rows; i++)
	{temp(i) = (*this)(i)/Norm();}
	return( temp );
}

//////////////////////////////////////////////////////////////////////
// Operator Overloaded
//////////////////////////////////////////////////////////////////////
double& VECTOR::operator ()( int row ) const
{
	//assert( row < 1 );
	if(row<1){row=1;}
	//assert( row > num_rows );
	if(row>num_rows){row=num_rows;}
	return( vector_ptr[row-1] );
}

VECTOR& VECTOR::operator = ( const VECTOR& Vector )
{
	if(vector_ptr==Vector.vector_ptr) {return(*this);}
	num_rows = Vector.num_rows;
	delete [] vector_ptr;
	vector_ptr = new double[num_rows];
	for( int i=1; i<=num_rows; i++)
	{(*this)(i)=Vector(i);}
	return( *this );
}

VECTOR VECTOR::operator + ( const VECTOR& Vector ) const
{
	//assert( num_rows != Vector.num_rows );
	VECTOR temp(num_rows);
	for ( int i=1; i<=num_rows; i++)
	{temp(i) = (*this)(i) + Vector(i);}
	return( temp );
}

VECTOR VECTOR::operator - ( const VECTOR& Vector ) const
{
	//assert( num_rows != Vector.num_rows );
	VECTOR temp(num_rows);
	for ( int i=1; i<=num_rows; i++)
	{temp(i) = (*this)(i) - Vector(i);}
	return( temp );
}

VECTOR VECTOR::operator * ( const double value ) const
{
	VECTOR temp(num_rows);
	for ( int i=1; i<=num_rows; i++)
	{temp(i) = value * (*this)(i);}
	return( temp );
}

VECTOR VECTOR::operator / ( const double value ) const
{
	//assert( value == 0.0 );
	VECTOR temp(num_rows);
	for ( int i=1; i<=num_rows; i++)
	{temp(i) = (*this)(i)/value;}
	return( temp );
}

//////////////////////////////////////////////////////////////////////
// Vector Function
//////////////////////////////////////////////////////////////////////
double VECTOR::DotProduct( const VECTOR &Vector ) const
{
	//assert( num_rows!=Vector.num_rows );
	double dotproduct=0.0;
	for ( int i=1; i<=num_rows; i++)
	{dotproduct += (*this)(i) * Vector(i);}
	return( dotproduct );
}

VECTOR VECTOR::CrossProduct( const VECTOR &Vector ) const
{
	//assert( num_rows!=Vector.num_rows );
	//assert( num_rows!=3 );
	VECTOR temp(3);
	temp.vector_ptr[0] = vector_ptr[1]*Vector.vector_ptr[2] - vector_ptr[2]*Vector.vector_ptr[1];
	temp.vector_ptr[1] = vector_ptr[2]*Vector.vector_ptr[0] - vector_ptr[0]*Vector.vector_ptr[2];
	temp.vector_ptr[2] = vector_ptr[0]*Vector.vector_ptr[1] - vector_ptr[1]*Vector.vector_ptr[0];
	return( temp );
}