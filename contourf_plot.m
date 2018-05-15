%% this script create a color plot based on the ED values (it is better to use it to plot Wi-Fi interference) 
clc;
clear;
sampleperiod = 0.0005;
noise = dlmread('highway.txt','\t');
numofsamples = size(noise,1);
numofchannels = size(noise,2);

noise = noise';
window = 2000;
for j = 1:numofchannels
    cqe(j,1:window) = noise(j,1:window);
    for i = window+1:numofsamples,
         cqe(j,i) = max(noise(j,i-window:i)); 
    end
end

t = sampleperiod:sampleperiod:(numofsamples*sampleperiod);
ch= [11:26];

h=figure;
hold on;
contourf(t,ch,cqe,5);
caxis([-90, -20]);
xlim([0,300]);
c = colorbar;
ylabel(c,{'Maximum interference power','in one second (dBm)'});
colormap(flipud(gray));
hold off;
%ylim([11 26]);
ylabel('802.15.4 channel');
xlabel('Time (sec.)');
set(gca,'FontSize',25);
set(gca, 'FontName','Arial');
fig = gcf;
fig.Color = 'white';
fig.InvertHardcopy = 'off';
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 30 10];
fig.PaperSize= [30 10];
fig.PaperPositionMode = 'manual';

print(fig,'-dpdf','interference_scenario_colorplot.pdf', '-opengl')
