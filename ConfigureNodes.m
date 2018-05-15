classdef ConfigureNodes
   properties
     Noise;
     NoisePower;
     NoiseCategory;
     IntialPosition;
     RelativeVelocity;
     RelativeNoise;
     pathlosscoefficient;
     WindowSize;
     No_Of_Levels;
     Active;
     
     
   end
   methods
      function c = ConfigureNodes
         c.Noise=0;
         c.NoisePower=0;
         c.NoiseCategory=2;
         c.IntialPosition=[3 5 0];
         c.RelativeVelocity=[10 0 0];
         c.RelativeNoise=0;
         c.pathlosscoefficient=2;
         c.WindowSize=1000;
         c.No_Of_Levels=10;
         c.Active=0;
         
         
      end
    
     
      
      function plotContour(k,noisetype)
          
           if nargin<2
              noisetype=1;
          end
          if(noisetype==1)
          plotcontour(k.Noise);
          else
              
              plotcontour(k.RelativeNoise);
             
          end
      end
      
    
      
      function plotchannel(k,channelnum,tstart,tend,noisetype)
          
          if nargin<5
              noisetype=1;
          end
          if(noisetype==1)
          plotsinglechannel(channelnum,tstart,tend,k.Noise);
          else
           plotsinglechannel(channelnum,tstart,tend,k.RelativeNoise);
          end
      
      end
      
      
      
      
      
       function plotchannelmovavg(k,channelnum,tstart,tend,noisetype)
          
          if nargin<5
              noisetype=1;
          end
          if(noisetype==1)
          plotsinglechannelmovavg(channelnum,tstart,tend,k.Noise);
          else
           plotsinglechannelmovavg(channelnum,tstart,tend,k.RelativeNoise);
          end
      
      end
      
      
      
      
      
      
    function k=generateRelativeNoise(k)
           CT=evalin('base','CT');
          k.RelativeNoise= computePathLossOfNoiseSignal(k.Noise,k.NoisePower,k.IntialPosition,[0 0 0],k.pathlosscoefficient,k.RelativeVelocity,CT.samplerate)

    end
     
    
    
      
      function k= generateNoise(k)
          CT=evalin('base','CT');
         k.Noise=generate_interferance(CT.timeperiod,k.NoiseCategory,k.WindowSize,k.No_Of_Levels); 
          
      end
   
      function k= dataanalyze(k,NoiseCategory)
          if nargin<2
              NoiseCategory=1;
          end
        
          if(NoiseCategory==1)
         dataanalyze(k.Noise,[0;0;3]); 
          else
              
             dataanalyze(k.RelativeNoise,[0;0;3]); 
          end
      end
   
      
   
   
   end

   
end