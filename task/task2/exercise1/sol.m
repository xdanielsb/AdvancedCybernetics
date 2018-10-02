%{
 name: Daniel Santos
 date: Oct 2, 2018
%}
format compact; clear all; close all; clc;
N = 100;
D = linspace(0, 2*pi, N);

%get values 
% triangular function 
% sin funciton 
for i = 1:N
 T(i) = getTriang(D(i));
 S(i) = sin(D(i));
end

hiddenLayers = [4 4 4 4];
net = feedforwardnet(hiddenLayers);
net = train(net, T, S);
%view (net);
y = net( T);
perf = perform( net, y, S)

plot(D, S); hold on
plot(D, T); hold on;
plot(D, y);

function y =  getTriang( x )
  sign = 1;
  if x > pi
      x = x - pi;
      sign = -1;
  end 
  if x <=pi/2
     y = (2/pi) * x ;
  elseif x <= pi
     y = (-2/pi)* x + 2 ;
  end  
  y = y * sign;
end 

