
    
function data_denoise = denoise (cleaned_data,denoising_level)
  [m,n] = size(cleaned_data);
  data_denoise = zeros(m,n);
  for i=1:m
      extracted_column = cleaned_data(:,i);  
     [C, L] = wavedec(abs(cleaned_data(i,:)), denoising_level, 'db1');
     data_denoise(i,:) = wrcoef('a', C,L, 'db1', denoising_level);
  end
       
        

    