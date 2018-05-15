function state=divideNlevel(val,max,min,n)

diff=(max-min)/n;
a=min;
for i=1:n
a=[a min+i*diff];
end

i=1;
while(val>=a(i)&&i~=length(a))
    i=i+1;
    
end

state=i-1;
end