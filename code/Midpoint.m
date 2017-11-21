function [y,t] = Midpoint(f,y0,a,b,n)
% Impliments the Midpoint Method for approximating 
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
    y = ones(1,2*n+1).*y0; 
    t = a+(0:2*n)*h/2; 
    for k = 2:2:2*n
        y(k)   = y(k-1) + h/2*f(t(k-1),y(k-1));
        y(k+1) = y(k-1) + h*f(t(k),y(k));
    end
    y = y(1:2:length(y));
    t = t(1:2:length(t));
end