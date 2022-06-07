%生成的校验矩阵为H,
function [s,H,x]=generate_h
%load encode_in.mat;
n=256;%756;    %确定码长，即H矩阵的列数
j=4;%3;    %设置列重
k=8;%9;    %设置行重
m=n*j/k;                   %根据输入的(n,j,k)计算出H矩阵的行数


for i=1:(n-m)              %随机生成码长为(n-m)的信息比特位
    s(1,i)=round(rand(1));
end

notdown=1;
while notdown==1
    clear med;
keni2=0;
while keni2==0
keni=0;                     %判断生成的F是否可逆，若可逆，则跳出循环；若不可逆，则继续
while keni==0

%开始利用代数方法生成所需要的去四环H矩阵
u=primes(m);               %生成大于（j-1）的素数
geshuhl=size(u);
geshu=geshuhl(1,2);
for i=1:geshu
    if u(1,1)<j
        for a=1:(geshu-i)
            u(1,a)=u(1,(a+1));
        end
    else 
        break;
    end
end
for i=1:geshu                 %将里面和m的最大公约数不为1的素数置为0
    if gcd(u(1,i),m)~=1
       u(1,i)=0;
    end
end
a=0;                      %将p中除0以外的素数依次存入y中
for i=1:geshu
    if u(1,i)~=0
        a=a+1;
        y(1,a)=u(1,i);
    end
end
clear geshu;
geshuhl=size(y);
geshu=geshuhl(1,2);
%
for q2wei=2:6
    for q1wei=1:(q2wei-1)
        q1=y(1,q1wei);
        q2=y(1,q2wei);
        m1=2*q2-q1;
        m2=2*q2+q1;
        m3=2*q1-q2;
        m4=2*q1+q2;
    for i=1:geshu
        if y(1,i)==m1
           y(1,i)=0;
        elseif y(1,i)==m2
           y(1,i)=0;
        elseif y(1,i)==m3
           y(1,i)=0;
        elseif y(1,i)==m4
           y(1,i)=0;
        end
    end
    clear u;
    u=y;
    clear y;

    a=0;                      %将p中除0以外的素数依次存入y中
    for i=1:geshu
        if u(1,i)~=0
           a=a+1;
           y(1,a)=u(1,i);
        end
    end
    clear geshu;
    geshuhl=size(y);
    geshu=geshuhl(1,2);
    end
end
for a=1:k                 %生成每列中1的位置
    b=round(m*rand(1));
    for i=1:m
        pos(1,(a-1)*m+i)=mod((b+(i-1)*y(1,a)),m);
    end
end
H=zeros(m,n);             %在每列相应位置填充1
for i=1:n
    for a=1:j
        H((pos(1,(a+(i-1)*j))+1),i)=1;
    end
end
%将得到的H矩阵进行分块预处理
for i=1:n                  %建立索引表
    coldix(i)=i;
end
coldix;

for i=1:n                  %将每一列中第一个1的位子记录为数组f1pos
    for a=1:m
        if H(a,i)==1
            f1pos(i)=a;
            break;
        end
    end
end
f1pos;

for a=1:m                  %将生成的H矩阵的前面几行调换成下三角形式
    goon=0;
    for i=1:n
        if f1pos(i)==a
            goon=1;
            if i==a
                break;
            end
            if i~=a
                med=f1pos(i);
                f1pos(i)=f1pos(a);
                f1pos(a)=med;
                for b=1:m
                    mid(b)=H(b,i);
                    H(b,i)=H(b,a);
                    H(b,a)=mid(b);
                end
                med=coldix(i);
                coldix(i)=coldix(a);
                coldix(a)=med;
                break;
            end
        end
    end
    if goon==0
        break;
    end
end
clear mid;
clear med;
g=m-a+1;                         
Ts=m-g;

%分别将计算所需要的ABCDET划分出来
clear T;
for i=1:Ts
    for a=1:Ts
        T(i,a)=H(i,a);
    end
end
clear E;
for i=(m-g+1):m
    for a=1:(m-g)
        E((i-(m-g)),a)=H(i,a);
    end
end 
clear A;
for i=1:(m-g)
    for b=(m-g+1):(n-g)
        A(i,(b-m+g))=H(i,b);
    end
end
clear C;
for i=(m-g+1):m
    for a=(m-g+1):(n-g)
        C((i-m+g),(a-m+g))=H(i,a);
    end
end
clear B;
for i=1:(m-g)
    for a=(n-g+1):n
        B(i,(a-n+g))=H(i,a);
    end
end
clear D;
for i=(m-g+1):m
    for a=(n-g+1):n
        D((i-m+g),(a-n+g))=H(i,a);
    end
end
clear Hget;
Hget=zeros(m,n);               %将上一步生成的H矩阵前面形成下三角的那几行调换到最后
for i=(m-g+1):n
    for a=1:m
        Hget(a,(i-m+g))=H(a,i);
    end
end
for i=1:(m-g)
    for a=1:m
        Hget(a,(i+n-m+g))=H(a,i);
    end
