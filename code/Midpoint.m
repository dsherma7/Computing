function [y,t] = Midpoint(f,y0,a,b,n)
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