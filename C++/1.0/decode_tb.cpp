#include <iostream>
#include <fstream>
#include<iomanip>
#include"decode.h"
using namespace std;
extern  bool c[M];//��������
extern  bool x[M];//
static bool s1[N];
static bool co[N];

int main() {

	int a,b,i,j;
	float error_num = 0;
	float error_rate;
	//***************************************����s********************************************//
	ifstream infile; //�����ȡ�ļ���������ڳ�����˵��in
	infile.open("����ǰ����s.txt");
	for (a = 0; a < N; a++) {
		infile >> s1[a];
	}
	infile.close();//��ȡ���֮��ر��ļ�
	int d=20;
	//for (d = 0; d < 20; d = d + 1) {
		decode(d);

		for (a = 0; a < N; a++) {
			co[a] = c[a + M - N];
		}
		//****************************************��֤���******************************************//
		cout << setw(5) << "N" << setw(10) << "s[N]" << setw(10) << "c[N]" << endl;
		for (j = 0; j < N; j++) {
			//cout << setw(5) << j << setw(10) << s1[j] << setw(10) << co[j] << endl;
			if (s1[j] != co[j]) {
				error_num = error_num + 1;
			}
		}

		//cout.setf(ios::fixed);
		cout << d << " ���յ��������Ϊ" << error_num << endl;
		error_num = 0;
	//}
	return 0;

}

