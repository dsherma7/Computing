
f = @(t,y) -y+t+1;
y = @(t) exp(-t)+t;
a = 0; b = 5; 
y0 = y(a); ns = [25,50,100];

% Eulers Method
%subplot(1,4,1); 
plot(a:.1:b,y(a:.1:b),'*'); hold on;
leg = {'y(t)'};
for n = ns
    [yt,t] = Eulers(f,y0,a,b,n);
    plot(t,yt);
    leg{end+1} = sprintf('h=%d',round((b-a)/n,4));
end
title('Eulers Method')

% Midpoint Method
subplot(1,4,2); plot(a:.1:b,y(a:.1:b),'*'); hold on;
leg = {'y(t)'};
for n = ns
    [yt,t] = Midpoint(f,y0,a,b,n);
    plot(t,yt);
    leg{end+1} = sprintf('h=%d',round((b-a)/n,4));
end
title('Midpoint Method')

% Heuns Method
subplot(1,4,3); plot(a:.1:b,y(a:.1:b),'*'); hold on;
leg = {'y(t)'};
for n = ns
    [yt,t] = Midpoint(f,y0,a,b,n);
    plot(t,yt);
    leg{end+1} = sprintf('h=%d',round((b-a)/n,4));
end
title('Heuns Method')

h = get(gca,'Children');
legend(h,leg(end:-1:1));