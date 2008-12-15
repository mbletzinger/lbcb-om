extern "C" {

_declspec(dllexport) 
void LBCB_Conversion_A2C_Displacement(long type, double lvdt[], double cartesian_displacement[], long* error);

_declspec(dllexport) 
void LBCB_Conversion_A2C_Forces(long type, double loadcell[], double cartesian_displacement[], 
													 double cartesian_forces[], long* error);
_declspec(dllexport) 
void LBCB_Conversion_C2A_Displacement(long type, double lvdt[], double cartesian_displacement[], long* error);

_declspec(dllexport) 
void LBCB_Conversion_C2A_Forces(long type, double loadcell[], double cartesian_forces[], long* error);

_declspec(dllexport) 
void LBCB_Conversion_RigidTransform(double motion_center[], double cartesian_displacement[], 
									double cartesian_forces[], long* error);

_declspec(dllexport)
void LBCB_Conversion_SetErrorLogFile(char* filename, long length);

_declspec(dllexport)
void LBCB_Conversion_Init(long size);
}
