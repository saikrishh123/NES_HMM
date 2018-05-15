function NetNoise= calculatenetpower(Node)
lst= getActiveNodes(Node);

l=size(Node(lst(1)).RelativeNoise);
p=zeros(l);

    for k=1:length(lst)

    for i=1:l(1)
        
        
    for j=1:l(2)
       
        
    
        p(i,j)=p(i,j)+10^(Node(k).RelativeNoise(i,j)/10);
     
       
    end
    end
    
    end
    
    
    for i=1:l(1)
        
        for j=1:l(2)
            
             p(i,j)=10*log10(p(i,j));
        end
    end
    
    
    for i=1:l(1)
        
        for j=1:l(2)
            
             if(p(i,j)<-90)
                 p(i,j)=-90;
             end
        end
    end
    
    
    
    
 
    NetNoise=p;
end
    
    
    
    
   
  