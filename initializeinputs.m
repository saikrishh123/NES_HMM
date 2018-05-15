function initializeinputs
CT=ConfigureTime;
        
        for i=1:30
        Node(i)=ConfigureNodes;
        end
        
         assignin('base','CT',CT);
          assignin('base','Node',Node);
        
        

end