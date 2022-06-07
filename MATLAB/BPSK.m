function [y]=BPSK(x,Eb_N0)
R=1/2;
% BPSK调制
        d = 1 - 2.*x;
% AWGN
        SNR_dB = Eb_N0 + 10*log10(R) - 10*log10(1/2);%SNR_dB为awgn函数的输入
        SNR_linear = 10^(SNR_dB/10);%SNR线性形式的信噪比
        sigma = sqrt(1/SNR_linear);%%%%计算平方根;;噪声的标准差
        y = d + sigma*randn(size(d)); % 加噪声；具体到正态分布，产生均值为d，方差为sigma^2的M*N的随机数矩阵

% 译码端接收
        y = 2*y/(sigma^2);
end