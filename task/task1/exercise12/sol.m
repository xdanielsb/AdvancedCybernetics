%{
 author: Daniel Santos
 date: 13 sep, 2018
%}
clear all; close all; format compact; clc;
M = 0.7; m =0.8; b = 0.2; l = 0.3; I = 0.006; g = 9.8; F =1;

sys = newfis('fdouze');

%input error
sys = addvar(sys,'input','error',  [-1 1]);
 % activation function
 sys = addmf(sys,'input',1,'N','zmf',      [-0.9859 0.0377]);
 sys = addmf(sys,'input',1,'Z','gaussmf',    [0.3019 0]);
 sys = addmf(sys,'input',1,'P','smf',       [0.01808 1]);
 
%input derivate error
sys = addvar(sys,'input','derror',   [-1 1]);
 % activation function
 sys = addmf(sys,'input',2,'N','zmf',     [-0.994 0.0823]);
 sys = addmf(sys,'input',2,'Z','gaussmf',     [0.4042 0]);
sys = addmf(sys,'input',2,'P','smf',  [0.01807 1]);

%output
sys = addvar(sys, 'output', 'rate',  [-2 2]);
 % activation function 
 sys = addmf(sys,'output',1,'N','gaussmf',   [0.2 -0.7812]);
 sys = addmf(sys,'output',1,'Z','gaussmf',   [0.229 -0.4418]);
 sys = addmf(sys,'output',1,'P','gaussmf',   [0.2 0.09839]);
 
%create rules
% error, derror, output
 rules = [
   1 1 1 1 1
   1 2 1 1 1
   1 3 1 1 1
   2 1 1 1 1
   2 2 2 1 1
   2 3 3 1 1
   3 1 3 1 1
   3 2 3 1 1
   3 3 3 1 1
 ];

sys = addrule( sys, rules);
%fuzzy(sys);