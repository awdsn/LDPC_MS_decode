function [error_rate_origin]=error_rate_origin(s,y)
    N=size(s);
 %直接判决结果
    y1=sign(y);
    y1=(1-y1)/2;
    error_rate_origin=compare_error_rate(s,y1(1:N(2)));
end