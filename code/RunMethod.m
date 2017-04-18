function err = RunMethod(meth,y,f,a,b,ns,plt_title)
    y0 = y(a);
    leg = {'y(t)'};
    err = [];
    for n = ns
        [yt,t] = meth(f,y0,a,b,n);
        plot(t,yt);
        leg{end+1} = sprintf('h=%d',round((b-a)/n,4));
        err = [err;sum(abs(y(t)-yt))/length(t)];
    end
    xlabel('t'); ylabel('y(t)'); title(plt_title);
    err = err';
end