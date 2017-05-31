function u = DiffEquations(r,p,q,f,h)
    xi = 0:h:120;
    ri = r(xi,h);
    pi = p(xi,h);
    qi = q(xi,h);
    fi = f(xi);
    A = (1/h^2)*TriDiag(pi',ri',qi'); 
    %fi(1) = fi(1)-(1/h^2)*qi(1);
    u = A\fi';
end