function indx=findindex(str,strdat)
l=size(strdat);
indx=-1;
p=0;
for i=1:l(1)
   if(strcmp(str,strdat{i}) )
       p=p+1;
    indx(p)=i;
   end
   
    
end