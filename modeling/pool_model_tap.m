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

%od45, implementa la ecuacion diferencial 
%ecuacione diferencial en el sistema. 


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

fprintf("Stats of the system without control\n")
S = stepinfo(G)

% plot the answer to an step and inpulse with delay and without delay
title('Response of a system')
step( G ,'b--',Y,'r'), hold on, impulse( G , 'g-.') 
legend('With Delay','Without delay', 'Impulse'), grid

% Control the system
F = feedback( G, 0.1);
%figure(2)
step( F )

fprintf("Stats of the system with control\n")
S = stepinfo(F)

