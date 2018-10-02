%{
 name: Daniel Santos
 date: 2, oct 2018
%}
format compact; 
%clear all;
close all; clc;

a4 =2; a3=1; a2=2; a1=2; a0=1;

Y = F(:,1)'
[~, N ]= size(Y);
time = 1:N;

hiddenLayers = [10 10 10 10];
net = feedforwardnet(hiddenLayers);
net = train(net, time, Y);
%view (net);
R = net(time);
perf = perform( net, R, Y)
MSE=(1/N)*sum((R-Y).^2)

