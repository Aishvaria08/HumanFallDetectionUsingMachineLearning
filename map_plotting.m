function denoising()

csi_trace = read_bf_file('16oct_1.dat');

%loop through the packets to get the csi data
for indexOfPackets = 1:1:29
    csi_entry = csi_trace{indexOfPackets};
    csi = get_scaled_csi(csi_entry);
    %loop through the subcarriers to seperate the data and contruct a
    %matrix
	subcarrierMatrix(indexOfPackets,:) = csi(1,1,:);
end



for indexofSubCarrier = 1:1:30
    SingleSubCarrierData(1,:) = subcarrierMatrix(:, indexofSubCarrier); 
    %subplot(5,6,indexofSubCarrier);
    %abs() for magnitude
    %plot(abs(SingleSubCarrierData).')
    %ylabel('SNR [dB]');
    %xlabel('Number of Packets');
    %axis([0 29 0 30])

  [cA1, cD1] = dwt(abs(SingleSubCarrierData), 'db1');
   A1 = upcoef('a', cA1, 'db1', 1);
   D1 = upcoef('d', cD1, 'db1', 1);
    
    subplot(1,2,1);
    plot(A1);
    title('Approximation');
    subplot(1,2,2);
    plot(D1);
    title('Detail');
    
    
    %title(['Sub Carrier: ' indexofSubCarrier '']);
end