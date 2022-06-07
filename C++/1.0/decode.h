#include <iostream>
#define N 1008
#define M 2016

//const float p_noise = 0.1f;// 0.050661f;

//i为变量节点，对应列数；j为校验节点，对应行数
static double P[M];//声明Pi;
static double q[N][M];//N行M列；声明多次迭代的qji;
static double r[N][M];//N行M列；声明多次迭代的rji;
static double qi[M];//计算变量节点后验概率，用于判决
////////////////////后面需将以上数组改为二维数组
static double  H[N][M];//声明校验矩阵
  
static int s[N];//矩阵相乘后的结果 

void initialize();
void check_matrix_read();//将校验矩阵读入数组

int sign(double );
double max(double , double );
double min(double , double );
double fabs(double);
void check_note_update(int );
void variable_note_update(int );
void variable_note_panjue(int );
int check_formula(int );

int decode(int diedai_max);
