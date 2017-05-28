function x = TriDiag(a,b,c)
    n = size(a,1);
    x = zeros(n);
    for i = 1:n
        for j = 1:n
            if i==j+1
                x(i,j) = c(j);
            elseif i==j-1
                x(i,j) = a(j);
            elseif i==j
                x(i,j) = b(j);
            end
        end
    end
end