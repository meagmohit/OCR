function r = labelHelper(r, l)

% r - result
% l - 1xn label matrix

n = size(r, 2);
for i = 1 : n
    r(i).label = l(i);
end