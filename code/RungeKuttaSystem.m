% Impliments Runge-Kutta     %
% for approximating an IVP   %
% z' = f(x,y), x' = z(t)     %
% w' = g(x,y), y' = w(t)     %
% across n intervals for     %
% t in [a,b]			     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x,z,w,t] = RungeKuttaSystem(f,g,x0,y0,z0,w0,tmax,h)    
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