extern "C" {

_declspec(dllexport) void LBCB_conversion_A2C(long size, long type, double motion_center[], long length, double sensor_reading[], double cartesian_value[]);
_declspec(dllexport) void SetErrorLogFile(char* filename, long length);
_declspec(dllexport) void Init();
}
