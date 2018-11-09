clear;
clc;


% later on we will write the login to create dynamic labels.
load('y.mat');

% coverting dat to mat files


original_noised = dat_to_mat();

% data cleaning


% cleaned_data = cleaning(original_noised);

% data denoising
data_denoise = denoise(original_noised,5);

% Conversion of Traing and testing data
Mat = data_denoise;
Prefix = 'Mat';
[m,n] = size(Mat);
interval = 80;
bins = (m/interval);
Training = [];
Testing = [];

for i = 1:bins
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Start = (i-1)*interval + 1;
End = i*interval - 20;
eval(['Training = [Training;Mat(Start:End,:)]']);
end

Prefix = 'test';
for i = 1:bins
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Start = (i-1)*interval + 61;
End = i*interval;
eval(['Testing = [Testing;Mat(Start:End,:)]']);
end


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

    input = Training;
    hiddenlayer = hiddenlayersize;
    labels = labelsize;
    x = size(Training,2);
    
for i = 1:number_of_iteration
    
   ex4(input,hiddenlayer,labels, x , y,lamda, iterations,input);
   hiddenlayer = hidden +100;
    
end 