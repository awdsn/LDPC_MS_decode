#include <iostream>
#define N 1008
#define M 2016

//const float p_noise = 0.1f;// 0.050661f;

//iΪ�����ڵ㣬��Ӧ������jΪУ��ڵ㣬��Ӧ����
static double P[M];//����Pi;
static double q[N][M];//N��M�У�������ε�����qji;
static double r[N][M];//N��M�У�������ε�����rji;
static double qi[M];//��������ڵ������ʣ������о�
////////////////////�����轫���������Ϊ��ά����
static double  H[N][M];//����У�����
  
static int s[N];//������˺�Ľ�� 

void initialize();
void check_matrix_read();//��У������������

int sign(double );
double max(double , double );
double min(double , double );
double fabs(double);
void check_note_update(int );
void variable_note_update(int );
void variable_note_panjue(int );
int check_formula(int );

int decode(int diedai_max);
