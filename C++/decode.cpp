
#include <iostream>
#include <fstream>
#include<iomanip>
#include<ap_fixed.h>
#include"decode.h"
using	namespace std;



static	data_zj q[M] ;//声明第j行更新后的变量节点q[j][M];
static	data_zj r_copy[M] ;//声明第j行更新后的校验节点节点r[j][M];
static	data_zj r[N][M] ;//N行M列；声明多次迭代的rji;
static	ap_fixed <10,8,AP_TRN,AP_SAT> qi[M];//计算变量节点后验概率，用于判决
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

void check_note_update(int j ,bool H[N][M], data_zj q[M],data_zj r[N][M],data_zj r_copy[M])//校验节点更新;计算出rji的值
{
	int i,  b;
	int i1_temp = 0;
	ap_int<2> sign1_ji=1;
	ap_int<2> sign1[M] ;	///变量节点矩阵中数值的符号
	 data_zj min1_temp = fabs(q[0]);//将最小值缓存
	 data_zj min2_temp = fabs(q[0]);//将次小值缓存
	//ap_fixed<5,4> a=0.7;
	 for (i = 0; i < M; i++) {
		/* min1_temp = min(min1_temp, fabs(q[i]));
		 i1_temp = 0;*/
		 if (H[j][i]) {
			 if (min2_temp >= fabs(q[i])) {
				 min2_temp = fabs(q[i]);

				 if (min2_temp <= min1_temp) {
					 data_zj temp = min2_temp;
					 min2_temp = min1_temp;
					 min1_temp = temp;
					 i1_temp = i;
				 }
			 }
		 }
	 }

	 //cout << j << setw(5) <<"第"<< i1_temp<<"个数为最小值："<<min1_temp << setw(10) << min2_temp << setw(10) << endl;
	 for (i = 0; i < M; i++) {//计算符号
		 if (H[j][i]) {
	 		 		sign1_ji = sign1_ji * sign(q[i]);		 		
	 		 	}
	 }
	 for (i = 0; i < M; i++) {//计算符号
		 if (H[j][i]) {
			 if (sign(q[i]) == sign1_ji)
				 sign1[i] = 1;
			 else
				 sign1[i] = -1;
			 //cout << "sign" << i << sign1[i] << setw(10) << sign1_ji << endl;
		 }
		
	 }

		LOOP_check_note_update:
//#pragma HLS dependence variable=r inter false
			for (i = 0; i < M; i++) {
#pragma HLS pipeline rewind
				r_copy[i]=r[j+1][i];
				if (H[j][i]) {
					if (i != i1_temp)//i_temp=R(j)\i;    变量节点集合
						r[j][i] = sign1[i] * (min1_temp);
					else
						r[j][i] = sign1[i] * (min2_temp);

					cout << "r  " << j << setw(5) << i << setw(5) << r[j][i] << setw(10) << endl;
					///
				}
			}


}

void variable_note_pos(data_zj P[M],bool H[N][M],data_zj r[N][M],ap_fixed <10,8,AP_TRN,AP_SAT> qi[M]) {
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
				temp2 = 0;
			}
		}
	}
}
void panjue(bool c[M],ap_fixed <10,8,AP_TRN,AP_SAT> qi[M]){
	int i;
//****************************************判决*****************************************
	LOOP_panjue:
		for (i = 0; i < M; i++) {
#pragma HLS pipeline rewind
			if (qi[i] > 0)
				c[i] = 0;
			else
				c[i] = 1;//////////////////////////////////////
		}
}
void variable_note_update(int j,bool H[N][M],data_zj r_copy[M],data_zj q[M], ap_fixed<10,8, AP_TRN, AP_SAT> qi[M]) {

	int i,b;
	////j表示计算第几行
	//*****************************************变量节点更新*****************************************
	LOOP_v_update_1:
		for (i = 0; i < M; i++) {
#pragma HLS UNROLL factor=2
#pragma HLS pipeline rewind
				q[i]=qi[i]-r_copy[i];
			//	cout << "q" <<j<<setw(5)<< i << setw(5) << q[i] << setw(10) << endl;
		}
}

ap_int<1> check_formula(int diedai,bool c[M],bool H[N][M]) {
//根据校验矩阵计算是否译码完成
	int i, j;
	ap_uint<11> s[N];//矩阵相乘后的结果
	ap_int<11> temp = 0;
	ap_int<11> s_sum = 0;//s_sum负责记录满足条件，即s[i]=0的个数
	LOOP_formula1:
	for (j = 0; j < N; j++) {//////////////////////N个校验方程
		LOOP_formula2:
		for (i = 0; i < M; i++) {
#pragma HLS pipeline rewind
			temp = temp + c[i] * H[j][i];
			if(i==M-1){
				if (temp%2 == 0)  s_sum = s_sum + 1;
				temp = 0;
			}
		}


	}
	cout<<diedai<<"满足校验矩阵的数目为："<<s_sum<<endl;
	/// ////////////////////////////////验证
	
	if (s_sum == N)
		return 1;//满足校验矩阵，结束迭代
	else
		return 0;

	s_sum = 0;

}
void update(bool H[N][M],data_zj r[N][M],ap_fixed<10, 8, AP_TRN, AP_SAT> qi[M]){
LOOP_N_hang:
	for(int j=0;j<N;j++){
//#pragma HLS pipeline
		if(j==0)
			LOOP_r_copy:
			for (int i = 0; i < M; i++)
#pragma HLS pipeline II=1//////s4_dingcengyouhua中使用
				r_copy[i] = r[0][i];
		variable_note_update(j,H,r_copy,q,qi);
		check_note_update(j,H,q,r,r_copy);
	}
}
void decode(bool c[M]) {
//#pragma HLS interface ap_fifo depth=256 port=d_out
	ap_uint<4> diedai_max=5;
	ap_uint<4> diedai;//迭代次数,即第几次迭代
	ap_uint<1> result=0;

	bool H[N][M] = {

		 								#include"H.h"
		 					};
	data_zj P[M] = {
	 			#include"y.h"
	 	};

	///*************************************译码******************************************
	////////////初始化

///
	int i,j;

		LOOP_initialize:
		for (i = 0; i < M; i++) {
#pragma HLS pipeline
			c[i]=BPSK(P[i]);
		}

	LOOP_diedai:
	for(diedai=0;diedai<diedai_max;diedai=diedai+1){
//#pragma HLS pipeline
		result = check_formula(diedai,c,H);
		if (result) {
			break;
		}
		else
		{
				update(H,r,qi);
				variable_note_pos(P, H, r, qi);
				panjue(c, qi);
		}
	}

}

