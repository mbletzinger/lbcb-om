void LBCB_Conversion_A2C(long type, double motion_center[], long length, double sensor_reading[], double cartesian_value[], long* error);

void LBCB_conversion_C2A(long type, double motion_center[], double sensor_reading[], double cartesian_value[], long* error);

void LBCB_Conversion_SetErrorLogFile(char* filename, long length);

void LBCB_Conversion_Init(long size);

