format compact;
clc;
clear all;
close all ;

f1 = 1;
f2 = 2;

% print behaviour
from =0; to = 7; N = 30;
t = linspace(from, to ,N);

for i = 1:N
  y(i) =  booleanControl( t(i), f1 ,f2 );
end

plot(t, y)

