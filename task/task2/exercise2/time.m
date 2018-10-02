%{
 name: Daniel Santos
 date: Oct 2, 2018
%}
format compact; clear all; close all; clc;

offset_row = 1;
unhealthy = csvread("./heart_.csv",offset_row);
[nimages_un, ~]= size(unhealthy)

plot( months , stock)

hiddenLayers = [2 2 2];
net = feedforwardnet(hiddenLayers);
net = train(net, months, stock);

%view (net);
y = net( 15 )
perf = perform( net, y, stock)


