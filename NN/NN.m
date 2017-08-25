% Function: Trains the Neural Network and returns training accuracy

function acc = NN(X,y,niter)
    % X    : Input Data Matrix MxN, M-> No. of Samples, N-> No of Features
    % y    : Output Data Matrix Mx1
    % niter: maximum no of iterations allowed to find the optimum weights
    %     
    % acc  : Training Accuracy


tic;

m = size(X, 2);

% Setting up the paramteres of Neural Network
input_layer_size  = m;  % 20x20 Input Images of Digits
hidden_layer_size = 100;   % 100 hidden units
num_labels = 60;          % 60 labels, from 1 to 60   

% Loading Dataset
% % load('TrainingData.mat');


initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% Training Neural Network
options = optimset('MaxIter', niter);
lambda = 1;
costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));


% Saving NN Configuration
save('NNConfig.mat','Theta1','Theta2');


% Prediction
pred = predict(Theta1, Theta2, X);
acc = mean(double(pred == y)) * 100;
% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
disp('Training Time');
toc;
