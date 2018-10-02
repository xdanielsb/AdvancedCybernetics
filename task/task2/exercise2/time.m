%{
 name: Daniel Santos
 date: Oct 2, 2018
%}
format compact; clear all; close all; clc;
N = 24; %months
months = linspace(1, N, N);
A = rand(1,12)*15;
for i = 1:N
  stock(i) = getStock(months(i), A);
end

plot( months , stock)

hiddenLayers = [2 2 2];
net = feedforwardnet(hiddenLayers);
net = train(net, months, stock);

%view (net);
y = net( 15 )
perf = perform( net, y, stock)


function y = getStock( i, A )
  m = mod(i, 13);
  if m==0
      m = 1;
  end
  y = A(m);
end 