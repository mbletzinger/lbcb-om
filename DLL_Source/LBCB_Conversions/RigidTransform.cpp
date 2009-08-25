#include "RigidTransform.h"
#include "VECTOR.h"
#include "MATRIX.h"
#include "RotationalMatrix.h"
#include <cmath>

void RigidTransform( const VECTOR &ref_point, const VECTOR &ref_value, const VECTOR &target_point, VECTOR &target_value,ThreadLocalObjects* tlo )
{
	// assert( ref_point.Size() != 3 );
	// assert( ref_value.Size() != 6 || ref_value.Size() != 12 );
	// assert( ref_value.Size() != 3 );

	int n_rows = ref_value.Size();
	target_value.Set_Size( n_rows );

	double roll_angle, pitch_angle, yaw_angle;
	VECTOR translation(3,tlo);
	VECTOR directional_vector(3,tlo);
	VECTOR temp(3,tlo), temp_vec(3,tlo), temp_moment(3,tlo);
	RotationalMatrix Roll( 0, 1,tlo );  // Roll
	RotationalMatrix Pitch( 0, 2,tlo ); // Pitch
	RotationalMatrix Yaw( 0, 3,tlo );   // Yaw

	directional_vector = target_point - ref_point;
	translation(1) = ref_value(1);
	translation(2) = ref_value(2);
	translation(3) = ref_value(3);
	roll_angle     = ref_value(4);
	pitch_angle    = ref_value(5);
	yaw_angle      = ref_value(6);

	Roll.InputAngle( roll_angle );
	Pitch.InputAngle( pitch_angle );
	Yaw.InputAngle( yaw_angle );

	// Translation from Cartesian Coordinate Input 
	temp = Roll() * Pitch() * Yaw() * directional_vector + translation + ref_point;

	target_value(1) = temp(1) - target_point(1);
	target_value(2) = temp(2) - target_point(2);
	target_value(3) = temp(3) - target_point(3);
	target_value(4) = ref_value(4);
	target_value(5) = ref_value(5);
	target_value(6) = ref_value(6);

	if (n_rows==12)
	{
		target_value(7) = ref_value(7);
		target_value(8) = ref_value(8);
		target_value(9) = ref_value(9);

		temp_moment(1) = ref_value(10);
		temp_moment(2) = ref_value(11);
		temp_moment(3) = ref_value(12);

		for (int i=1; i<=3; i++){
			temp.Set_Value( 0 );
			temp.Set_Value( i, 1 );
			temp_moment = temp_moment + (temp.CrossProduct( directional_vector ))*ref_value(6+i);
		}
		target_value(10) = temp_moment(1);
		target_value(11) = temp_moment(2);
		target_value(12) = temp_moment(3);
	}

	return;
}