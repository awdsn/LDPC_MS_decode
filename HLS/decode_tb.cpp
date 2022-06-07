#include <iostream>
#include <fstream>
#include<iomanip>
#include"decode.h"
using namespace std;
 //extern bool c[M];//译码后变量

bool c[M];
 bool co[N];



 bool s[N]={
 			#include"s.h"
 	};

int main() {

	int a,b,i,j;
	float error_num = 0;
	float error_rate;
	//***************************************读入s********************************************//


		decode(c);

		for (a = 0; a < N; a++) {
			co[a] = c[a];
		}
		//****************************************验证输出******************************************//
		cout << setw(5) << "N" << setw(10) << "s[N]" << setw(10) << "c[N]" << endl;
		for (j = 0; j < N; j++) {
			cout << setw(5) << j << setw(10) << s[j] << setw(10) << co[j] << endl;
			if (s[j] != co[j]) {
				error_num = error_num + 1;
			}
		}
		error_rate = error_num / (M - N);

		cout << " Error_cnt=" << error_num << endl;
		cout << " Error_rate=" << error_rate << endl;


		if(error_num<10)
			return 0;
		else
			return 1;
		error_num = 0;
}

