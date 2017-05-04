% Starting Functions
ns = 25;

f = @(t,y) -10*y+10*t+1;
y = @(t) exp(-10*t+1)+t; 
a = 0; b = 1; n = 10;

f = @(t,y) -20*y+20*sin(t)+cos(t);
y = @(t) sin(t) + exp(-20*t); 
a = 0; b = 2; n = 8;

[y1,~] = Eulers(f,y(a),a,b,n);
[y2,t] = RungeKutta(f,y(a),a,b,n);
[y3,t2] = Eulers(f,y(a),a,b,n*2);

plot(t,y(t),'*'); hold on;
plot(t,y1); plot(t,y2,'g'); plot(t2,y3,'-.');
%legend({'Actual','Eulers','RungeKutta'},'FontSize',14)
legend({'Actual','Eulers','RungeKutta','h=0.125'},'FontSize',14)
xlabel('t','Fontsize',18); ylabel('y(t)','Fontsize',18)
title('Different Methods with h=0.1','Fontsize',18)



figure;
err1 = RunAllMethods(f,y,a,b,ns,'dy/dt=-20y+20 sin t');

f = @(t,y) 2*t.^2.*y; 
y = @(t) 2*exp(2*t.^3/3); 
a = 0; b = 3; 
figure;
err2 = RunAllMethods(f,y,a,b,ns,'dy/dt=2t^2y');

f = @(t,y) y.^t; 
y = @(t) (10 - t.*(t - 1)).^(1./(-t + 1)); 
a = -2; b = 0; 
figure;
err3 = RunAllMethods(f,y,a,b,ns,'dy/dt=y^t');

f = @(t,y) t.*y.^2; 
y = @(t) 2./(3-t.^2); 
a = -1; b = 1.5; 
figure;
err4 = RunAllMethods(f,y,a,b,ns,'dy/dt=ty^2');


% Comparing h values
ns = 10:2:40;
f = @(t,y) t.*y.^2; 
y = @(t) 2./(3-t.^2); 
a = -1; b = 1.5; 
figure;
err_compare = RunAllMethods(f,y,a,b,ns,'for comparing');

