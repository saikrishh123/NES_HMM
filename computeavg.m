function [statevector statedat mx mn]=computeavg(data,windowsize,n)
l=size(data);
p=0;
for i=1:l(1)
    p=0;
      for k=1:windowsize:l(2)
        p=p+1;
    avgdat(i,p)=0;
  
    for j=k:k+windowsize-1
        avgdat(i,p)=avgdat(i,p)+data(i,j);
       
    end
     avgdat(i,p)=avgdat(i,p)/windowsize;
    end

end

for i=1:l(1)
    mx(i)=max(avgdat(i,:));
    mn(i)=min(avgdat(i,:));
end

mxx=max(mx);
mnn=min(mn);
l=size(avgdat);
for i=1:l(1)
    for j=1:l(2)
        
        statedat(i,j)=divideNlevel(avgdat(i,j),mxx,mnn,n);
               
    end
            
end


for i=1:l(2)
   statevector{i}=computehashstring(statedat(:,i)');
end




end