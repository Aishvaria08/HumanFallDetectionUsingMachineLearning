% Loading the signal and storing it into a variable
csi_trace = read_bf_file('7thOctSignals/7_Oct_137.dat');
% creating a final matrix to add signals for every iteration
   final_matrix = zeros(1,30);
% initializing counter
 for i = 1:490
    csi_entry = csi_trace{i};
   % extracting 3D matrix from the structure
   csi = get_scaled_csi(csi_entry);

   % converting 3D matrix to 2D
    temp_matrix = db(abs(squeeze(csi))); 
     next_entry = temp_matrix(1,:);
 
%    % adding entries into the final matrix
       final_matrix = [final_matrix;next_entry];
   % increasing couter for next entry
        i = i+1;
% 
  end
 
 
 final_matrix(1, :) = [];

 original_noised = final_matrix(:,1);

 original_noised = final_matrix(:);
 original_noised = original_noised';
training = [training;original_noised];
% fourier transformation
% squeezed_signal = (db(abs(squeeze(original_noised).')));
% % use fft for transformation
% plot(fft(squeezed_signal));
% %  spectogram
% spectrogram(squeezed_signal);
