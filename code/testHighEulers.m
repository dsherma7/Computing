f   = @(t,y) (2./t).*y+t.^2.*exp(t);
df  = @(t,y) 2*y./t+4*t.*exp(t)+t.^2*exp(t);
d2f = @(t,y) -4./t.^2*(y./t+1)+2*(t+1).*exp(1);
y = @(t) t.^2.*(exp(t)-exp(1));
a = 1; b = 2; n = 10;
y0 = y(a);
[yt1,t1] = Eulers(f,y0,a,b,n);
[yt2,t2] = Eulers4(f,df,d2f,y0,a,b,n);