function ai = a(xi,yi,L)
    f = @(x) 24*((2./x.^(13))-(1./x.^7));
    n = size(xi,1);
    ai = zeros(n,1);
    for i = 1:n
        x = xi([1:i-1,i+1:end]); y = yi([1:i-1,i+1:end]);
        sx = sign(x-xi(i)); sy = sign(y-yi(i));
        dx = [x-xi(i),sx.*(abs(x-xi(i))-L)];
        dy = [y-yi(i),sy.*(abs(y-yi(i))-L)];
        [dx,ix] = max(abs(dx),[],2);
        [dy,iy] = max(abs(dy),[],2);
        dx = sx.*(-1).^(ix).*dx;
        dy = sy.*(-1).^(iy).*dy;
        ai(i) = sum(f(abs(dx)).*dx./(dx.^2+dy.^2));
    end
end