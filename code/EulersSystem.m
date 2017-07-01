%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Impliments Eulers Method for approximating an IVP   %
% z' = f(x,y), x' = z(t) w' = g(x,y), y' = w(t)       %     
% across n intervals for t in [a,b]                   %			     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x,z,w,t] = EulersSystem(f,g,x0,y0,z0,w0,tmax,h)    
    n = tmax/h;
    z = ones(1,n+1).*z0; 
    x = ones(1,n+1).*x0;
    w = ones(1,n+1).*w0;
    y = ones(1,n+1).*y0;
    t = (0:n)*h; 
    for k = 1:n               
        z(k+1) = z(k) + h*f(x(k),y(k));
        x(k+1) = x(k) + h*z(k);
        w(k+1) = w(k) + h*g(x(k),y(k));
        y(k+1) = y(k) + h*w(k);
    end
end