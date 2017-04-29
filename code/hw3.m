x0 = 4; y0 = 0; 
z0 = 0; w0 = 0.5;
tmax = 50; 
h = 0.0025;
f = @(x,y) -x./(x.^2+y.^2).^(3/2);
g = @(x,y) -y./(x.^2+y.^2).^(3/2);

% Plot First Circle for Euler's
[y,x,z,w,t] = EulersSystem(f,g,x0,y0,z0,w0,tmax,h);
figure; plot(x,y,'.');
title('Eulers, t_{max} = 50, h = 0.0025');
axis('equal');

% Plot First Circle for Runge-Kutta
h = 0.25;
[y,x,z,w,t] = EulersSystem(f,g,x0,y0,z0,w0,tmax,h);
figure; plot(x,y,'.');
title('Runge-Kutta, t_{max} = 50, h = 0.25');
axis('equal');

% Varying w0
ws = [0.6,0.6,0.8,0.4,0.2,0.2];
hs = [0.25,0.5,0.5,0.25,0.25,0.05];
ts = [50,150,200,35,30,30];
leg = {}; figure; 
for i = 1:6
    [y,x,z,w,t] = EulersSystem(f,g,x0,y0,z0,ws(i),ts(i),hs(i));
    plot(x,y,'.'); hold on;
    leg{end+1} = sprintf('w_0: %5.2f, h: %5.2f',ws(i),hs(i));
end
title('Varying w_0 Values');
axis([-15 15 -15 15]);
legend(leg); hold off;

% Small w0
ws = [0.5,0.3,0.1,0.05,0.01];
ts = [50,50,50,50,50];
leg = {}; figure; hold on;
for i = 1:6
    [~,y] = ode45(@DE,[0 ts(i)],[4 0 0 ws(i)]); 
    plot(y(:,1),y(:,3),'.');
    leg{end+1} = sprintf('w_0: %5.3f',ws(i));
end
title('ODE45, w_0 = 0.5'); legend(leg);
axis('equal'); hold off; 

function dydt = DE(t,y)
    dydt = [[y(2); -y(1)./(y(1).^2+y(3).^2).^(3/2)];
            [y(4); -y(3)./(y(1).^2+y(3).^2).^(3/2)]];
end


% Problem 15
f = @(t,y) [[-1000 1];[0 -1/10]]*y;
y = @(t) 2*exp(-t/10);
x = @(t) exp(-1000*t)*(9979/9999)+exp(-t/10)*(20/9999);
y0 = [2; 1]; tmax = 1;
hs = [0.5, 0.25, 0.1, 0.05];

leg = {}; figure;
plot(0:.1:1,y(0:.1:1),'*r'); hold on;
for h = hs
    [t,yt] = RungeKuttaSystem2(f,y0,tmax,h);
    plot(t,yt(:,2));
    leg{end+1} = sprintf('Runge-Kutta y(t), h: %5.2f',h);
end
legend(leg);
axis([0 1 1.8 2.2]);

leg = {}; figure;
plot(0:.1:1,x(0:.1:1),'*r'); hold on;
for h = hs
    [t,yt] = RungeKuttaSystem2(f,y0,tmax,h);
    plot(t,yt(:,1));
    leg{end+1} = sprintf('Runge-Kutta x(t), h: %5.2f',h);
end
legend(leg);
axis([0 1 0 1000]);


dydt = @(t,y) [-1000*y(1)+y(2), -1/10*y(2)];
[t,yt] = ode23(dydt,[0 1], [1 2]);
