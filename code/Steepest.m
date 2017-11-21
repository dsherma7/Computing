function [x,k]=Steepest(f,df,x0,k_max,thresh)
% Uses Method of Steepest descrent to find 
% the minimum of a function F(x)
%
% INPUT:
%   df: Derivative of F
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
        p = -df(x(1),x(2));
        g = @(s) f(x(1)+s*p(1),x(2)+s*p(2)); 
        s = fminsearch(g,x(1)); 
        xold = x;
        x = x+s*p';
        k = k+1;
    end    
    warning('Method did not converge!');
end