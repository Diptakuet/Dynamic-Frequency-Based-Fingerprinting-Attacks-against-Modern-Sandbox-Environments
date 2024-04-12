% Data Processing with 4000 samples Without arguments
% S1: Read data
clc;clear all;
cd 'D:\CPR Research\Research_collaboration\Work\Native\Cascade';

% %% 100
Files1=dir('Data/*.txt');

for k=1:length(Files1)
   data(:,:,k)=rmmissing(readmatrix(strcat('Data/',(Files1(k).name))));
   image1(:,k)=data(:,2,k);
end
clear data;
%% Image 1

samples=4000;
num_measure=100;
num_image=length(Files1);


for i=1:num_image
    k=1;
    for m=1:num_measure
        img(:,m,i)=image1(k:k+samples-1,i);
        k=k+samples;
    end
end



%% X
total_measure = num_image*num_measure;
X=reshape(img,[samples,total_measure]);
X=X';

%% Y

for i=1:num_image
    n(:,:,i)=repmat(i-1,1,num_measure);
end
Y=reshape(n,[1,total_measure]);
Y=Y';

%% Y label
for k=1:length(Files1)
   label{k,:}=Files1(k).name;
end


%% Manual Split
% Train data
N = size(X,1)*0.6;
num_measure=100;
interval=N/num_image;
k=1;
m=0;
for i=1:interval:N
    x_train(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_train(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end
% validation data
N = size(X,1)*0.2;
k=interval+1;
interval=N/num_image;
m=0;
for i=1:interval:N
    x_val(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_val(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end 
% Test data
N = size(X,1)*0.2;
k=(num_measure-interval)+1;
interval=N/num_image;
m=0;
for i=1:interval:N
    x_test(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_test(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end 

%% Random split

N = size(X,1);
[train_idx,val_idx,test_idx] = dividerand(N,0.6,0.2,0.2);
x_train = X(train_idx, :);
x_val = X(val_idx, :);
x_test = X(test_idx, :);

y_train = Y(train_idx, :);
y_val = Y(val_idx, :);
y_test = Y(test_idx, :);

%% Save
cd 'D:\CPR Research\Research_collaboration\Work\Native\Cascade\random_split';
writematrix(X,strcat('X_',num2str(num_image),'.csv'));
writematrix(Y,strcat('Y_',num2str(num_image),'.csv'));
writematrix(label{:},strcat('Y_label',num2str(num_image),'.csv'));

writematrix(x_train,strcat('X_train_',num2str(num_image),'.csv'));
writematrix(y_train,strcat('Y_train_',num2str(num_image),'.csv'));
writematrix(x_val,strcat('X_val_',num2str(num_image),'.csv'));
writematrix(y_val,strcat('Y_val_',num2str(num_image),'.csv'));
writematrix(x_test,strcat('X_test_',num2str(num_image),'.csv'));
writematrix(y_test,strcat('Y_test_',num2str(num_image),'.csv'));



%%
clc; clear img_name;
L1=length(Files1);
for i=1:L1
    img_name{i}=Files1(i).name;
end

L2=length(Files2);
for i=1:L2
    img_name{i+L1}=Files2(i).name;
end

L3=length(Files3);
for i=1:L3
    img_name{i+L1+L2}=Files3(i).name;
end
%%
% cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\FinalData';
% writecell(img_name',strcat('Y_Label_',num2str(num_image),'.csv'));
%%
cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis';
clc; clear data;
Files4=dir('Data/Test_Data/*.txt');

for k=1:length(Files4)
   data(:,:,k)=rmmissing(readmatrix(strcat('Data/Test_Data/',(Files4(k).name))));
   test_image(:,k)=data(:,2,k);
end
%%
clc; clear test_img_name;
L4=length(Files4);
for i=1:L4
    test_img_name{i}=Files4(i).name;
end

%%
% cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\FinalData';
% writecell(test_img_name','Y_Label_test.csv');
%% Take 150
clear data;
cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\FinalData';
data=readmatrix('Y_Label_test.csv');
Y_test_150=data(1:150,2);
X_test_150=test_image(:,1:150);
X_test_150=X_test_150';


%% save
cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\FinalData';
writematrix(X_test_150,strcat('X_test_150.csv'));
writematrix(Y_test_150,strcat('Y_test_150.csv'));
%% Result
pred=readmatrix('D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\prediction.txt');

%%
pred_100=pred(101:150);
Y_test_100=Y_test_150(101:150);
count=length(find(pred_100==Y_test_100));
accuracy=(count/50)*100

%% Test image
% clc;
% cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\';
% 
% test_data=rmmissing(readmatrix('neo4j_openjdk.txt'));
% samples=4000;
% num_measure=20;
% num_image=1;
% total_measure = num_image*num_measure;
% core=1;
% 
% 
% for i=1:num_image
%     k=1;
%     for m=1:num_measure
%         img0(:,m)=test_data(k:k+samples-1,core+1);
%         img1(:,m)=test_data(k:k+samples-1,core+2);
%         k=k+samples;
%     end
% end
% %%
% img0=img0';
% img1=img1';
% %x_test2=ones(size(x_test));
% x_test2(1:10,:)=img0(1:10,:);
% x_test2(11:20,:)=img1(1:10,:);
% x_test2(21:50,:)=x_test(21:50,:);
% cd 'D:\CPR Research\Research_collaboration\Work\Cross_core_analysis\FinalData';
% 
% writematrix(x_test2,strcat('X_test2_5.csv'));
% %%
% plot(X(1,:));
% figure;
% plot(img0(1,:));




