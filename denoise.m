% function data_denoise = denoise(cleaned_data,level_denoise)
%     
%     [m,n] = size(cleaned_data);
%     data_denoise = zeros(m,n);
%     instance_size =  
%     for i=1:m
%         for j=1:n/449
%             
%             [C, L] = wavedec(abs(cleaned_data(i,(449*(j-1)+1):(449*j))), level_denoise, 'db1');
%             data_denoise(i,(449*(j-1)+1):(449*j)) = wrcoef('a', C,L, 'db1', level_denoise);
%         end
%     end 
    
function denoised_data = denoising (cleaned_data,denoising_level)
  [m,n] = size(cleaned_data);
  data_denoise = zeros(m,n);
  for i=1:m
      extracted_column = cleaned_data(:,i);  
     [C, L] = wavedec(abs(cleaned_data(i,:)), denoising_level, 'db1');
     data_denoise(i,:) = wrcoef('a', C,L, 'db1', denoising_level);
  end
       
        

    