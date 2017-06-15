close all; clc;
% Approximates a function f by a functional basis f
% over an interval [a,b] with partition xi
f = @(x) exp(abs(sin(x)-2)).*abs(cos(x));
a=-6; b=14; h = 0.1; x=a:h:b;
plot(a:0.1:b,f(a:0.1:b),'*'); hold on;
u = zeros(length(x),1);
for i = 2:length(u)-1
    u = u + f(x(i)).*L(x,x(i-1),x(i),x(i+1))';
end  
plot(x,u);
%legend({'Pred','Act'});