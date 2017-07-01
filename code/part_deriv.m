%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes the x_i th    %
% partial derivative     %
% at x                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%
function d = part_deriv(F,x,i,h)
    if ~exist('h','var')
        h = 0.3;
    end
    if i == 1
        d = (F(x(1)+h,x(2))-F(x(1),x(2)))./h;
    elseif i == 2
        d = (F(x(1),x(2)+h)-F(x(1),x(2)))./h;
    else
        warning('Variable X_i Must be i=1 or i=2');
    end    
end