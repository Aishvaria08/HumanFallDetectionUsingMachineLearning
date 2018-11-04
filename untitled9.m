Prefix = 'Mat';
[m,n] = size(Mat);
interval = 30;
bins = (m/interval);
for i = 1:bins
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Start = (i-1)*interval + 1;
End = i*interval;
eval([Mat_child ' = Mat(Start:End,:)']);
end
for i = 1:(m/interval)
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Training = 
    
    
end