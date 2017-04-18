function [y,t] = Eulers(f,y0,a,b,n)
    sprintf('f=%d, y0=%d, a=%d, b=%d, n=%d\n',0,y0,a,b,n);
    h = (b-a)/n;
    y = ones(1,n+1).*y0; 
    t = a+(0:n)*h; 
    for k = 1:n
        y(k+1) = y(k) + h*f(t(k),y(k));
    end
end