inMatrix = rand(155, 1000);
numRows  = size(inMatrix, 1);
numParts = 10;

a = floor(numRows/numParts);          % = 15
b = rem(numRows, numParts);           % = 5
partition = ones(1, numParts)*a;      % = [15 15 15 15 15 15 15 15 15 15]
partition(1:b) = partition(1:b)+1;    % = [16 16 16 16 16 15 15 15 15 15]
disp(sum(partition))                  % = 155

% Split matrix rows into partition, storing result in a cell array
outMatrices = mat2cell(inMatrix, partition, 1000)