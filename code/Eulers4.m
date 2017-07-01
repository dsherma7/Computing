function [y,t] = Eulers4(f,df,d2f,y0,a,b,n)   
% Impliments a 4th order Eulers Method for
% approximating an IVP y' = f(t,y(t)), y(a)=y0   
% across n intervals for t in [a,b]			     
%
% INPUT:
%   f: Function f(t,y):R^2->R where y'=f
%   df: Derivative of f wrt y
%   d2f: 2nd Derivative of f wrt y
%   y0: Initial y value
%   a: Left endpoint, equal to t0
%   b: Right endpoint, equal to t0+hn
%   n: Number of sub-intervals
% OUTPUT:
%   y: Output y values for each y(ti)
%   t: The divided number of sub-intervals

    h = (b-a)/n;
    y = ones(1,n+1).*y0; 
    t = a+(0:n)*h; 
    for k = 1:n
        y(k+1) = y(k) + h*f(t(k),y(k))+(h.^2/2).*df(t(k),y(k))+(h.^3/6).*d2f(t(k),y(k));
    end
end