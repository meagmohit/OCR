function latexStr = recoverExpression(result)

% input: result - a struct with 3 areas
%          .bounding (just as from the segmentation result)
%          .data (not needed, but it is okay to be provided)
%          .label (a number between 1 ~ 60)
% output: latexStr - the LaTeX expression of the equation

result = distinguishLine2(result);

grp = group(result, []);

latexStr = recover(grp, result);
