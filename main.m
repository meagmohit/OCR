function latex = main(inpath,infile)
    
    addpath(genpath(pwd));

[X_test,result] = segmentChar_test(inpath,infile);

pred = NN_Test(X_test);
for i=1:size(pred,1)
    result(i).label = pred(i);
end

latex = recoverExpression(result);