function err = RunAllMethods(f,y,a,b,ns,all_title)
    
    % Eulers Method
    subplot(1,4,1); 
    plot(a:.1:b,y(a:.1:b),'*'); hold on;
    EulerErr = RunMethod(@Eulers,y,f,a,b,ns,'Eulers Method');

    % Midpoint Method
    subplot(1,4,2); plot(a:.1:b,y(a:.1:b),'*'); hold on;
    MidpointErr = RunMethod(@Midpoint,y,f,a,b,ns,'Midpoint Method');

    % Heuns Method
    subplot(1,4,3); plot(a:.1:b,y(a:.1:b),'*'); hold on;
    HeunsErr = RunMethod(@Heuns,y,f,a,b,ns,'Heuns Method');

    % Plot Error
    subplot(1,4,4); plot(ns,[EulerErr;MidpointErr;HeunsErr]); hold on; 
    c = max(max([EulerErr;MidpointErr;HeunsErr]))/max(1./ns.^2);
    plot(ns,c.*[1./ns.^2;1./ns.^3],'-.'); 
    h = get(gca,'Children'); legend(h,{'O(h^3)','O(h^2)','Heuns','Midpoint','Eulers'});
    xlabel('n'); ylabel('Mean Error'); title('Method Error');
    err = [EulerErr;MidpointErr;HeunsErr];
    suptitle(all_title);
end