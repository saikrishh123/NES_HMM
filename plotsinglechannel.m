function plotsinglechannel(channelnum,tstart,tend,data)
sampleperiod = 0.0005;

% noise = dlmread('bloutooth_file_transfer.txt','\t');
noise=data;
noise=noise(:,channelnum-10);
numofsamples = size(noise,1);
numofchannels =length(channelnum);
t = sampleperiod:sampleperiod:(numofsamples*sampleperiod);
for i = 1:numofchannels
    legendInfo{i} = ['Channel ' num2str(channelnum(i))];
end

for i = 1:numofchannels
    norm_noise(:,i) = tsmovavg(noise(:,i),'s',100,1);
end
cla;
hold on;
for i=1:length(channelnum)
plot(t(tstart*2000:tend*2000),noise(tstart*2000:tend*2000,i));
end
 hold off;

ylim([-90 -20]);
xlim([tstart tend]);
ylabel('Signal power (dBm)');
xlabel('Time(sec.)');
set(gca,'FontSize',14);
set(gca, 'FontName','Arial');
fig = gcf;
fig.Color = 'white';
fig.InvertHardcopy = 'off';
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 9 5];
fig.PaperSize= [9 	5];
fig.PaperPositionMode = 'manual';

legend(legendInfo,'FontSize',14,'Location','northeastoutside');


