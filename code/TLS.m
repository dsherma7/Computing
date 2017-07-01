%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perform TLS Regression %
% on the points T & Z    %
% using Newton's Method  %
% for optimization       %
%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x] = TLS(T,Z)    
    tf = @(t,z,x1,x2) (t+z.*x2-x1.*x2)./(1+x2.^2);
    dFx = @(x1,x2) -2*sum((T-tf(T,Z,x1,x2)).*(x2./(1+x2.^2))+(Z-x1-x2.*tf(T,Z,x1,x2)));
    dFy = @(x1,x2) -2*sum((T-tf(T,Z,x1,x2)).*((Z-x1).*(1+x2.^2)-2*x2.*(T+Z.*x2-x1.*x2)) ...
            ./(1+x2.^2).^2 +tf(T,Z,x1,x2).*(Z-x1-x2.*tf(T,Z,x1,x2)));
    dF = @(x1,x2) [dFx(x1,x2);dFy(x1,x2)];
    d2F = @(x1,x2) [[diff(dFx,[x1;x2],1) diff(dFy,[x1;x2],1)];
                    [diff(dFx,[x1;x2],2) diff(dFy,[x1;x2],2)]];
    
    x = Newtons(dF,d2F,[0,0]);     
end