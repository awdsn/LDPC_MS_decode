 function [s,x,jy]=g_h_encode(A,B,g,med,mid,Tget,H)
%load encode_in.mat;
n=256;%756;    %ȷ���볤����H���������
j=4;%3;    %��������
k=8;%9;    %��������
m=n*j/k;     %���������(n,j,k)�����H���������

for i=1:(n-m)              %��������볤Ϊ(n-m)����Ϣ����λ
    s(1,i)=round(rand(1));
end

p1=med*s';
clear med;
clear mid;
for i=1:length(p1)
    p1(i)=mod(p1(i),2);
end

p3=p1';
%����p2=-Tget*(A*s'+B*p1')
clear med;
clear mid;
med=A*s';                         %����A*s'
for i=1:(m-g)
    mid(i,1)=mod(med(i,1),2);
end
clear med;
clear r;
r=B*p1;                           %����B*p1
for i=1:(m-g)
    med(i,1)=mod(r(i,1),2);
end
clear Q;
Q=mid+med;
for i=1:(m-g)
    med(i,1)=mod(Q(i,1),2);
end
p2=Tget*med;
for i=1:length(p2)
    p2(i)=mod(p2(i),2);
end
p4=p2';
clear p2;
p2=p4;
%��ʾ���


clear med;
x=[s p3 p4];
jy=H*x';%��֤S*HT=0
%notdownΪ��֤��Ľ��

end

