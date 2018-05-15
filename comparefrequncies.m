function [C1,lag1]=comparefrequncies(d1,d2,Fs,i)
NodePos=[3;0;0];
output1= dataanalyze(d1,NodePos);
output2= dataanalyze(d2,NodePos);




[C1,lag1] = xcorr(d1(i,:),d2(i,:));

plot(lag1/Fs,C1,'k')
ylabel('Amplitude')
grid on
title('Cross-correlation between Template 1 and Signal')




% for i=1:6
% [Cxy,f] = mscohere(output1(i,:),output2(i,:),[],[],[],Fs);
% 
% thresh = 0.75;
% [pks,locs] = findpeaks(Cxy,'MinPeakHeight',thresh);
% MatchingFreqs = f(locs);
% 
% disp('Matching Frequencies:');disp(i);,disp(MatchingFreqs);
% 
% 
% 
% 
% end

end