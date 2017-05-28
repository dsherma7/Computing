function u = FiniteDifference(n,r,f,a,b)
    h = 1/n;
    x = h*(1:n-1);    
    F = f(x)' + [a zeros(1,n-2) b]'/h^2;
    A = (1/h^2)*(toeplitz([0,-1,zeros(1,n-3)])+diag(2+h^2*r(x)));
    u = [a,F\A,b];
    
end