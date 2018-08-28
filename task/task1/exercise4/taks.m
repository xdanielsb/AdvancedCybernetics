%{
    Name : Daniel Santos
    Desc : Development task 1.2 
%}
clc; clear all; close all; format compact;

%Defining variables 
K = 8; b1=3; b0 = 3;

H = 1;
%Initial Values
A = [1/2, 1, -1/8, -1/4].*H;
uZ =0.0; 
uA =A(1); uB = A(2); uC = A(3); uD = A(4); 

%Test behaviour 
from = -1; to = 1; N = 100;
levels = linspace(from,to, N);

for i =  1:N
  rate(i) = difuseControl( levels(i), uA, uB , uC, uD, uZ);
end

%Unit Testing 
plot( levels, rate);