classdef ConfigureTime
   properties
      
      timeperiod
      timematrix
      samplerate
      
   end
   methods
      function c = ConfigureTime
        c.samplerate=0.005;
         c.timeperiod=300;
         c.timematrix=0:0.0005:300;
         
      end
        
      
      function c=SetTime(c,time,samplerate)
          c.samplerate=samplerate;
          c.timematrix=c.samplerate:c.samplerate:time;
          c.timeperiod=time;
      
      end
   end
   
end