function plot_points(xi,yi,vxi,vyi,axi,ayi,L)
    plot(xi,yi,'*b'); hold on; axis([0, L, 0, L]);
    plot(xi,yi,'ok','MarkerSize',12,'LineWidth',2)
    plot(xi,yi,'oy','MarkerSize',12)       
    quiver(xi,yi,vxi,vyi,.5,'Color','g')
    quiver(xi,yi,axi,ayi,.25,'Color','r')
    text(xi,yi*1.1,cellstr(int2str([1:length(xi)]')),'FontSize',14)
    
end