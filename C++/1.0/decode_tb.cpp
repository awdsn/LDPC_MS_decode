#include <iostream>
#include <fstream>
#include<iomanip>
#include"decode.h"
using namespace std;
extern  bool c[M];//译码后变量
extern  bool x[M];//
static bool s1[N];
static bool co[N];

int main() {

	int a,b,i,j;
	float error_num = 0;
	float error_rate;
	//***************************************读入s********************************************//
	ifstream infile; //定义读取文件流，相对于程序来说是in
	infile.open("编码前向量s.txt");
	for (a = 0; a < N; a++) {
		infile >> s1[a];
	}
	infile.close();//读取完成之后关闭文件
	int d=20;
	//for (d = 0; d < 20; d = d + 1) {
		decode(d);

		for (a = 0; a < N; a++) {
			co[a] = c[a + M - N];
		}
		//****************************************验证输出******************************************//
		cout << setw(5) << "N" << setw(10) << "s[N]" << setw(10) << "c[N]" << endl;
		for (j = 0; j < N; j++) {
			//cout << setw(5) << j << setw(10) << s1[j] << setw(10) << co[j] << endl;
			if (s1[j] != co[j]) {
				error_num = error_num + 1;
			}
		}

		//cout.setf(ios::fixed);
		cout << d << " 最终的误比特数为" << error_num << endl;
		error_num = 0;
	//}
	return 0;

}

