function NoiseNet= computePathLossOfNoiseSignal(Noise,NoisePower,InitialPositionNode,VehicleCordinates,alpha,RelativeVelocity,samplerate)
l=size(Noise);
CurrentPositionNode=InitialPositionNode;

lambda = physconst('LightSpeed')/2.45e9;

X_g=0;

for i=1:l(2)
[tgtrng,~] = rangeangle(CurrentPositionNode',VehicleCordinates');
beta = 10* log10(4*pi*tgtrng/lambda);
Loss = alpha * beta;
    
NoiseNet(:,i) = NoisePower+Noise(:,i) - Loss*ones(size(Noise(:,i))) + X_g;

CurrentPositionNode=CurrentPositionNode+samplerate*RelativeVelocity;



end
