%{ 
name : Daniel Santos
date : oct 2, 2018
%}
clc; clear all; close all; format compact;
N = 5; % num images N +1 
numbers = 0:5;
B =[];
for i= 0:N
  path = strcat('./imgs/', int2str(i), '.png');
  A = readImg( path ) ;
  B = [B; A];
end
B = B';

%net = perceptron;
net = feedforwardnet([10 20 10]);
net = train( net, B, numbers);

view (net);
for i = 0:5
 ptest = readImg( strcat('./imgs/', int2str(i), '.png') )';
 y = net( ptest);
 fprintf("i = %d, res = %f\n", i, y);
end 


function A = readImg( path )
  A = rgb2gray ( imread(path) ); 
  A = double( reshape(A,1, []) );
end

