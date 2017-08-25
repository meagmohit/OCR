% Function: Predict the label of an input given a trained neural network
function p = predict(Theta1, Theta2, X)
    % Theta1,Theta2 : NN Weights
    % X    : Input Data Matrix MxN, M-> No. of Samples, N-> No of Features
    %
    % pred : Predicted classes (Result of Classification Algorithm)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);


end
