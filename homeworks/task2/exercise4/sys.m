%{
 name: Daniel Santos
 date: 2, oct 2018
%}
format compact; 
%clear all;
close all; clc;

a4 =2; a3=1; a2=2; a1=2; a0=1;

hiddenLayers = [10 10 10 10];
numdelay = 4;
net = feedforwardnet(hiddenLayers);
%O = O(7:57,:);
net = train(net, I', O');

%view (net);
R = net(I');
perf = perform( net, R, O')
MSE=(1/51)*sum((R-O').^2)

in = 1:51
plot(in, O'); hold on;
plot(in, R)

