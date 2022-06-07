function [error_rate]=compare_error_rate(s,v)
    
    error_sum=0;
    N=size(s);
    for i=1:N(2)
        if(s(i) ~= v(i))
            error_sum=error_sum+1;
        end
    end
    error_rate=error_sum/N(2);
end