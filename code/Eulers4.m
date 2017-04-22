%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Impliments a 4th order 	 %
% Eulers Method for          %
% approximating an IVP       %
% y' = f(t,y(t)), y(a)=y0    %
% across n intervals for     %
% t in [a,b]			     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,t] = Eulers4(f,df,d2f,y0,a,b,n)    
    h = (b-a)/n;
    y = ones(1,n+1).*y0; 
    t = a+(0:n)*h; 
    for k = 1:n
        y(k+1) = y(k) + h*f(t(k),y(k))+(h.^2/2).*df(t(k),y(k))+(h.^3/6).*d2f(t(k),y(k));
    end
end