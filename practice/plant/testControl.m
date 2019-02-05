format compact;
clc;
clear all;
close all ;

f1 = 1;
f2 = 2;

% print behaviour
from =0; to = 7; N = 100;
t = linspace(from, to ,N);

% eval the function
for i = 1:N
  b(i) =  booleanControl( t(i), f1 ,f2 );
  d(i) =  difuseControl( t(i), f1, f2 );
end

plot(t, b)
hold on
plot(t, d)
