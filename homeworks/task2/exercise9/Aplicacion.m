%{
 name: Daniel Santos
 date: Feb 5, 2019
%}
format compact; clear all; close all; clc;

offset_row = 1;
heart = csvread("./heart_rate.csv",offset_row);
[nrows, ~]= size(heart);

sal = heart(:, 1)'; % heart rate
from = 2;
int = zeros(nrows,from);
for i = from+1:nrows
   for j = 1:from
     int(i,j) = sal(i-j);
   end
end
int = int(from+1:nrows,:);
Y = sal(:,from+1:nrows);
X  = int;
Y = Y';
nrows = nrows -from;

plot(1:nrows, Y); hold on;

%Fuzzy System
opt = genfisOptions('GridPartition');
opt.NumMembershipFunctions = [2];
opt.InputMembershipFunctionType = ["gbellmf"];
fis = genfis(X,Y,opt);
[x2,mf] = plotmf(fis,'input',1);
%plot(x2,mf)
xlabel('input 1 (gaussmf)')


%Entrenamiento del sistema difuso mediante anfis
[fistrn,error] = anfis([X Y],fis);

%Simulation
Ys = evalfis(X,fistrn);

%Results
figure
hold on
plot(Y,'r')
plot(Ys,'b')
hold off
xlabel('Tiempo (seg)'); ylabel('x(t)');
title('Heart fis');
legend('Reales', 'Simulados')

%Plot Error
e = Y - Ys;
figure
plot(e)
xlabel('Tiempo (seg)'); ylabel('e(t)');
title('Error');

%MSE
N = length(e);
MSE = (1/N)*sum(e.^2)
