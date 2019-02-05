%{
 author : Daniel Santos
%}
format compact; clear all; close all;
b0 = 0.005; b1 = 0.01; b2 = 0.01;

num = [b0 b1 b2];
den = [1 -1.8 0.82];

G = tf(num, den)
stepplot(G);


sys = newfis('fstate');

K = 1;
%input error
sys = addvar(sys,'input','error', [-0.2 0.2]);
 % activation function
 sys = addmf(sys,'input',1,'N','zmf',    [-0.1913 0.03771]);
 sys = addmf(sys,'input',1,'Z','gaussmf',   [0.06968 0]);
 sys = addmf(sys,'input',1,'P','smf',      [0.003616 0.2]);
 
%input derivate error
sys = addvar(sys,'input','derror', [-0.5 0.5]);
 % activation function
 sys = addmf(sys,'input',2,'N','zmf',    [-0.4877 0.08233]);
 sys = addmf(sys,'input',2,'Z','gaussmf',    [0.1863 0.0306]);
 sys = addmf(sys,'input',2,'P','smf',      [0.009035 0.5]);
 

%output
sys = addvar(sys, 'output', 'rate',  [-10 10]);
 % activation function 
 sys = addmf(sys,'output',1,'MN','gaussmf',     [1.96 -5.06] );
 sys = addmf(sys,'output',1,'N','gaussmf',      [1.36 -3.442]);
 sys = addmf(sys,'output',1,'Z','gaussmf',   [1.061 -1.71]);
 sys = addmf(sys,'output',1,'P','gaussmf',    [0.9 1.777]);
 sys = addmf(sys,'output',1,'MP','gaussmf',     [1.71 4.05]);
 
%create rules
% error, derror, output

 rules = [
   1 1 5 1 1
   1 2 4 1 1
   1 3 3 1 1
   2 1 4 1 1
   2 2 3 1 1
   2 3 2 1 1
   3 1 3 1 1
   3 2 2 1 1
   3 3 1 1 1
 ];

sys = addrule( sys, rules);
fuzzy(sys);
