diedaimax=5;
Eb_N0=0:0.5:8;
maxBlocks=10^4;%最大仿真帧个数
%%%%%%%H矩阵生成
[H,A,B,g,med,mid,Tget]=g_h;
for i=1:1:17
  
    BER_yuanshi=0;%%%直接判决后的BER
    BER_MS=0;
    BER_NMS=0;
    FER_yuanshi=0;
    FER_MS=0;
    FER_NMS=0;
     
    for j=1:1:maxBlocks
       [s,x,jy]=g_h_encode(A,B,g,med,mid,Tget,H);
        
       y=BPSK(x,Eb_N0(i));
       %某一Eb/N0下 某一帧传输中 的误比特率 BER_MS
       %某一Eb/N0下所有帧的总误比 ErrorBits
       %某一Eb/N0下所有帧的总误帧率 FER_MS
       %某一Eb/N0下所有帧的总循环数 blocks
       if FER_yuanshi <= maxBlocks
            BER_yuanshi=error_rate_origin(s,y);
            if BER_yuanshi ~= 0
                  FER_yuanshi = FER_yuanshi + 1;
            end
       end
       
       if FER_MS <= maxBlocks
            v_MS = MS_decode( H, y, diedaimax,1 );
            BER_MS=compare_error_rate(s,v_MS);
            if BER_MS ~= 0
                  FER_MS = FER_MS + 1;
            end
       end
       
       if FER_NMS <= maxBlocks
            v_NMS = MS_decode( H, y, diedaimax,0.7 );
            BER_NMS=compare_error_rate(s,v_NMS);
            if BER_NMS ~= 0
                  FER_NMS = FER_NMS + 1;
            end
       end
        disp(['the' num2str(j) '-th frame of encoding has finished based on Eb/N0 = ' num2str(Eb_N0(i)) '.']);   
    end
     
    BER(1,i)=BER_yuanshi/maxBlocks;
    BER(2,i)=BER_MS/maxBlocks;
    BER(3,i)=BER_NMS/maxBlocks;
    
    FER(1,i)=FER_yuanshi/maxBlocks;
    FER(2,i)=FER_MS/maxBlocks;
    FER(3,i)=FER_NMS/maxBlocks;
      
   
end

% xlswrite('./BERofFourAlgorithm.xlsx', BER);
% xlswrite('./FERofFourAlgorithm.xlsx', FER);

figure('numbertitle','off','name','BER of 2 Decode algorithms')  
semilogy(Eb_N0, BER(1, :), 'K-^', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % 直接判决 三角marker 黑线
semilogy(Eb_N0, BER(2, :), 'R-o', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % MS  圆形marker 红线
semilogy(Eb_N0, BER(3, :), 'g-d', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % NMS  菱形marker 绿线 
legend('BER - 原始', 'BER - MS','FER - NMS')
grid on;
title('BER-Eb/N0(迭代次数=5）');
xlabel('Eb/N0');
ylabel('BER');

figure('numbertitle','off','name','FER of 2 Decode algorithms')
semilogy(Eb_N0, FER(1, :), 'K--^', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % SP 三角marker 黑线
semilogy(Eb_N0, FER(2, :), 'R--o', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % MS  圆形marker 红线
semilogy(Eb_N0, FER(3, :), 'g-d', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % NMS  菱形marker 绿线 
legend('FER - 原始', 'FER - MS','FER - NMS')
grid on;
title('FER-Eb/N0(迭代次数=5）');
xlabel('Eb/N0');
ylabel('FER');





% figure(3)
% plot(Eb_N0,log10(error_rate_yuanshi),Eb_N0,log10(error_rate));
% title('log10(BER)-Eb/N0(迭代次数=3）');
% xlabel('Eb/N0');
% ylabel('log10(BER)');
% axis([0,3.5,-3,0]);
%axis([1,10,0,1]);

