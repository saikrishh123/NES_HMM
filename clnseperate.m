function [k indx]=clnseperate(dat)

l=size(dat);

for i=1:l(1)
     s=0;
    if(i==1)
        
        k(i,1)=dat(i);
        k(i,2)=1;
        
        indx(i,1)=1;
    else
        
       z=size(k);
       
       for j=1:z(1)
          
          if(k(j,1)==dat(i))
              
              k(j,2)=k(j,2)+1;
              
          m=size(indx(j,:));
          indx(j,m(2)+1)=i;
              s=1;
              
          end
          
       end
          
          if(s==0)
              k(j+1,1)=dat(i);
              k(j+1,2)=1;
              indx(j+1,1)=i;
              
          end
         
              
      
        
    end
        
    
end


end