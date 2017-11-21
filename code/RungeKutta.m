function [y,t] = RungeKutta(f,y0,a,b,n)
% Impliments Runge Kutta methos for approximating 
% an IVP y' = f(t,y(t)), y(a)=y0   
% across n intervals for t in [a,b]			     
%
% INPUT:
%   f: Function f(t,y):R^2->R where y'=f
%   y0: Initial y value
%   a: Left endpoint, equal to t0
%   b: Right endpoint, equal to t0+hn
%   n: Number of sub-intervals
%
% OUTPUT:
%   y: Output y values for each y(ti)
%   t: The divided number of sub-intervals

    h = (b-a)/n;
    y = ones(1,n+1).*y0; 
    t = a+(0:n)*h; 
    for k = 1:n
        q1 = f(t(k),y(k));
        q2 = f(t(k)+h/2,y(k)+h/2*q1);
        q3 = f(t(k)+h/2,y(k)+h/2*q2);
        q4 = f(t(k)+h,y(k)+h*q3);
        y(k+1) = y(k)+h/6*(q1+2*q2+2*q3+q4);
    end
end