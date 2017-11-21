function [y,x,z,w,t] = RungeKuttaSystem(f,g,x0,y0,z0,w0,tmax,h)
% Impliments Runge Kutta Method for approximating 
% an system of IVPs of the form 
%      z' = f(x,y), x' = z(t)
%      w' = g(x,y), y' = w(t)
% across n intervals for t in [a,b]
% 
% INPUT:
%   f: Function f(x,y):R^2->R where z'=f
%   g: Function g(x,y):R^2->R where w'=g
%   y0,x0,z0,w0: Initial values for x,y,z,w
%   tmax: max t value 
%   h: h=1/n is the size of the sub-intervals
%
% OUTPUT:
%   y: Output y values for each y(ti)
%   x: Output x values for each x(ti)
%   z: Output z values for each x,y pair
%   w: Output w values for each x,y pair
%   t: The divided number of sub-intervals

    n = tmax/h;
    z = ones(1,n+1).*z0; 
    x = ones(1,n+1).*x0;
    w = ones(1,n+1).*w0;
    y = ones(1,n+1).*y0;
    t = (0:n)*h; 
    for k = 1:n
        q1 = f(x(k),y(k));            q2 = f(x(k)+h/2,y(k)+h/2*q1);
        q3 = f(x(k)+h/2,y(k)+h/2*q2); q4 = f(x(k)+h,y(k)+h*q3);
        z(k+1) = z(k)+h/6*(q1+2*q2+2*q3+q4);
        x(k+1) = x(k) + h*z(k);
        
        q1 = g(x(k),y(k));            q2 = g(x(k)+h/2,y(k)+h/2*q1);
        q3 = g(x(k)+h/2,y(k)+h/2*q2); q4 = g(x(k)+h,y(k)+h*q3);
        w(k+1) = w(k)+h/6*(q1+2*q2+2*q3+q4);
        y(k+1) = y(k) + h*w(k);        
    end
end