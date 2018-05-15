function hmmnoise=generatehmmnoise(noisesample,time,windowsize,n)
nsample=time*2000/windowsize;

[statevector statedat mx mn]=computeavg(noisesample,windowsize,n);
StateTransitionProbMatrix=computetransitionprobabilitymatrixstr(statevector);
ln=length(StateTransitionProbMatrix)
[seq,states] = hmmgenerate(nsample,StateTransitionProbMatrix,ones(length(StateTransitionProbMatrix),1));
k=clnseperatestring(statevector');

l=size(k);
l=1:l(1);
tm=l';
%translationmatrix=[l' k(:,1)];



p=1;


for i=1:length(states)
    m=find(states(i)==tm);
    ix=findindex(k(m),statevector');
    
    l=length(m);
    x=round(rand*l);
    if(x==0)
        x=1;
    end
    indx=m(x);
    
    
    hmmnoise(:,p:p+windowsize-1)=noisesample(:,windowsize*(indx-1)+1:windowsize*(indx-1)+windowsize);
    p=p+windowsize;

end