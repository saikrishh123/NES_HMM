function [k  p indx]=clnseperatestring(strdat)

l=size(strdat);

for i=1:l(1)
     s=0;
    if(i==1)
        
        k{i}=strdat{i};
        p(i)=1;
        
        indx(i,1)=1;
    else
        
       z=size(k);
       
       for j=1:z(2)
          
          if(strcmp(k{j},strdat{i}))
              
              p(j)=p(j)+1;
              
          m=size(indx(j,:));
          indx(j,m(2)+1)=i;
              s=1;
              
          end
          
       end
          
          if(s==0)
              k{j+1}=strdat{i};
              p(j+1)=1;
              indx(j+1,1)=i;
              
          end
         
              
      
        
    end
        
    
end


k=k';
p=p';
end