close all; clear all; clc

run pathdef.m

path = 'TestImage/MyTest/2.png';

[X_test,result] = segmentChar_test(path);

pred = NN_Test(X_test);
for i=1:size(pred,1)
    result(i).label = pred(i);
end

latex = recoverExpression(result);