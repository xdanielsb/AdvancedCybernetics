%{
 author : Daniel Santos
%}
format compact; clear all; close all;
b0 = 0.005; b1 = 0.01; b2 = 0.01;

num = [b0 b1 b2];
den = [1 -1.8 0.82];

G = tf(num, den)
%stepplot(G);


sys = newfis('fstate');

K = 1;
%input error
sys = addvar(sys,'input','error',[-1 1]);
 % activation function
 sys = addmf(sys,'input',1,'N','zmf',   [-1 -0.0301]);
 sys = addmf(sys,'input',1,'Z','gaussmf',   [0.214 0]);
 sys = addmf(sys,'input',1,'P','smf',     [0.01807 1]);
 
%input derivate error
sys = addvar(sys,'input','derror',[-1 1]);
 % activation function
 sys = addmf(sys,'input',2,'N','zmf',   [-1 -0.0301]);
 sys = addmf(sys,'input',2,'Z','gaussmf',   [0.214 0]);
 sys = addmf(sys,'input',2,'P','smf',     [0.01807 1]);
 

%output
sys = addvar(sys, 'output', 'rate', [-1 1]);
 % activation function 
 sys = addmf(sys,'output',1,'MN','gaussmf',   [0.171 -0.6133]   );
 sys = addmf(sys,'output',1,'N','gaussmf',    [0.07584 -0.234]);
 sys = addmf(sys,'output',1,'Z','gaussmf',  [0.08016 0]);
 sys = addmf(sys,'output',1,'P','gaussmf',   [0.065 0.2387]);
 sys = addmf(sys,'output',1,'MP','gaussmf',   [0.171 0.7561]);
 
%create rules
% error, derror, output

 rules = [
   1 1 5 1 1
   1 2 4 1 1
   1 3 4 1 1
   2 1 4 1 1
   2 2 3 1 1
   2 3 2 1 1
   3 1 2 1 1
   3 2 2 1 1
   3 3 1 1 1
 ];

sys = addrule( sys, rules);
%fuzzy(sys);
