 function [s,x,jy]=g_h_encode(A,B,g,med,mid,Tget,H)
%load encode_in.mat;
n=256;%756;    %确定码长，即H矩阵的列数
j=4;%3;    %设置列重
k=8;%9;    %设置行重
m=n*j/k;     %根据输入的(n,j,k)计算出H矩阵的行数

for i=1:(n-m)              %随机生成码长为(n-m)的信息比特位
    s(1,i)=round(rand(1));
end

p1=med*s';
clear med;
clear mid;
for i=1:length(p1)
    p1(i)=mod(p1(i),2);
end

p3=p1';
%计算p2=-Tget*(A*s'+B*p1')
clear med;
clear mid;
med=A*s';                         %计算A*s'
for i=1:(m-g)
    mid(i,1)=mod(med(i,1),2);
end
clear med;
clear r;
r=B*p1;                           %计算B*p1
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
%显示结果


clear med;
x=[s p3 p4];
jy=H*x';%验证S*HT=0
%notdown为验证后的结果

end

