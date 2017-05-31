function ai = a(xi,yi,L)
    n = size(xi,1);
    ai = zeros(n,1);
    fs = zeros(n,n);
    for j = 1:n
        x = xi([1:j-1,j+1:end]); y = yi([1:j-1,j+1:end]);
        sx = sign(x-xi(j)); sy = sign(y-yi(j));
        dx = [x-xi(j),sx.*(abs(x-xi(j))-L)];
        dy = [y-yi(j),sy.*(abs(y-yi(j))-L)];
        [dx,ix] = max(abs(dx),[],2);
        [dy,iy] = max(abs(dy),[],2);
        dx = sx.*(-1).^(ix).*dx;
        dy = sy.*(-1).^(iy).*dy;            
        [fi,fs] = f(abs(dx),fs,j);
        ai(j) = sum(fi.*dx./(dx.^2+dy.^2));        
    end
end