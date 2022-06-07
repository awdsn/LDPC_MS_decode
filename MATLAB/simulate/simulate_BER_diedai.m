Eb_N0=2.5;
diedaimax=1:1:10;
maxBlocks=10^6;%最大仿真帧个数
%%%%%%%H矩阵相关参数生成
[H,A,B,g,med,mid,Tget]=g_h;

for i=4:1:5
    BER_yuanshi=0;%%%直接判决后的BER
    BER_MS=0;
%      BER_NMS=0;
    FER_yuanshi=0;
    FER_MS=0;
%      FER_NMS=0;
     
    for j=1:1:maxBlocks
        [s,x,jy]=g_h_encode(A,B,g,med,mid,Tget,H);
        y=BPSK(x,Eb_N0);
       %某一Eb/N0下 某一帧传输中 的误比特率 BER_MS
       %某一Eb/N0下所有帧的总误比 ErrorBits
       %某一Eb/N0下所有帧的总误帧率 FER_MS
       %某一Eb/N0下所有帧的总循环数 blocks
%        if FER_yuanshi <= maxBlocks
            BER_yuanshi=error_rate_origin(s,y);
%             if BER_yuanshi ~= 0
%                   FER_yuanshi = FER_yuanshi + 1;
%             end
%        end
%        
%        if FER_MS <= maxBlocks
            v_MS = MS_decode( H, y, diedaimax(i),1 );
            BER_MS=compare_error_rate(s,v_MS);
%             if BER_MS ~= 0
%                   FER_MS = FER_MS + 1;
%             end
%        end
%        if FER_NMS <= maxBlocks
%             v_NMS = MS_decode( H, y, diedaimax(i),0.7 );
%             BER_NMS=compare_error_rate(s,v_NMS);
%             if BER_NMS ~= 0
%                   FER_NMS = FER_NMS + 1;
%             end
%        end
         disp(['the' num2str(j) '-th frame of encoding has finished based on diedai = ' num2str(diedaimax(i)) '.']);   
    end
    BER(3,i)=i;
    BER(1,i)=BER_yuanshi/maxBlocks;
    BER(2,i)=BER_MS/maxBlocks;
%     BER(3,i)=BER_NMS/maxBlocks;
    
%     FER(1,i)=FER_yuanshi/maxBlocks;
%     FER(2,i)=FER_MS/maxBlocks;
%     FER(3,i)=FER_NMS/maxBlocks;
      
        
end

% xlswrite('./BERofFourAlgorithm.xlsx', BER);
% xlswrite('./FERofFourAlgorithm.xlsx', FER);

% figure('numbertitle','off','name','BER of 2 Decode algorithms')  
% semilogy(diedaimax, BER(1, :), 'K-^', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % 直接判决 三角marker 黑线
% semilogy(diedaimax, BER(2, :), 'R-o', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % MS  圆形marker 红线 
% % semilogy(diedaimax, BER(3, :), 'g-d', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % NMS  菱形marker 绿线 
% legend('BER - 原始', 'BER - MS')
% grid on;
% title('BER-迭代次数(Eb/N0=3）');
% xlabel('迭代次数');
% ylabel('BER');

% figure('numbertitle','off','name','FER of 2 Decode algorithms')
% semilogy(diedaimax, FER(1, :), 'K--^', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % SP 三角marker 黑线
% semilogy(diedaimax, FER(2, :), 'R--o', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % MS  圆形marker 红线
% % semilogy(diedaimax, FER(3, :), 'g-d', 'LineWidth', 1.0, 'MarkerSize', 6); hold on; % NMS  菱形marker 绿线 
% 
% legend('FER - 原始', 'FER - MS')
% grid on;
% title('FER-迭代次数(Eb/N0=3');
% xlabel('迭代次数');
% ylabel('FER');