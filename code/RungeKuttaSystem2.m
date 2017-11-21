function [t,y] = RungeKuttaSystem2(f,y0,tmax,h) 
% Impliments Runge Kutta Method for approximating 
% an system of IVPs of the form 
% y' = f(t,y), y' = [t1,t2,...,]
% across n intervals for t in [0,tmax]
% for y,y',F in R^n
% 
% INPUT:
%   f: Function f(x,y):R^2->R where z'=f
%   y0: Initial values for y
%   tmax: max t value 
%   n: number of sub-intervals
%
% OUTPUT:
%   t: The divided number of sub-intervals
%   y: Output x values for each x(ti)

    n = tmax/h;
    sz = length(y0);
    y = ones(sz,n+1).*y0;
    t = (0:n)*h; 
    for k = 1:n
        q1 = f(t(k)+h/2,y(:,k)+h/2);           
        q2 = f(t(k)+h/2,y(:,k)+h/2*q1);
        q3 = f(t(k)+h/2,y(:,k)+h/2*q2);
        q4 = f(t(k)+h  ,y(:,k)+h*q3);
        y(:,k+1) = y(:,k)+h/6*(q1+2*q2+2*q3+q4);        
    end
    y = y';
end