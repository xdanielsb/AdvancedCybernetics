%{
 author: Daniel Santos
 date : Septembre, 4 2018
%}
format compact; clear all; clc; close all;

A = 0.5;                   %Amplitud
T = 8;                     %Period
IN = [0, 2, 4, 6, 8];      %In
OUT = [0, 1, 0, -1, 0]*A  %Out

sys = newfis('csin');

%input
sys = addvar(sys,'input','triang',[-2 2]);
 % activation function
 sys = addmf(sys,'input',1,'P','gaussmf',[0.288 -1]);
 sys = addmf(sys,'input',1,'Z','gaussmf',[0.4286 0]);
 sys = addmf(sys,'input',1,'N','gaussmf',[0.288 1]);
 
%output
sys = addvar(sys, 'output', 'triang', [-2 2]);
 % activation function 
 sys = addmf(sys,'output',1,'N','gaussmf',[0.2 -0.55]);
 sys = addmf(sys,'output',1,'Z','gaussmf',[0.002 0.0]);
 sys = addmf(sys,'output',1,'P','gaussmf',[0.2 0.55]);
 
%create rules
 rules = [
   1 1 1 2
   2 2 1 2
   3 3 1 2
 ];

sys = addrule( sys, rules);
fuzzy(sys);