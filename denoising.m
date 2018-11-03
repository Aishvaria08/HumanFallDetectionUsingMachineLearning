
function denoising()
    
size = X(1:98); 
ls = length(size);
[cA1] = dwt(s,'db1');
A1 = upcoef('a',cA1,'db1',2,ls); 
