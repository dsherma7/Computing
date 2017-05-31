function plot_points(xi,yi,vxi,vyi,axi,ayi,L)
    h(1)=plot(xi,yi,'*b'); hold on; axis([0, L, 0, L]);
    h(2)=plot(xi,yi,'ok','MarkerSize',12,'LineWidth',2);
    h(3)=plot(xi,yi,'oy','MarkerSize',12);       
    h(4)=quiver(xi,yi,vxi,vyi,.5,'Color','g');
    h(5)=quiver(xi,yi,axi,ayi,.25,'Color','r');
    text(xi,yi*1.1,cellstr(int2str([1:length(xi)]')),'FontSize',14)
    lgd = legend(h([1,4,5]),'x_i','v_i','a_i');
    lgd.Box = 'off';
    lgd.Location = 'southoutside';
    lgd.Orientation = 'horizontal';        
end