

clear all;
close all;
clc;

load('TrainingData.mat');
NN_Train(X,y,50,0.7);