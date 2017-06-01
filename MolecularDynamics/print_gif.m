function print_gif(filename,v0,dt,m,i)
% Prints the current frame to a .gif file specified in filename.
%
% INPUT:
%   filename: The path where the gif should be written
%   v0,dt,m: Parameter values for image title
%   i: ith slide of the .gif file

    title(strjoin({'V_o=',num2str(v0),', \Deltat=',num2str(dt),...
                   ', m=',num2str(m),', i=',int2str(i)},''));
    drawnow; frame = getframe(1); im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256); 
    if (i==1) imwrite(imind,cm,filename,'gif', 'Loopcount',inf);         % Initialize .gif
    else      imwrite(imind,cm,filename,'gif', 'WriteMode','append');end % Add slides
end    