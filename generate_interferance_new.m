function data=generate_interferance_new(time,category)
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
l=size(refdata);
ns=l(2);
nc=l(1);
tr=ns*0.0005;
tr=floor(tr);
flg=-1;
for i=1:tr
    
    k=round(rand*(tr-1));
    
        
        if(flg==-1)
   data= refdata(:,k*2000:(k+1)*2000);
   flg=0;
        else
            data= [data refdata(:,k*2000+1:(k+1)*2000)];
        end
        
   
    
end

refdata=data;

refconstant=refdata(1:3,1:no_of_samples);
refdata=refdata(4:end,1:no_of_samples);

k=round(rand*13);
refrotated=circshift(refdata,k);
k=round(rand*no_of_samples);
refrotated=circshift(refrotated,k,2);


data=[refconstant;refrotated];
data=data';
%plotcontour(data);

end

