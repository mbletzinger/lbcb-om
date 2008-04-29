extern "C" {
_declspec(dllexport) void LBCB_Conversion_A2C(double motion_center[], long length, double sensor_reading[], double cartesian_value[], long* error);

_declspec(dllexport) void LBCB_conversion_C2A(double motion_center[], double sensor_reading[], double cartesian_value[], long* error);

_declspec(dllexport) void LBCB_Conversion_SetErrorLogFile(char* filename, long length);
_declspec(dllexport) void LBCB_Conversion_Init(long size, long type);
}
