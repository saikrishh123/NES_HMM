function plotperiodogram(sig1,sig2,i)
NodePos=[3;0;0];
output1= dataanalyze(sig1,NodePos);
output2= dataanalyze(sig2,NodePos);
sig1=output1(i,:);
sig2=output2(i,:);
Fs=2000;
[P1,f1] = periodogram(sig1,[],[],Fs,'power');
[P2,f2] = periodogram(sig2,[],[],Fs,'power');

subplot(2,1,1)
plot(f1,P1,'k')
grid
ylabel('P_1')
title('Power Spectrum')

subplot(2,1,2)
plot(f2,P2,'r')
grid
ylabel('P_2')
xlabel('Frequency (Hz)')
end