end
Hget;

%开始代入公式计算计算校验码位


%第一步，求解T矩阵的逆矩阵
%计算T矩阵的逆矩阵
clear med;
clear w;
w=eye(Ts);
med=[T w];

%将med的左半部分化成下三角矩阵
for i=1:(Ts-1)
    %保证med(i,i)==1
    if med(i,i)==0
        for a=(i+1):Ts
            if med(a,i)==1
                for b=1:(2*Ts)
                    med(i,b)=med(i,b)+med(a,b);
                    med(i,b)=mod(med(i,b),2);
                end
                break;
            end
        end
    end
    %在第i列中向下找一个等于1的元素，将第i行加到那个元素所在的那一行
    for a=(i+1):Ts
        if med(a,i)==1
            for b=1:(2*Ts)
                med(a,b)=med(i,b)+med(a,b);
                med(a,b)=mod(med(a,b),2);
            end
        end
    end
end
%将med的左半部分化成单位阵
i=Ts;
while i~=1
    a=i-1;
    while a~=0
        if med(a,i)==1
            for b=1:(2*Ts)
                med(a,b)=med(a,b)+med(i,b);
                med(a,b)=mod(med(a,b),2);
            end
        end
        a=a-1;
    end
    i=i-1;
end
%将med的右半部分作为最后结果提取出来
clear Tget;
for i=(Ts+1):(2*Ts)
    for a=1:Ts
        Tget(a,(i-Ts))=med(a,i);
    end
end
%T矩阵的逆矩阵求解过程到此结束


%第二步，求解F
%计算中间变量F= -E*Tget*B+D
a=E*Tget;                   %计算E*Tget
for i=1:g
    for z=1:(m-g)
        d(i,z)=mod(a(i,z),2);
    end
end
b=d*B;                      %计算E*Tget*B
clear e;
for i=1:g
    for z=1:g
        e(i,z)=mod(b(i,z),2);
    end
end
clear med;
med=e+D;
clear F;
for i=1:g                   %计算E*Tget*B+D
    for z=1:g
        F(i,z)=mod(med(i,z),2);
    end
end
clear d;
clear b;
clear e;
if rank(F)==g               %判断F是否可逆
    keni=1;
    break;
end
clear F;
clear A;
clear B;
clear C;
clear D;
clear E;
clear T;
end





%得到可逆F过后，开始求解F的逆矩阵
%求F的逆矩阵
clear med;
w=eye(g);
med=[F w];

%将med的左半部分化成下三角矩阵
for i=1:(g-1)
    %保证med(i,i)==1
    if med(i,i)==0
        for a=(i+1):g
            if med(a,i)==1
                for b=1:(2*g)
                    med(i,b)=med(i,b)+med(a,b);
                    med(i,b)=mod(med(i,b),2);
                end
                break;
            end
        end
    end
    %在第i列中向下找一个等于1的元素，将第i行加到那个元素所在的那一行
    for a=(i+1):g
        if med(a,i)==1
            for b=1:(2*g)
                med(a,b)=med(i,b)+med(a,b);
                med(a,b)=mod(med(a,b),2);
            end
        end
    end
end
if med(g,g)==1
    keni2=1;
    break;
end
clear F;
clear A;
clear B;
clear C;
clear D;
clear E;
clear T;
end

%将med的左半部分化成单位阵
i=g;
while i~=1
    a=i-1;
    while a~=0
        if med(a,i)==1
            for b=1:(2*g)
                med(a,b)=med(a,b)+med(i,b);
                med(a,b)=mod(med(a,b),2);
            end
        end
        a=a-1;
    end
    i=i-1;
end
%将med的右半部分作为最后结果提取出来
clear Fget;
for i=(g+1):(2*g)
    for a=1:g
        Fget(a,(i-g))=med(a,i);
    end
end
Fmedd=med;
%F的逆矩阵求解过程到此结束



%计算p1=(-Fget)*((-E)*Tget*A+C)*s'
clear med;
p=E*Tget;                        %计算E*Tget
for i=1:g
    for a=1:(m-g)
        med(i,a)=mod(p(i,a),2);
    end
end
t=med*A;                         %计算E*Tget*A
for i=1:g
    for a=1:(n-m)
        mid(i,a)=mod(t(i,a),2);
    end
end
Q=mid+C;
clear mid;
for i=1:g                        %计算E*Tget*A+C
    for a=1:(n-m)
        mid(i,a)=mod(Q(i,a),2);
    end
end


clear med;
r=Fget*mid;
for i=1:g
    for a=1:(n-m)
        med(i,a)=mod(r(i,a),2);
    end
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
xyuan=[s p3 p4];
med=Hget*xyuan';%验证S*HT=0
%notdown为验证后的结果
for i=1:m
    med(i,1)=mod(med(i,1),2);
end
notdown=0;
for i=1:m
    if med(i,1)==1
        notdown=1;
    end
end
end
H=Hget;
liezhong=j;
hangzhong=k;
xxw=n-n*j/k;
machang=n;%码长
x=xyuan;
end

