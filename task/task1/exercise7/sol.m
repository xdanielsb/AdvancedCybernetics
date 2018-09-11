%{
  author: Daniel Santos 
  date: Sep 6, 2018
%}
format compact; clear all; close all; clc;

% Initialize variables
k = 5;
Tm = 0.5;
tao = 2;

% Control with fuzzzy logic 

sys = newfis('fcontrol');

%input error
sys = addvar(sys,'input','error',[-0.5 0.5]);
 % activation function
 sys = addmf(sys,'input',1,'N','gaussmf',[0.0134 -0.4667]);
 sys = addmf(sys,'input',1,'Z','gaussmf', [0.107 -0.1622]);
 sys = addmf(sys,'input',1,'P','gaussmf', [0.208 0.2904]);
 
%output
sys = addvar(sys, 'output', 'rate', [-0.5 0.5]);
 % activation function 
 sys = addmf(sys,'output',1,'N','gaussmf', [0.08527 -0.25]);
 sys = addmf(sys,'output',1,'Z','gaussmf', [0.04008 0]);
 sys = addmf(sys,'output',1,'P','gaussmf', [0.08527 0.25]);
 
%create rules
 rules = [
   1 1 1 2
   2 2 1 2
   3 3 1 2
 ];

sys = addrule( sys, rules);
fuzzy(sys);
