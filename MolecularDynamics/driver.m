close all; clc;
% Constants
sig = 1;      % Bohr radius
m   = 10e-5;  % mass of atoms
N   = 20;     % Number of atoms
dt  = 0.01;   % time increments
L   = 5;      % edge length
v0  = 20;     % initial velocity
T   = 10;     % Time intervals

% Initalize the system
vx = zeros(N,T+1);  vx(:,1) = rand(N,1)*v0;
vy = zeros(N,T+1);  vy(:,1) = rand(N,1)*v0;
 x = zeros(N,T+1);   x(:,1) = rand(N,1)*L;
 y = zeros(N,T+1);   y(:,1) = rand(N,1)*L;
x(:,2) = x(:,1)+vx(:,1)*dt; 
y(:,2) = y(:,1)+vy(:,1)*dt; 

ax = zeros(N,T+1); ay = zeros(N,T+1);
ax(:,1) = a(x(:,1),y(:,1),L)*dt^2/m; 
ax(:,2) = a(x(:,2),y(:,2),L)*dt^2/m;
ay(:,1) = a(y(:,1),x(:,1),L)*dt^2/m; 
ay(:,2) = a(y(:,2),x(:,2),L)*dt^2/m;

% increment system
%filename = 'v020dt01m00001N20.gif'; 
filename = 'test.gif'; 

plot_points(x(:,1),y(:,1),vx(:,1),vy(:,1),ax(:,1),ay(:,1),L);
print_gif(filename,v0,dt,m,1);
for i = 2:T
    close;
    x(:,i+1) = mod(2*x(:,i)-x(:,i-1)+ax(:,i),L);
    y(:,i+1) = mod(2*y(:,i)-y(:,i-1)+ay(:,i),L);
    vx(:,i) = (x(:,i+1)-x(:,i))/dt;
    vy(:,i) = (y(:,i+1)-y(:,i))/dt;
    ax(:,i+1) = a(x(:,i+1),y(:,i+1),L)*dt^2/m;
    ay(:,i+1) = a(y(:,i+1),x(:,i+1),L)*dt^2/m;
    
    plot_points(x(:,i),y(:,i),vx(:,i),vy(:,i),ax(:,i),ay(:,i),L);    
    print_gif(filename,v0,dt,m,i);
end

% Compare against known results
close;
C=max(max(vx))/2; m=.06;             
KbT = (m/2)*mean(mean(vx).^2+mean(vy).^2);
P = @(v) C*v.^2/KbT.*exp(-m*v.^2/2*KbT);
x_=(vx - mean(vx))./sqrt(var(vx));
y_=(vy - mean(vy))./sqrt(var(vy));
z = x_.^2+y_.^2; 
hist(z,10,'*'); hold on;
plot(min(z(:)):.1:max(z(:)),P(min(z(:)):.1:max(z(:))),'--r','LineWidth',4);
