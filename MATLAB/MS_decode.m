function [ v ] = MS_decode( H, y, diedaimax,a )

%初始化
P=y;
q = zeros(size(H'));%q[i*j]
r = zeros(size(H));%r[j*i];
x = zeros(size(P));
[N,M]=size(H);
for i=1:1:M
    for j=1:N
            q(i,j)=P(i);
    end
end

for diedai=1:1:diedaimax
    for j=1:1:N
		idx = find(H(j,:) == 1);%idx=R(j)=i'
        L=length(idx);
        for k= 1:1:L
             prodVal = 1.0;
             %%minOfVal = 10;
                
            if k == 1
                minOfVal = min(abs(q(idx(2:end),j)));
            elseif k == length(idx)
                minOfVal = min(abs(q(idx(1:k-1),j)));
            else
                minOfVal = min(min( abs(q(idx(1:k-1),j)) ), min( abs(q(idx(k+1:end),j)) ) );
            end
            
            for t = 1:1:L
                if t ~= k   %idx(t)=R(j)\i
                    prodVal = prodVal * sign( q(idx(t),j) );
                end
            end  
            
            r( j,idx(k)) = a*prodVal * minOfVal;
        end
    end
	
    for i=1:M
		idx = find(H(:,i) == 1); %idx=C(i)=j'
            for k = 1:1:length(idx)
                q(i,idx(k)) =  P(i) + sum(r(idx,i)) - r(idx(k),i);
            end
    end
	
    for i = 1:1:length(x)
        idx = find(H(:, i) == 1);
        addVal(i) = sum(r(idx,i)) + P(i);
        if(addVal(i) >0)
            x(i) = 0;
        else
            x(i) = 1;
        end
    end
% 	qmax(diedai)=max(max(q));
%     qmin(diedai)=min(min(q));
%     rmax(diedai)=max(max(r));
%     rmin(diedai)=min(min(r));
%     qimax(diedai)=max(max(addVal));
%     qimin(diedai)=min(min(addVal));
    if mod(H*(x'), 2) == 0
        break;
    end
	
end

v = x(1:128);
end