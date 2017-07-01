%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform Newton's       %
% for optimization using %
% dF and d2F             %
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,k]=Newtons(df,d2f,x0,k_max,thresh)
    if ~exist('k_max','var')
        k_max = 100;
    end
    if ~exist('thresh','var')
        thresh = 10e-7;
    end
    x = x0; xold = x0+2*thresh; k = 0;
    while k < k_max
        if norm(xold-x) < thresh
            return;
        end 
        xold = x;
        x = x-(d2f(x(1),x(2)).^(-1)*df(x(1),x(2)))';
        k = k+1;
    end
    warning('Method did not converge!');
end