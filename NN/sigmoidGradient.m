% Function: computes the gradient of the sigmoid function
%   evaluated at z. This works regardless if z is a matrix or a
%   vector. In particular, if z is a vector or matrix, it returns
%   the gradient for each element.
function g = sigmoidGradient(z)

g = zeros(size(z));



g = sigmoid(z).*(1-sigmoid(z));






end
