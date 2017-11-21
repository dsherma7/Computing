function x = GaussNewton(f,J,x0,thresh,max_iter)
% Impliments Gauss Newton method for optimizing
% A function F = sum(f_i) and J = [grad f_i]
%
% INPUT:
%   f: An nx1 matrix of [f1 f2 ... fn]'
%   J: An nxm matrix of [gf1 gf2 ... gfn]'
%   x0: Initial point for iteration (default 10e-7)
%   thresh: Stop if |dF(x)| ~ |J(x)'*f(x)| < thresh (default 100)
%   max_iter: Max iterations before stopping
%
% OUTPUT:
%   x: x = argmin|dF|
    if ~exist('thresh','var') thresh = 10e-7; end
    if ~exist('max_iter','var') max_iter = 100; end
    x = x0;    
    for k = 1:max_iter
        if norm(J(x)'*f(x)) < thresh
            return
        end
        p = -(J(x)'*J(x))^-1*J(x)'*f(x);
        g = @(s) sum(f(x+s*p).^2); 
        s = fminsearch(g,x); 
        x = x + s*p;        
    end
    warning('Method did not converge!');
end