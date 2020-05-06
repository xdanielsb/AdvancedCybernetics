%{
 name: Daniel Santos
 date: Oct 2, 2018
%}
format compact; clear all; close all; clc;

offset_row = 1;
heart = csvread("./heart_rate.csv",offset_row);
[nrows, ~]= size(heart);

sal = heart(:, 1)'; % heart rate
from = 20;
int = zeros(nrows,from);
for i = from+1:nrows
   for j = 1:from
     int(i,j) = sal(i-j);
   end
end
int = int(from+1:nrows,:);
sal = sal(:,from+1:nrows);
int  = int';
nrows = nrows -from

plot(1:nrows, sal); hold on;
hiddenLayers = [2 2 2];
net = feedforwardnet(hiddenLayers);
net = train(net, int , sal);
%view (net);

y = net( int );
perf = perform( net, y, sal)
MSE=(1/nrows)*sum((sal-y).^2)

plot(1:nrows, y)



