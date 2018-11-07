clear;
clc;


% later on we will write the login to create dynamic labels.
load('y.mat');

% coverting dat to mat files


original_noised = dat_to_mat();

% data cleaning


cleaned_data = cleaning(original_noised);

% data denoising
data_denoise = denoise(cleaned_data,5);

<<<<<<< HEAD:forloop.m
Mat = data_denoise;

% divide data into training and testing
[m,n] = size(Mat);
interval = 5;
training = 3;
Prefix = 'Mat';
=======
% Conversion of Traing and testing data
Mat = data_denoise;
Prefix = 'Mat';
[m,n] = size(Mat);
interval = 30;
>>>>>>> 5133d8c9ab4aeef4ae9753281011fe81d72e23eb:mainFunction.m
bins = (m/interval);
Training = [];

for i = 1:bins
var_name = strcat(Prefix, num2str(i));

Mat_child = genvarname(var_name);
Start = (i-1)*interval + 1;
<<<<<<< HEAD:forloop.m
End = i*interval;
eval([Mat_child ' = Mat(Start:End,:)']);

training = strcat('training_set',num2str(i));
testing = strcat('testing_set', num2str(i));

=======
End = i*interval - 10;
eval(['Training = [Training;Mat(Start:End,:)]']);
end

Prefix = 'test';
for i = 1:bins
var_name = strcat(Prefix, num2str(i));
Mat_child = genvarname(var_name);
Start = (i-1)*interval + 21;
End = i*interval;
eval(['Testing = [Testing;Mat(Start:End,:)]']);
>>>>>>> 5133d8c9ab4aeef4ae9753281011fe81d72e23eb:mainFunction.m
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

    input = data_denoise;
    hiddenlayer = hiddenlayersize;
    labels = labelsize;
    x = size(data_denoise,2);
    
for i = 1:number_of_iteration
    
   ex4(input,hiddenlayer,labels, x , y,lamda, iterations);
   hiddenlayer = hidden +100;
    
end 