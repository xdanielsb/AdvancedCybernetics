%{
    Name: Daniel Santos
    Exercise: Example in class
    Desc: Two taps in a pool, sensor that regulate the levels of water
%}

% prepare the CLI
clc
clear all
close all
format compact

%Constants
Tm = 0.5; k = 15; tao = 2 ;

% start to develop the system
gain = k;
num = [ gain  ];
den = [ tao 1 ];
G = tf(num,den,'InputDelay',Tm)
Y = tf(num,den)

if isstable(G)
  fprintf("Stability:  stable\n")
else
  fprintf("Stability:  not stabel\n")
end

% plot the answer to an step and inpulse with delay and without delay
step( G ,'b--',Y,'r'), hold on, impulse( G ) 
legend('With Delay','Without delay', 'Impulse'), grid

%
F = feedback( 0.1*Y, 1);
figure(2) 
step( F )
