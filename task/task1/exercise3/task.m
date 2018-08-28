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
levels = linspace(from,to, N);
for i =  1:N
  rateFill(i) = difuseControl( levels(i), t1, t2 , t3);
end

%Unit Testing 
% behavoiur
plot( levels, rateFill);
axis([0,0.5, 0, 0.5]);


%difuse functions
figure(2)
heighTank= 1;
P = [[0,1/10],  [1/10, 3/10], [3/10, 8/10], [8/10, 10/10] ].*heighTank;
a = smf(levels, [P(1), P(2)]);
b = smf(levels, [P(3), P(4)]);
c = smf(levels, [P(5), P(6)]);
d = smf(levels, [P(7), P(8)]);

plot(levels, a); hold on;
plot(levels, b); hold on;
plot(levels, c); hold on;
plot(levels, d); axis([0,1, 0, 1]);


