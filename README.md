# LDPC_MS_decode

  MATLAB文件夹中的simulate负责对LDPC码译码进行仿真，得出图形；C++中的初始代码按照不同的功能对应不同的子函数，之后为了减少译码所需的时钟周期，代码中的执行不同功能的循环
放在了一起，虽然不便阅读，但译码时间得到了减少。HLS文件夹中增加了一些代码中没有的约束文件和综合报告。Verilog文件夹中代码负责将 HLS生成的IP在vivado中进行仿真。

在MATLAB中调用各子函数的顺序如下：

clear all
[H,A,B,g,med,mid,Tget]=g_h;
[s,x,jy]=g_h_encode(A,B,g,med,mid,Tget,H);%%编码

y=BPSK(x,2.5);%%调价噪声信号，2.5为信噪比
BER_yuanshi=error_rate_origin(s,y);%%%计算直接判决得出的BER
 v_MS = MS_decode( H, y, 5 ,1);%%%MS译码后的错误比特数
 BER_MS=compare_error_rate(s,v_MS);%%%%MS译码后的BER
 BER_sum=128*BER_MS; 
