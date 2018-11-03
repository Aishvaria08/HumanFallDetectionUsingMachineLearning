clear;
csi_trace = read_bf_file('9-20/a137.dat');;

%loop through the packets to get the csi data
for indexOfPackets = 1:1:398
    csi_entry = csi_trace{indexOfPackets};
    csi = get_scaled_csi(csi_entry);
    %loop through the subcarriers to seperate the data and contruct a
    %matrix
	subcarrierMatrix(indexOfPackets,:) = csi(1,1,:);
end



for indexofSubCarrier = 1:1:30
   SingleSubCarrierData(1,:) = subcarrierMatrix(:, indexofSubCarrier); 
   subplot(5,6,indexofSubCarrier);
    
    %performing decomposition of the signal
    [C, L] = wavedec(abs(SingleSubCarrierData), 5, 'db1');
    %extracting the level 3 approxiation
    %CA3 = appcoef(C,L, 'db1', 3);
    %reconstructing level3 approxiation
    A3 = wrcoef('a', C,L, 'db1', 5);
    
    
    
    
end
    