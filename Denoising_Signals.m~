clear;
clc;

[FileName,PathName] = uigetfile('*.dat', 'Open text file','MultiSelect','on');
 data = cell(length(FileName),1) ;
 for i = 1:length(FileName) 
    csi_trace = read_bf_file(fullfile(PathName,FileName{i}));
     
    for indexOfPackets = 1:1:490
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
        [C, L] = wavedec(abs(SingleSubCarrierData), 3, 'db1');
        %extracting the level 3 approxiation
        %CA3 = appcoef(C,L, 'db1', 3);
        %reconstructing level3 approxiation
       
        A(i,:) = wrcoef('a', C,L, 'db1', 3);
    
    
%         plot((A3).')
%         ylabel('Amplitude');
%         xlabel('Number of Packets');
%         axis([0 1996 0 30])
    
    
    end
 end