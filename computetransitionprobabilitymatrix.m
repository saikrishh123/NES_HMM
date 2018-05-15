function StateTransitionProbMatrix=computetransitionprobabilitymatrix(statevector)

[k indx]=clnseperate(statevector');
l=size(k);
nstates=l(1);
statelist=k(:,1);
StateTransitionProbMatrix=zeros(nstates,nstates);
sm=zeros(nstates,nstates);
l=length(statevector);

for i=1:nstates
    
    for j=1:l-1
    
   if(statevector(j)==statelist(i))
       nxtstate=statevector(j+1);
       ix=find(statelist==nxtstate);
    sm(i,ix)=sm(i,ix)+1;
   end

   
   
    end
    
end

for i=1:length(sm)
   tot=sum(sm(i,:));
   for j=1:length(sm)
      sm(i,j)=sm(i,j)/tot; 
       
   end
    
end
StateTransitionProbMatrix=sm;

end



