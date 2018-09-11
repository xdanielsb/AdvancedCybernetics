%{
 author : Daniel Santos
%}
format compact; clear all; close all;
b0 = 0.005; b1 = 0.01; b2 = 0.01;


sys = newfis('fstate');

K = 100;
%input error
sys = addvar(sys,'input','error',[-1 1]*K);
 % activation function
 sys = addmf(sys,'input',1,'N','zmf',  [-0.6463 -0.3561]*K);
 sys = addmf(sys,'input',1,'Z','gaussmf',  [0.214 0]*K);
 sys = addmf(sys,'input',1,'P','smf',   [0.3274 0.6377]*K);
 
%input derivate error
sys = addvar(sys,'input','derror',[-1 1]*K);
 % activation function
 sys = addmf(sys,'input',2,'N','gaussmf',[0.177 -0.733]*K);
 sys = addmf(sys,'input',2,'Z','gaussmf',  [0.214 0]*K);
 sys = addmf(sys,'input',2,'P','gaussmf',  [0.1711 0.581]*K);
 

%output
sys = addvar(sys, 'output', 'rate', [-0.5 0.5]*K);
 % activation function 
 sys = addmf(sys,'output',1,'N','gaussmf',  [0.1705 -0.5]*K);
 sys = addmf(sys,'output',1,'Z','gaussmf',  [0.08016 0]*K);
 sys = addmf(sys,'output',1,'P','gaussmf',  [0.1705 0.5]*K);
 
%create rules
% error, derror, output
 rules = [
   1 1 1 1 1
   1 2 1 1 1
   1 3 2 1 1
   2 1 1 1 1
   2 2 2 1 1
   2 3 3 1 1
   3 1 3 1 1
   3 2 3 1 1
   3 3 3 1 1
 ];

sys = addrule( sys, rules);

