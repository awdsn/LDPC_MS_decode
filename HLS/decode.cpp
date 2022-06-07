
#include <iostream>
#include <fstream>
#include<iomanip>
#include<ap_fixed.h>
#include"decode.h"
using	namespace std;



static	data_zj q[M] ;//声明第j行更新后的变量节点q[j][M];
//static	data_zj r_copy[M] ;//声明第j行更新后的校验节点节点r[j][M];
static	data_zj r[N][M] ;//N行M列；声明多次迭代的rji;
static	ap_fixed <10,8,AP_TRN,AP_SAT> qi[M];//计算变量节点后验概率，用于判决
 bool H[N][M] = {
		 								#include"H.h"
		 					};
//bool c[M];//译码后变量

//需要用到的部分函数
bool BPSK(data_zj x) {		//实现BPSK解调，y=(1-x)/2
	if (x > 0)
		return 0;
	else
		return 1;
}
ap_int<2> sign(data_zj x) {		//实现sign函数
	if (x > 0)
		return 1;
	else
		return -1;
}
data_zj min(data_zj a, data_zj b) {
	if (a >= b)
		return b;
	else
		return a;
}
data_zj fabs(data_zj a) {
	if (a > 0)
		return a;
	else
		return -a;
}

ap_uint<1> note_update(int j ,bool H[N][M], data_zj q[M],data_zj r[N][M],ap_fixed<10,8, AP_TRN, AP_SAT> qi[M],bool c[M])//校验节点更新;计算出rji的值
{
	int i,  b;
	int i1_temp = 0;
	ap_uint<1> temp_jy = 0;//校验方程和值
	ap_int<2> sign1_ji=1;
	ap_int<2> sign1[M] ;	///变量节点矩阵中数值的符号
	 data_zj min1 = fabs(q[0]);//将最小值缓存
	 data_zj min2 = fabs(q[0]);//将次小值缓存
	//ap_fixed<5,4> a=0.7;

	LOOP_min_temp:
	 for (i = 0; i < M; i++) {
#pragma HLS UNROLL factor=2
#pragma HLS pipeline

		 if (H[j][i]) {
			 sign1_ji = sign1_ji * sign(q[i]);//计算符号
			 if (min2 >= fabs(q[i])) {
				 min2 = fabs(q[i]);

				 if (min2 <= min1) {
					 data_zj temp = min2;
					 min2 = min1;
					 min1 = temp;
					 i1_temp = i;
				 }
			 }
		 }
	 }

	LOOP_check_note_update:
			for (i = 0; i < M; i++) {
//#pragma HLS dependence variable=r intra false
//#pragma HLS UNROLL factor=2
#pragma HLS pipeline

				if (H[j][i]) {
					 if (sign(q[i]) == sign1_ji)
						sign1[i] = 1;
					 else
						sign1[i] = -1;

					if (i != i1_temp)//i_temp=R(j)\i;    变量节点集合
						r[j][i] = sign1[i] * (min1);
					else
						r[j][i] = sign1[i] * (min2);
				}
				q[i]=qi[i]-r[j+1][i];
				temp_jy = temp_jy + c[i] * H[j][i];
				if(i==M-1){
					return temp_jy;
					temp_jy=0;
				}
			}


}


void variable_note_pos(data_zj P[M],bool H[N][M],data_zj r[N][M],ap_fixed <10,8,AP_TRN,AP_SAT> qi[M],bool c[M]) {
//变量节点后验概率
	int i,j;

	ap_fixed <10,8,AP_TRN,AP_SAT> temp2 = 0;

	LOOP_qi_1:
	for (i = 0; i < M; i++) {
		LOOP_qi_2:
		for (j = 0; j < N; j++){
#pragma HLS UNROLL factor=2
#pragma HLS pipeline rewind

			if (H[j][i]) { //j=C(i);
				temp2 = temp2 + r[j][i];
			}
			if(j==N-1){
				qi[i] = P[i] + temp2;
				if (qi[i] > 0)
					c[i] = 0;
				else
					c[i] = 1;//////

				temp2 = 0;
			}
		}
	}
}
/*
ap_int<1> check_formula(int diedai,bool c[M],bool H[N][M]) {
//根据校验矩阵计算是否译码完成
	int i, j;
	ap_uint<11> s[N];//矩阵相乘后的结果
	ap_int<1> temp = 0;
	ap_int<11> s_sum = 0;//s_sum负责记录满足条件，即s[i]=0的个数
	LOOP_formula1:
	for (j = 0; j < N; j++) {//////////////////////N个校验方程
		LOOP_formula2:
		for (i = 0; i < M; i++) {
#pragma HLS UNROLL factor=2
#pragma HLS pipeline rewind
			temp = temp + c[i] * H[j][i];
			if(i==M-1){
				if (temp == 0)  s_sum = s_sum + 1;
				temp = 0;
			}
		}


	}
	//cout<<diedai<<"满足校验矩阵的数目为："<<s_sum<<endl;
	/// ////////////////////////////////验证
	if (s_sum == N)
		return 1;//满足校验矩阵，结束迭代
	else
		return 0;

	s_sum = 0;

}
*/


void decode(bool c[M]) {
//#pragma HLS interface ap_fifo depth=256 port=d_out
	ap_uint<4> diedai_max=5;
	ap_uint<4> diedai;//迭代次数,即第几次迭代
	//ap_uint<1> result=1;
	int result =1;


	data_zj P[M] = {
	 			#include"y.h"
	 	};

	///*************************************译码******************************************
	////////////初始化

///
	int i,j;
		int temp=0;
		LOOP_initialize:
		for (i = 0; i < M; i++) {
#pragma HLS pipeline
			c[i]=BPSK(P[i]);
		}

	LOOP_diedai:
	for(diedai=0;diedai<diedai_max;diedai=diedai+1){
//#pragma HLS pipeline

		if (!result) {
			break;
		}
		else
		{
			variable_note_pos(P, H, r, qi,c);
				LOOP_N_hang:
					for(int j=0;j<N;j++){
						temp=temp+note_update(j,H,q,r,qi,c);
						if(j==N-1){
							result=temp;

							temp=0;
						}
				}


		}
	}

}

