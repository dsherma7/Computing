function u = FiniteDifference(n,r,f,a,b)
% Uses finite differences method for solving an	     
% BVP of the form -y'' + r(x)y = f(x) for n
% intevals for x in [0,1], y(0)=a, y(1)=b
%
% INPUT:
%   n: Number of sub-intervals
%   r: Function r(x):R->R multiplying y(x)
%   f: Function f(x):R->R 
%   a: Boundary Value y(0)=a
%   b: Boundary Value y(1)=b
%
% OUTPUT:
%   y: Output y values for each y(ti)
%   t: The divided number of sub-intervals

    h = 1/n;
    x = h*(1:n-1);    
    F = f(x)' + [a zeros(1,n-2) b]'/h^2;
    A = (1/h^2)*(toeplitz([0,-1,zeros(1,n-3)])+diag(2+h^2*r(x)));
    u = [a,F\A,b];
    
end