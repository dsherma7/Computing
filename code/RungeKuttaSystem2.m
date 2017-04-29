% Impliments Runge-Kutta     %
% for approximating an IVP   %
% z' = f(x,y), x' = z(t)     %
% w' = g(x,y), y' = w(t)     %
% across n intervals for     %
% t in [a,b]			     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [t,y] = RungeKuttaSystem2(f,y0,tmax,h)    
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