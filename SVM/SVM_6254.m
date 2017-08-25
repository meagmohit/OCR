% SVM with One vs All Classification
clear ; close all; clc

% Loading Dataset
load('ex4data1.mat');
m = size(X, 1);

% Setting Parameter
num_labels = 60;


% % Binary CLassiofication using SVM
% Will be needed in OnevsOne / OnevsAll approach but that wil be too computational heavy

% ind = (y==1)|(y==2);
% find(ind);
% indi = find(ind);
% model = svmtrain(X(indi,:),y(indi));
% res = svmclassify(model, X(indi,:));
% error = sum(res-y(indi));


% Multiclass SVM directly using LibSVM
% Using LibSVM
model = svmtrain(y,X);
[predict_label, accuracy, dec_values] = svmpredict(y, X, model);
