% Starting Functions
ns = 10:20:120;

f = @(t,y) 2*y./t; 
y = @(t) 3*t.^2; 
a = -1; b = -0.1; 
figure;
err1 = RunAllMethods(f,y,a,b,ns,'dy/dt=2y/t');

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

