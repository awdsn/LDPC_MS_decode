#include <iostream>
#include"ap_fixed.h"
#include"ap_int.h"
#define N 128
#define M 256
typedef ap_fixed <8,6,AP_TRN,AP_SAT> data_zj;

void decode(bool c[M] );
