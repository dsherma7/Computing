function [y,t] = Heuns(f,y0,a,b,n)
    h = (b-a)/n;
    y = ones(1,n+1).*y0; 
    t = a+(0:n)*h; 
    for k = 1:n
        y(k+1) = y(k) + h*f(t(k),y(k));
        y(k+1) = y(k) + h/2*(f(t(k),y(k))+f(t(k+1),y(k+1)));
    end
end