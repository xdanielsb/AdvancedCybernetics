%{
 name: Daniel Santos
 date: February 5th, 2019
%}
format compact; 
%clear all;
close all; clc; clear all;

%Run simualation: Generate data
sim('DatosSignals');
 
%Input & Output Signal
x = simout(:,1);
y = simout(:,2);
 
%Plot Signal
figure; hold on; plot(x,'r');plot(y,'b');hold off
 
%Epochs
epoch_n = 250;
 
%Fuzzy System
opt = genfisOptions('GridPartition');
opt.NumMembershipFunctions = [5];
opt.InputMembershipFunctionType = ["gbellmf"];
in_fis = genfis(x,y,opt);
[x2,mf] = plotmf(in_fis,'input',1);
plot(x2,mf)
xlabel('input 1 (gaussmf)')

 
%Training fuzzy system
out_fis = anfis([x y],in_fis,epoch_n);
 
%Resultado del entrenamiento
ys = evalfis(x,out_fis);
 
%Resultados
figure;hold on; plot(x,'r'); plot(y,'b'); plot(ys,'g'); hold off
legend('Triangular','Seno','ANFIS');
 
%Figura del error
e=y-ys;
%figure; plot(e)
 
%Error mean cuadratic
N = length(e);
ECM = (1/N)*sum(e.^2)
