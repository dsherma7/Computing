function [x,k]=Newtons(df,d2f,x0,k_max,thresh)
% Uses Newtons method to find the minimum of 
% a function F(x). Use -F(x) to find max.
%
% INPUT:
%   df: Derivative of F
%   d2f: 2nd Derivative of F
%   x0: Starting point x0
%   k_max: Max number of iterations 
%   thresh: Threshold for determining minimum
%
% OUTPUT:
%   x: x such that |df(x)-0| < thresh and d2f(x) > 0
%   k: Number of iterations performed

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