% Function: Implements the neural network cost function for a two layer
%           neural network
function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
    % nn_params        : Neural Network Weight Matrices
    % input_layer_size : No. of features
    % num_labels       : Total No. of Output Classes
    % X      : Input Data Matrix MxN, M-> No. of Samples, N-> No of Features
    % y      : Output Data Matrix Mx1
    % lambda : Regularization Parameter
    %     
    % J     : Cost of Neural Network
    % grad  : Gradient of Neural Network

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


X = [ones(m,1) X];
Y = zeros(num_labels,m);
htheta = zeros(num_labels,1);
J=0;
for i=1:m
    Y(y(i),i)=1;
    htheta = sigmoid(Theta2*([1;sigmoid(Theta1*X(i,:)')]));
    J = J - sum(Y(:,i).*log(htheta) + (1-Y(:,i)).*log(1-htheta));
end
J = J + (0.5*lambda)*(sum(sum(Theta1(:,2:end).*Theta1(:,2:end))) + sum(sum(Theta2(:,2:end).*Theta2(:,2:end))));
J=J/m;

Delta2 = zeros(size(Theta2));
Delta1 = zeros(size(Theta1));

for i=1:m
    z2 = Theta1*X(i,:)';
    a2 = sigmoid(z2);
    z3 = Theta2*([1;a2]);
    a3 = sigmoid(z3);
    del3 = a3-Y(:,i);
    del2 = (Theta2'*del3).*([1;sigmoidGradient(z2)]);
    
    Delta2 = Delta2+del3*([1;a2]');
    Delta1 = Delta1+del2(2:end)*(X(i,:));

end
Theta1_grad = Delta1/m;
Theta2_grad = Delta2/m;
theta1=Theta1;
theta2=Theta2;
theta1(:,1)=0;
theta2(:,1)=0;
Theta1_grad = Theta1_grad + (lambda/m)*theta1;
Theta2_grad = Theta2_grad + (lambda/m)*theta2;

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
