clc;clear all;
cd 'D:\CPR Research\Research_collaboration\Work\Native\Broadwell';
%%
pred=readmatrix('FinalData\Prediction.txt');
org=readmatrix('FinalData\Y_test_126.csv');
image_name=readlines('FinalData\Y_Label.txt');
x_test=readmatrix('FinalData\X_test_126.csv');
%%
num_measure=20;
num_image=length(image_name)-1;
total_measure=num_image*num_measure;


miss=find(pred~=org);
error_rate=length(miss)/length(pred);

%% Y_test Label
Label=image_name;
for i=1:num_image
    A(:,i)=repmat(Label(i),1,num_measure);
end
Y_label=reshape(A,[1,total_measure]);
Y_label=Y_label';
%%
k=1;
for i=1:num_measure:total_measure 
    org_per(:,k)=org(i:i+num_measure-1);
    pred_per(:,k)=pred(i:i+num_measure-1);
    Y_label_per(:,k)=Y_label(i:i+num_measure-1);
    k=k+1;
end

%% Misprediction rate per container
for i=1:num_image
    m=length(find(pred_per(:,i)~=org_per(:,i)));
    missrate_per_container(i,:)=(m/num_measure)*100;
end

missrate_per_container_label=[Label(1:num_image) missrate_per_container];
%%
writematrix(missrate_per_container_label,'Missrate_126_unsorted_2.csv');
%%
k=1;
for i=1:num_image
    for j=1:num_measure
        x_test_per(:,j,i)=x_test(k,:);
        k=k+1;
    end
end


%%
for i=1:num_image
    miss_per{i}=find(org_per(:,i)~=pred_per(:,i));
    miss_pred_per{i}=pred_per(miss_per{i},i);
    miss_pred_label_per{i}=image_name(miss_pred_per{i}+1);
end
%%
k=1;
for i=1:num_image
    if miss_per{i}~=0
        index(k)=i;
        k=k+1;
    end
end

%%
for i=1:length(index)
    miss_table_index(i)=image_name(index(i));
    miss_table{i}=miss_pred_label_per{index(i)};
    miss_table_measure{i}=miss_per{index(i)};
end
%%
writematrix(miss_table_index','miss_table_index.csv');
%%
clc;
num=11;
text1=sprintf('Original docker: %s',miss_table_index(num));
text2=sprintf('Misspredicted (out of 20): %d',length(miss_table{num}));
disp(text1);
disp(text2);
disp(miss_table{num});

%%
close all;
img=20;
figure(1);
plot(x_test_per(:,2,img));
title(Y_label_per(2,img));


%%
figure(1);
plot(x_test((26*20)+4,:));
figure(2);
plot(x_test((48*20)+4,:));
