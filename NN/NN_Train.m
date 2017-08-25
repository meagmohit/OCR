% Function: To Split data for Training and Testing 

function [Acc_train,Acc_test] = NN_Train(X,y,niter,split)
    % X    : Input Data Matrix MxN, M-> No. of Samples, N-> No of Features
    % y    : Output Data Matrix Mx1
    % niter: maximum no of iterations allowed to find the optimum weights
    % split: fraction(b/w 0 and 1), denotes dividing of dataset in 2 parts
    %     
    % Acc_train : Training Accuracy
    % Acc_test  : Test Accuracy


size_train = split*size(X,1);
size_test = (1-split)*size(X,1);

Xnew = randperm(size(X,1));
X_train=X(Xnew(1:size_train),:);
y_train=y(Xnew(1:size_train),:);

Acc_train = NN(X_train,y_train,niter);
Acc_test=0;
if(size_test~=0)
    X_test =X(Xnew(size_train+1:end),:);
    y_test =y(Xnew(size_train+1:end),:);
    pred = NN_Test(X_test);
    Acc_test = mean(double(pred == y_test)) * 100;
end
disp('Training Accuracy :');
Acc_train
disp('Test Accuracy :');
Acc_test