% Function: Returns the predicted value of Classes on given DataSet

function [pred] = NN_Test(X)
    % X    : Input Data Matrix MxN, M-> No. of Samples, N-> No of Features
    %
    % pred : Predicted classes (Result of Classification Algorithm)

tic;
load NNConfig.mat
pred = predict(Theta1, Theta2, X);
disp('Testing Time:');
toc;