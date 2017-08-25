% Function: Compute sigmoid functoon
function g = sigmoid(z)

g = 1.0 ./ (1.0 + exp(-z));
end
