// VECTOR.h: interface for the VECTOR class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_VECTOR_H__A5EBC5C3_5F3C_4683_B472_ABD5DDC71BE3__INCLUDED_)
#define AFX_VECTOR_H__A5EBC5C3_5F3C_4683_B472_ABD5DDC71BE3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <iostream>
#include <string>
#include "ThreadLocalObjects.h"

class VECTOR  
{
public:
	// Constrcutor and Destructor
	VECTOR( int n_rows, ThreadLocalObjects* tlo);
	VECTOR();
	~VECTOR();
	VECTOR( const VECTOR& Vector );  // Copy Constructor

	// Member Function with Access to the Member Variables
	void Set_Size( int n_rows );
	void Set_Value( double value );
	void Set_Value( int row, double value );

	// Member Function to show the Member Variables
	int Size( ) const;
	double Value( int row ) const;
	double Norm( ) const;
	VECTOR NormalizedVector( ) const;

	// Operator Overloaded
	double& operator() ( int row ) const;
	VECTOR& operator= ( const VECTOR& Vector );
	VECTOR  operator+ ( const VECTOR& Vector ) const;
	VECTOR  operator- ( const VECTOR& Vector ) const;
	VECTOR  operator* ( const double value )   const;
	VECTOR  operator/ ( const double value )   const;
	bool    operator> ( const VECTOR& Vector ) const;
	bool    operator< ( const VECTOR& Vector ) const;

	// Vector Function
	double DotProduct( const VECTOR& Vector )   const;
	VECTOR CrossProduct( const VECTOR& Vector ) const;
	void SetThreadLocalObjects(ThreadLocalObjects* mytlo);

private:
	int num_rows;
	double *vector_ptr;
	ThreadLocalObjects* tlo;
	bool PartiallyConstructed;
#ifdef FINE_MEM_COUNT
	static int CtorCount;
	static int NewCount;
#endif

};

#endif // !defined(AFX_VECTOR_H__A5EBC5C3_5F3C_4683_B472_ABD5DDC71BE3__INCLUDED_)
