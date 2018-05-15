function hash=computehashstring(data)
%Works for any no of levels
s='';
for i=1:length(data)
s=strcat(s,'-',num2str(data(i)));
    
end
hash=s;

end