function hash=computehash(data)
%Works only when no of levels less than 10
s=0;
for i=1:length(data)
s=s+data(i)*10^(i-1);
    
end
hash=s;

end