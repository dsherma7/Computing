function y = L(x,x1,x2,x3)
% Returns a hat function that ranges 
% from 0 at x1 to 1 at x2 to 0 at x3
%
% INPUT:
%   x: Function f(t,y):R^2->R where y'=f
%   x1: Initial y value
%   x2: Left endpoint, equal to t0
%   x3: Right endpoint, equal to t0+hn
 %
% OUTPUT:
%   y: Output y values for each y(ti)
%   t: The divided number of sub-intervals
    y = zeros(size(x));
    y(x>=x3 | x<=x1)=0;
    i = x3>=x & x>=x2;
    y(i)=(x3-x(i))/(x3-x2);
    i = x2>=x & x>=x1;
    y(i)=(x(i)-x1)/(x2-x1);    
end