% Function: Randomly initialize the weights of a layer with L_in
%           incoming connections and L_out outgoing connections
function W = randInitializeWeights(L_in, L_out)
    % L_in  : InputConnections
    % L_Out : Output Connections
    %
    % W : Weights for NN

W = zeros(L_out, 1 + L_in);

epsilon_init = 0.12;
W = rand(L_out, 1 + L_in)*2* epsilon_init - epsilon_init;


end
