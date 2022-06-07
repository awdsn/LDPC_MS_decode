#include <iostream>
#include <fstream>
#include<iomanip>
#include"decode.h"
using	namespace std;
bool c[M];//译码后变量
bool x[M];
///初始化
void initialize()//计算qji_0
{
	int a, b;
	double c_in[M];
	double temp = 0;
	///////////////////////////////////////////////////////////////////////读取文本到数组
	ifstream infile; //定义读取文件流，相对于程序来说是in
	infile.open("接收到信号y0.txt");//打开文件//接收到信号y//编码后向量x
	for (b = 0; b < M; b++) {
		infile >> temp;
		c_in[b] = temp;
		//cout << "chushi函数输入c_in" << b << "值为" << c_in[b] << endl;//后四位直接将最后一位延续，而不是补0
		//if (c_in[b])
		//	P[b] = 1;//ci=1
		//else
		//	P[b] =-1;//ci=0
		P[b] = c_in[b];////////////P[M]直接申明成RAM，可以不用c_in[b]
		//cout << "P" << b << setw(10) << P[b] << endl;////////无误
		for (a = 0; a < N; a++) {
			q[a][b] = P[b];
		}
	}
	infile.close();//读取完成之后关闭文件
	for (b = 0; b < M; b++) {//直接将读取的文件判决，计算初始BER
		if (c_in[b] > 0)
			c[b] = 1;
		else
			c[b] = 0;
	}

}
void check_matrix_read()//将校验矩阵读入数组
{
	int a, b;
	ifstream infile; //定义读取文件流，相对于程序来说是in
	infile.open("校验矩阵H.txt");//打开文件
	for (a = 0; a < N; a++) {
		for (b = 0; b < M; b++) {
				infile >> H[a][b];//a行b列
			//	cout << "H" << a<<"   "<< b << "值：	" << H[a][b] << endl;//已验证其输入与读取文本相同无误
			
		}
	}
	infile.close();//读取完成之后关闭文件
}
//需要用到的部分函数
int sign(double x) {		//实现sign函数
	if (x > 0)
		return 1;
	else if (x == 0)
		return 0;
	else
		return -1;
}
double max(double a, double b) {
	if (a >= b)
		return a;
	else
		return b;
}
double min(double a, double b) {
	if (a >= b)
		return b;
	else
		return a;
}
double fabs(double a) {
	if (a > 0)
		return a;
	else
		return -a;
}

void check_note_update(int diedai)//校验节点更新;计算出rji的值
{
	int i, j, b,  b0, i_temp;
	double temp0 = 1;
	double min_temp = 40;//将最小值缓存
	for (b = 0; b < M; b++) {
		for (j = 0; j < N; j++) {
			if (H[j][b]) {
				b0 = b;//列数-------i
				for (i = 0; i < M; i++) {
					if (H[j][i]) {
						i_temp = i;
						if (i_temp != b0) {//i_temp=R(j)\i;    变量节点集合
							min_temp = min(min_temp, fabs(q[j][i_temp]));
							//cout << a0 << setw(7) <<i_temp<<setw(10)<< min_temp << endl;
							temp0 = temp0 * sign(q[j][i_temp]);///////
						}
					}					
				}
				r[j][b] = temp0 * (min_temp);///
				//cout << diedai << "次 r" << j+1 << setw(5)<< b+1 << setw(10) << r[j][b]  << endl;//和matlb中矩阵的顺序对应，便于观察
				temp0 = 1;//计算完依次的rji之后将temp_0值恢复，准备计算下一次
				min_temp = 40;
			}
		}
	}
}

void variable_note_panjue(int diedai) {//变量节点后验概率以及判决
	int i, j;
	double temp2 = 0;
	for (i = 0; i < M; i++) {
		for (j = 0; j < N; j++) {
			if (H[j][i]) { //j=C(i);
				temp2 = temp2 + r[j][i];
			}
		}
		qi[i] = P[i] + temp2;
		temp2 = 0;
		//cout << diedai << "次 qi" << i  << setw(10) << qi[i] << endl;
		if (qi[i] > 0)
			c[i] = 0;
		else
			c[i] = 1;//////////////////////////////////////
	}
	//*****************************************写入txt*****************************************//
	ofstream fout("1.txt");
	for (i = 1; i < M; i++) {
		fout << c[i] << " ";

		//cout <<"最终译码后向量c"<<i<<"为	"<<c[i] << endl;
	}
	fout.close();
}
void variable_note_update(int diedai) {//变量节点更新
	int j, a, b, a0, b0, j_temp;
	double temp1 = 0;//rki和值缓存
	for (a = 0; a < N; a++) {
		for (b = 0; b < M; b++) {
			if (H[a][b]) 
				q[a][b] = qi[b] - r[a][b];
			else
				q[a][b] = qi[b];
			//if (H[a][b]) {
			//	a0 = a;//行数------j
			//	b0 = b;//列数-------i
			//	for (j = 0; j < N; j++) {
			//		if (H[j][b0]) {//j_temp=C(i)\j
			//			j_temp = j;
			//			if (j_temp != a0) {
			//				temp1 = temp1 + r[j_temp][b0];
			//			}
			//		}
			//	}
			//	q[a][b] = P[b] + temp1;
			//	//cout << "第" << diedai << "次：	r " << a << " " << b << "= " << q[diedai - 1][a][b] << endl;
			//	temp1 = 0;//恢复原样
			//}
			//cout << diedai << "次 q" << a << " " << b << setw(5) << q[a][b] << endl;
		}
	}
}
int check_formula(int diedai) {//根据校验矩阵计算是否译码完成
	int i, j;
	int temp = 0;
	int s_sum = 0;//s_sum负责记录满足条件，即s[i]=0的个数

	for (j = 0; j < N; j++) {//////////////////////N个校验方程
		for (i = 0; i < M; i++) {
			temp = temp + c[i] * H[j][i];
		}
		s[j] = temp;
		if (s[j]%2 == 0) {
			s_sum = s_sum + 1;
		}
		else {
			//cout << "第" << diedai << "次：	校验结果s" << j << ":	" << s[j] << endl;
		}
		temp = 0;
	}
	cout << "第" << diedai << "次：	满足条件的s数目为" << s_sum << endl;
	/// ////////////////////////////////验证
	int fanhui;//暂存值,负责确定返回值是什么
	if (s_sum == N)
		fanhui = 1;//满足校验矩阵，结束迭代
	else
		fanhui = 0;

	return fanhui;
	s_sum = 0;
}

int decode(int diedai_max) {
	int diedai = 0;//迭代次数,即第几次迭代
	int result;
	int b;
	//***************************************读入x********************************************//
	//ifstream infile; //定义读取文件流，相对于程序来说是in
	//infile.open("编码后向量x.txt");
	//for (b = 0; b < M; b++) {
	//	infile >> x[b];
	//	//cout << x[M] << endl;
	//}
	//infile.close();//读取完成之后关闭文件

	///*************************************译码******************************************//
	initialize();///初始化，计算q0_ij,即pi
	check_matrix_read();//将校验矩阵读入数组

	while (diedai <= diedai_max) {
		result = check_formula(diedai);
		if (result) {
			//cout << "最终迭代次数为：	" << diedai << endl;//确定第几次迭代时结束运行
			diedai = diedai_max + 1;
		}
		else {
			diedai = diedai + 1;
			check_note_update(diedai);
			variable_note_panjue(diedai);
			variable_note_update(diedai);
		}
		
		
	}
	//cout << "最终迭代次数为：	" << diedai << endl;//确定第几次迭代时结束运行
	return 0;

}