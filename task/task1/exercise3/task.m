%{
    Name: Daniel Santos
    Desc: Solution task 1.1
%}
clc; clear all; close all; format compact;
% boundaries levels water testing
N = 100; from = 0; to= 12;
% rates of filling of the taps
t1 = 0.01; t2 = 0.02; t3 = 0.03;

%Creating the sample
levelsWater = linspace(from,to, N);
for i =  1:N
  rateFill(i) = difuseControl( levelsWater(i), t1, t2 , t3);
end

%Unit Testing 
plot( levelsWater, rateFill);
axis([0,1.5, 0, t1+t2+t3]);
