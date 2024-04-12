% Data Processing with 4000 samples 
clc;clear all;
cd 'D:\CPR Research\Research_collaboration\Work\Native\Broadwell';

%% S1: Read data
Files1=dir('Data2/*.txt');

for k=1:length(Files1)
   data(:,:,k)=rmmissing(readmatrix(strcat('Data2/',(Files1(k).name))));
   image(:,k)=data(:,2,k);
end
clear data;
%% Segment measurment-wise

samples=4000;
num_measure=100;
num_image=length(Files1);


for i=1:num_image
    k=1;
    for m=1:num_measure
        img(:,m,i)=image(k:k+samples-1,i);
        k=k+samples;
    end
end
%% Prepare X
total_measure = num_image*num_measure;
X=reshape(img,[samples,total_measure]);
X=X';

%% Prepare Y

for i=1:num_image
    n(:,:,i)=repmat(i-1,1,num_measure);
end
Y=reshape(n,[1,total_measure]);
Y=Y';

%% Manual Split
% Train data
N = size(X,1)*0.6;
num_measure=100;
interval=N/num_image;
k=1;
%m=0;
for i=1:interval:N
    x_train(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_train(i:i+interval-1,:)=Y(k:k+interval-1,:);
    k=k+num_measure;
    %m=m+1;
end
% validation data
N = size(X,1)*0.2;
k=interval+1;
interval=N/num_image;
%m=0;
for i=1:interval:N
    x_val(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_val(i:i+interval-1,:)=Y(k:k+interval-1,:);
    k=k+num_measure;
    %m=m+1;
end 
% Test data
N = size(X,1)*0.2;
k=(num_measure-interval)+1;
interval=N/num_image;
%m=0;
for i=1:interval:N
    x_test(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_test(i:i+interval-1,:)=Y(k:k+interval-1,:);
    k=k+num_measure;
    %m=m+1;
end 

%% Random split

% N = size(X,1);
% [train_idx,val_idx,test_idx] = dividerand(N,0.6,0.2,0.2);
% x_train = X(train_idx, :);
% x_val = X(val_idx, :);
% x_test = X(test_idx, :);
% 
% y_train = Y(train_idx, :);
% y_val = Y(val_idx, :);
% y_test = Y(test_idx, :);

%% Save
cd 'D:\CPR Research\Research_collaboration\Work\Native\Broadwell\Data2\FinalData';
writematrix(X,strcat('X_',num2str(num_image),'.csv'));
writematrix(Y,strcat('Y_',num2str(num_image),'.csv'));
writematrix(x_train,strcat('X_train_',num2str(num_image),'.csv'));
writematrix(y_train,strcat('Y_train_',num2str(num_image),'.csv'));
writematrix(x_val,strcat('X_val_',num2str(num_image),'.csv'));
writematrix(y_val,strcat('Y_val_',num2str(num_image),'.csv'));
writematrix(x_test,strcat('X_test_',num2str(num_image),'.csv'));
writematrix(y_test,strcat('Y_test_',num2str(num_image),'.csv'));
%%

