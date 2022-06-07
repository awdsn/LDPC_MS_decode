#include <iostream>
#include <fstream>
#include<iomanip>
#include"decode.h"
using	namespace std;
bool c[M];//��������
bool x[M];
///��ʼ��
void initialize()//����qji_0
{
	int a, b;
	double c_in[M];
	double temp = 0;
	///////////////////////////////////////////////////////////////////////��ȡ�ı�������
	ifstream infile; //�����ȡ�ļ���������ڳ�����˵��in
	infile.open("���յ��ź�y0.txt");//���ļ�//���յ��ź�y//���������x
	for (b = 0; b < M; b++) {
		infile >> temp;
		c_in[b] = temp;
		//cout << "chushi��������c_in" << b << "ֵΪ" << c_in[b] << endl;//����λֱ�ӽ����һλ�����������ǲ�0
		//if (c_in[b])
		//	P[b] = 1;//ci=1
		//else
		//	P[b] =-1;//ci=0
		P[b] = c_in[b];////////////P[M]ֱ��������RAM�����Բ���c_in[b]
		//cout << "P" << b << setw(10) << P[b] << endl;////////����
		for (a = 0; a < N; a++) {
			q[a][b] = P[b];
		}
	}
	infile.close();//��ȡ���֮��ر��ļ�
	for (b = 0; b < M; b++) {//ֱ�ӽ���ȡ���ļ��о��������ʼBER
		if (c_in[b] > 0)
			c[b] = 1;
		else
			c[b] = 0;
	}

}
void check_matrix_read()//��У������������
{
	int a, b;
	ifstream infile; //�����ȡ�ļ���������ڳ�����˵��in
	infile.open("У�����H.txt");//���ļ�
	for (a = 0; a < N; a++) {
		for (b = 0; b < M; b++) {
				infile >> H[a][b];//a��b��
			//	cout << "H" << a<<"   "<< b << "ֵ��	" << H[a][b] << endl;//����֤���������ȡ�ı���ͬ����
			
		}
	}
	infile.close();//��ȡ���֮��ر��ļ�
}
//��Ҫ�õ��Ĳ��ֺ���
int sign(double x) {		//ʵ��sign����
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

void check_note_update(int diedai)//У��ڵ����;�����rji��ֵ
{
	int i, j, b,  b0, i_temp;
	double temp0 = 1;
	double min_temp = 40;//����Сֵ����
	for (b = 0; b < M; b++) {
		for (j = 0; j < N; j++) {
			if (H[j][b]) {
				b0 = b;//����-------i
				for (i = 0; i < M; i++) {
					if (H[j][i]) {
						i_temp = i;
						if (i_temp != b0) {//i_temp=R(j)\i;    �����ڵ㼯��
							min_temp = min(min_temp, fabs(q[j][i_temp]));
							//cout << a0 << setw(7) <<i_temp<<setw(10)<< min_temp << endl;
							temp0 = temp0 * sign(q[j][i_temp]);///////
						}
					}					
				}
				r[j][b] = temp0 * (min_temp);///
				//cout << diedai << "�� r" << j+1 << setw(5)<< b+1 << setw(10) << r[j][b]  << endl;//��matlb�о����˳���Ӧ�����ڹ۲�
				temp0 = 1;//���������ε�rji֮��temp_0ֵ�ָ���׼��������һ��
				min_temp = 40;
			}
		}
	}
}

void variable_note_panjue(int diedai) {//�����ڵ��������Լ��о�
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
		//cout << diedai << "�� qi" << i  << setw(10) << qi[i] << endl;
		if (qi[i] > 0)
			c[i] = 0;
		else
			c[i] = 1;//////////////////////////////////////
	}
	//*****************************************д��txt*****************************************//
	ofstream fout("1.txt");
	for (i = 1; i < M; i++) {
		fout << c[i] << " ";

		//cout <<"�������������c"<<i<<"Ϊ	"<<c[i] << endl;
	}
	fout.close();
}
void variable_note_update(int diedai) {//�����ڵ����
	int j, a, b, a0, b0, j_temp;
	double temp1 = 0;//rki��ֵ����
	for (a = 0; a < N; a++) {
		for (b = 0; b < M; b++) {
			if (H[a][b]) 
				q[a][b] = qi[b] - r[a][b];
			else
				q[a][b] = qi[b];
			//if (H[a][b]) {
			//	a0 = a;//����------j
			//	b0 = b;//����-------i
			//	for (j = 0; j < N; j++) {
			//		if (H[j][b0]) {//j_temp=C(i)\j
			//			j_temp = j;
			//			if (j_temp != a0) {
			//				temp1 = temp1 + r[j_temp][b0];
			//			}
			//		}
			//	}
			//	q[a][b] = P[b] + temp1;
			//	//cout << "��" << diedai << "�Σ�	r " << a << " " << b << "= " << q[diedai - 1][a][b] << endl;
			//	temp1 = 0;//�ָ�ԭ��
			//}
			//cout << diedai << "�� q" << a << " " << b << setw(5) << q[a][b] << endl;
		}
	}
}
int check_formula(int diedai) {//����У���������Ƿ��������
	int i, j;
	int temp = 0;
	int s_sum = 0;//s_sum�����¼������������s[i]=0�ĸ���

	for (j = 0; j < N; j++) {//////////////////////N��У�鷽��
		for (i = 0; i < M; i++) {
			temp = temp + c[i] * H[j][i];
		}
		s[j] = temp;
		if (s[j]%2 == 0) {
			s_sum = s_sum + 1;
		}
		else {
			//cout << "��" << diedai << "�Σ�	У����s" << j << ":	" << s[j] << endl;
		}
		temp = 0;
	}
	cout << "��" << diedai << "�Σ�	����������s��ĿΪ" << s_sum << endl;
	/// ////////////////////////////////��֤
	int fanhui;//�ݴ�ֵ,����ȷ������ֵ��ʲô
	if (s_sum == N)
		fanhui = 1;//����У����󣬽�������
	else
		fanhui = 0;

	return fanhui;
	s_sum = 0;
}

int decode(int diedai_max) {
	int diedai = 0;//��������,���ڼ��ε���
	int result;
	int b;
	//***************************************����x********************************************//
	//ifstream infile; //�����ȡ�ļ���������ڳ�����˵��in
	//infile.open("���������x.txt");
	//for (b = 0; b < M; b++) {
	//	infile >> x[b];
	//	//cout << x[M] << endl;
	//}
	//infile.close();//��ȡ���֮��ر��ļ�

	///*************************************����******************************************//
	initialize();///��ʼ��������q0_ij,��pi
	check_matrix_read();//��У������������

	while (diedai <= diedai_max) {
		result = check_formula(diedai);
		if (result) {
			//cout << "���յ�������Ϊ��	" << diedai << endl;//ȷ���ڼ��ε���ʱ��������
			diedai = diedai_max + 1;
		}
		else {
			diedai = diedai + 1;
			check_note_update(diedai);
			variable_note_panjue(diedai);
			variable_note_update(diedai);
		}
		
		
	}
	//cout << "���յ�������Ϊ��	" << diedai << endl;//ȷ���ڼ��ε���ʱ��������
	return 0;

}