function lst= getActiveNodes(Node)
p=0;

for i=1:length(Node)
    if(Node(i).Active==1)
        p=p+1;
        lst(p)=i;
    end
    
end

end