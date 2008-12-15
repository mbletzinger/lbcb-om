#ifdef _cplusplus
extern "C" {
#endif

#ifdef _MSC_VER
_declspec(dllexport) 
#endif
void LBCB_Conversion_A2C_Displacement(long type, double lvdt[], double cartesian_displacement[], long* error);

#ifdef _MSC_VER
_declspec(dllexport) 
#endif
void LBCB_Conversion_A2C_Forces(long type, double loadcell[], double cartesian_displacement[], 
													 double cartesian_forces[], long* error);
#ifdef _MSC_VER
_declspec(dllexport) 
#endif 
void LBCB_Conversion_C2A_Displacement(long type, double lvdt[], double cartesian_displacement[], long* error);

#ifdef _MSC_VER
_declspec(dllexport) 
#endif 
void LBCB_Conversion_C2A_Forces(long type, double loadcell[], double cartesian_forces[], long* error);

#ifdef _MSC_VER
_declspec(dllexport) 
#endif 
void LBCB_Conversion_RigidTransform(double motion_center[], double cartesian_displacement[], 
									double cartesian_forces[], long* error);

#ifdef _MSC_VER
_declspec(dllexport)
#endif
void LBCB_Conversion_SetErrorLogFile(char* filename, long length);
#ifdef _MSC_VER
_declspec(dllexport)
#endif
void LBCB_Conversion_Init(long size);
#ifdef _cplusplus
}
#endif
