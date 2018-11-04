clear;
clc;

load('y.mat');

% coverting dat to mat files
original_noised = dat_to_mat();

% data cleaning
cleaned_data = cleaning(original_noised);

% data denoising
data_denoise = denoise(cleaned_data,5);

% divide data into training and testing
[m,n] = size(data_denoise);
interval = 5;
bins = (m/interval);
for i = 1:bins
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Start = (i-1)*interval + 1;
End = i*interval;
eval([Mat_child ' = Mat(Start:End,:)']);
end


% prompt = 'What is the filename of input?';
% str = input(prompt,'s');
% x = load(str);
% var = x.in7;
% inputsize = size(var,2);

% prompt1 = 'What is the size of input? ';
% inputsize = input(prompt1);

prompt2 = 'Enter size of hiddenlayer? ';
hiddenlayersize = input(prompt2);

prompt3 = 'Enter size of labels? ';
labelsize = input(prompt3);

prompt4 = 'Enter number of iterations? ';
number_of_iteration = input(prompt4);

prompt5 = 'Enter number of iterations for training? ';
iterations = input(prompt5);

prompt6 = 'Enter value of lamda? ';
lamda = input(prompt6);

    input = data_denoise;
    hiddenlayer = hiddenlayersize;
    labels = labelsize;
    x = size(data_denoise,2);
    
for i = 1:number_of_iteration
    
   ex4(input,hiddenlayer,labels, x , y,lamda, iterations);
   hiddenlayer = hidden +100;
    
end 