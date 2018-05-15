function data=generate_interferance(time,category,windowsize,n)
samplerate=0.0005;
no_of_samples=time/samplerate;

if nargin<2
category=2;
end
    
    
if(category==1)
refdata=dlmread('bluetooth_mp3_transfer.txt','\t');

end
if(category==2)
refdata=dlmread('bloutooth_file_transfer.txt','\t');
end
if(category==3)
refdata=dlmread('wifi_2.txt','\t');
end



refdata=refdata';
refdata=generatehmmnoise(refdata,time,windowsize,n);

k=round(rand*16);
refrotated=circshift(refdata,k);
k=round(rand*no_of_samples);

refrotated=circshift(refrotated,k,2);
refdata=refrotated;






% k=round(rand*no_of_samples);
% refrotated=circshift(refdata,k,2);


data=refdata;
data=data';

end

