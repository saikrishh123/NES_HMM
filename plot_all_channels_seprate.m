clc;
clear;
sampleperiod = 0.0005;

noise = dlmread('interference_scenario.txt','\t');
numofsamples = size(noise,1);
numofchannels = size(noise,2);

t = sampleperiod:sampleperiod:(numofsamples*sampleperiod);

for i = 1:numofchannels
    norm_noise(:,i) = tsmovavg(noise(:,i),'s',2000,1);
end

figure;
hold on;
for i = 1:numofchannels
    subplot(numofchannels,1,i);
    plot(t,noise(:,i));
    ylabel(strcat('Ch.',num2str(i+10)));
    ylim([-90 -30]);
end
hold off;


