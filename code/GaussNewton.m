%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Runs Gauss-Newton Method  %
% For a Jacobian J for each %
% F(x) = \sum f_i^2			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = GaussNewton(f,J,x0,thresh,max_iter)
% Impliments Gauss Newton method for optimizing
% A function F = sum(f_i) and J = [grad f_i]
%
% INPUT:
%   f: Number of sub-intervals
%   J: Function r(x):R->R multiplying y(x)
%   x0: Function f(x):R->R 
%   thresh: Boundary Value y(0)=a
%   max_iter: Boundary Value y(1)=b
%
% OUTPUT:
%   y: Output y values for each y(ti)
%   t: The divided number of sub-intervals
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