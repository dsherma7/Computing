function y = L(x,x1,x2,x3)
    y = zeros(size(x));
    y(x>=x3 | x<=x1)=0;
    i = x3>=x & x>=x2;
    y(i)=(x3-x(i))/(x3-x2);
    i = x2>=x & x>=x1;
    y(i)=(x(i)-x1)/(x2-x1);    
end