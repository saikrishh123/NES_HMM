function output= dataanalyzenet(noise)
% This script uses gathered interference samples to analyze the quality of channels and 
% PER of the TSCH protocol.
%

clc

%% parameters
sequence_list = [11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
seq_list_size = 16;
channel_offset = 0;
Trans_power = [4,0]; %dBm
packet_length = 133; %packet length in Bytes

%% Free path loss model
%alpha is the path loss exponent
alpha = [2.5,3.0,3.5];
%sigma is standard deviation of X_g in dB
sigma = 3.0;
%position of nodes
%node1 = [0; 0; 0];
%[tgtrng,~] = rangeangle(node1,node2);
% Determine the wavelength for 2.45 GHz
%lambda = physconst('LightSpeed')/2.45e9;
%the Loss can be extracted directly by "fspl(tgtrng,lambda);"
%here we use the path loss model equation
%Loss = pow2db((4*pi*tgtrng/lambda)^alpha);
%beta = 10* log10(4*pi*tgtrng/lambda);
%Loss = alpha * beta;%40.2 + alpha*10*log10(tgtrng);%
%X_g is a normal (or Gaussian) random variable with zero mean, reflecting the attenuation (in decibel) caused by flat fading
X_g = 0;

%% BER vs Eb/N0 
%results extracted using #bertool
%Eb/N0 --> -5:15
BER = dlmread('BER_to_EbN0.txt','\t');

%% packet length in 500 us slots
packet_length = floor(packet_length *32 / 500);

%%

noise = noise';
numofsamples = size(noise,2);

for scenario_power = 1:2
for scenario_alpha = 1:3 
num_packets = 0;
PRR_Pro_sum = 0;
for i = 1:20:numofsamples
    %compute the operating channel
    ASN = floor(i/20);
    %Eb/N0 (dB) = Ps(dB) - Pn(dB) + X_g + 10 log10 (BW/R) =  Ps(dB) - Pn(dB) + X_g + 10((log10(2000/250)) == 0.9031)
    channel = sequence_list(mod( ASN + channel_offset, seq_list_size) + 1) - 10;
    %find the PR_probability
    PR_probability = 1;
    X_g = 0;% normrnd(0,sigma);
    for j = i+4:i+3+packet_length
        %log normal path loss
        P_signal = Trans_power(scenario_power) + X_g;
        EbN0 = P_signal - noise(channel,j) + 9.031;
        if(EbN0 > 15)
            BE_probability = 0;
        elseif (EbN0 <0)
            BE_probability = 1;
        else 
            BE_probability = BER(floor(EbN0)+1);
        end
        if (j == i+3+packet_length) 
             PR_probability = PR_probability * ((1-BE_probability)^64);
        else
            PR_probability = PR_probability * ((1-BE_probability)^125);
        end
    end
    PRR_Pro_sum = PRR_Pro_sum + PR_probability;
    num_packets = num_packets + 1;
    PRR_array(num_packets) = PR_probability;
end

PRR(scenario_power,scenario_alpha) = (PRR_Pro_sum / num_packets)*100;
output((scenario_power-1)*3+scenario_alpha,:) = 100* tsmovavg(PRR_array','s',200,1);
end
end

t = 0.01:0.01:num_packets/100;
cla;
p=plot(t,output(1,:),'k-',t,output(2,:),'g-',t,output(3,:),'c-',t,output(4,:),'m-.',t,output(5,:),'r-.',t,output(6,:),'b-.');
p(1).LineWidth = 1.4;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
p(4).LineWidth = 2;
p(5).LineWidth = 2;
p(6).LineWidth = 2;
ylim([0,100]);
xlim([0,300]);

ylabel('PRP%');
xlabel('Time [sec.]');
set(gca,'FontSize',20);
set(gca, 'FontName','Arial');
fig = gcf;
fig.Color = 'white';
fig.InvertHardcopy = 'off';
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 9 5];
fig.PaperSize= [9 	5];
fig.PaperPositionMode = 'manual';
box off
legend({'P_{tx}=4, \alpha =2.5','P_{tx}=4, \alpha =3.0', 'P_{tx}=4, \alpha =3.5', 'P_{tx}=0, \alpha =2.5', 'P_{tx}=0, \alpha =3.0', 'P_{tx}=0, \alpha =3.5'},'FontSize',20,'Location','southeast','Orientation','vertical');


%clearvars output PRR_array t Trans_power sigma X_g node1 node2 beta BER alpha PR_probability j lambda P_signal tgtrng EbN0  BE_probability PRR_Pro_sum noise_tsreshold File sequence_list seq_list_size channel_offset noise numofsamples i ASN channle max_noise channel ;
