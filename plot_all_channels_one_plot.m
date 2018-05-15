clear;
clc;
sampleperiod = 0.0005;

noise = dlmread('bloutooth_file_transfer.txt','\t');
numofsamples = size(noise,1);
numofchannels = size(noise,2);

t = sampleperiod:sampleperiod:(numofsamples*sampleperiod);
for i = 1:numofchannels
    legendInfo{i} = ['Channel ' num2str(i+10)];
end

for i = 1:numofchannels
    norm_noise(:,i) = tsmovavg(noise(:,i),'s',1000,1);
end

hold on;


%  for i = 1:6
%     plot(t,noise(:,i));
%  end
%   for i = 7:12
%     plot(t,noise(:,i),'--');
%   end
%  for i = 13:16
%     plot(t,noise(:,i),'-.');
%  end


for i = 1:6
     plot(t(201*2000:201.1*2000),noise(201*2000:201.1*2000,i));
end
for i = 7:12
     plot(t(201*2000:201.1*2000),noise(201*2000:201.1*2000,i),'--');
end 
 
for i = 13:16
     plot(t(201*2000:201.1*2000),noise(201*2000:201.1*2000,i),'-.');
 end


 hold off;

ylim([-90 -20]);
xlim([201 201.1]);
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

saveas(fig,'interference_scenario_all_channels.pdf');
