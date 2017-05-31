function [y,fs] = f(x,fs,j)
    y = [fs(j,1:j-1)';24*((2./x(j:end).^(13))-(1./x(j:end).^7))];
    fs(:,j) = [y(1:j-1);0;y(j:end)];
end