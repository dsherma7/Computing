function print_gif(filename,v0,dt,m,i)
    title(strjoin({'V_o=',num2str(v0),', \Deltat=',num2str(dt),', m=',num2str(m),', i=',int2str(i)},''));
    drawnow; frame = getframe(1); im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256); 
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
end    