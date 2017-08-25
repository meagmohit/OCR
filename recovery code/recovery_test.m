close all; clear all; clc
format compact

src0 = imread('test7.png');

result = segmentChar(src0);

% label = [47 5 37 4 20 40 34 35 19 38 38 5 6 19 38 37 16 20 43 34 44 41 38 26 27 38 46 10 4 30 14 30 37 45 19 1 41 10 10 11 20 19];  % test4.png
% label = [34 37 35 56 35 19 55 34 20 40 34 19 20 55 34 35 37 34 35 19 56 34 19 35];  % test1.png
% label = 19;  % 2.png
% label = [45 19 41 24 1 43 19 37 5 38 3 44 2 41 1 10];  % 33.png
% label = [38 19 20];  % 4.png
% label = [19 20 19 20 19 11 19 20 38 47 1 2 34 20 19 19 37 46 34 35 38 4 3 1 1 38 20 35 34 34 2 41 45 16 43 34 35 35 44 38 45 19 35 41 19 20 38 19 20];  % test3.png
% label = [12, 19, 20];  % test6.png
label = [47 19 37 38 47 16 19 38 34 20 19 2 20 38 18 20 41 34 17 19 43 20 34 44 38 16 19 43 34 44];  % test7.png

result = labelHelper(result, label);

% result = distinguishLine2(result);

% grp = group(result, []);
% 
% str = recover(grp, result)

str = recoverExpression(result)


