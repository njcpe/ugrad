figure('menubar','none','color','k')
h = plot(sin(sqrt(2)*0+sqrt(3)),cos(sqrt(5)*0),'r.','MarkerSize',20);
xlim([-1 1])
ylim([-1 1])
axis off
for t=0.01:.01:100
    set(h,'xdata',sin(sqrt(2)*t+sqrt(3)),...
        'ydata',cos(sqrt(5)*t))
    drawnow
end