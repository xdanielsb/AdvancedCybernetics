%{
    Name: Daniel Santos
    Desc: Solution task 1.1
%}
clc; clear all; close all; format compact;
x = 0:0.1:10;
subplot(521); plot(x, smf(x, [0 1])); hold on ; plot(x, zmf(x, [9 10]));
subplot(522); plot(x, trimf(x, [0 1 2 ])); hold on ; plot(x, trimf(x, [2 4 4 ]));
subplot(523); plot(x, trapmf(x, [0 1 2 3 ])); hold on ; plot(x, trapmf(x, [2 4 5 9 ]));
subplot(524); plot(x, gbellmf(x, [2 1 5 ])); hold on ; plot(x, gbellmf(x, [2 3  5 ]));hold on ; plot(x, gbellmf(x, [4 8  5 ]));
subplot(525); plot(x, gaussmf(x, [0.5 5])); hold on ; plot(x, gaussmf(x, [1   5 ]));hold on ; plot(x, gaussmf(x, [ 2 5 ]));
subplot(526); plot(x, gauss2mf(x, [1 2 1 4 ])); hold on ; plot(x, gauss2mf(x, [2 5 1 7 ]));
subplot(527); plot(x, sigmf(x, [10 1])); hold on ; plot(x, sigmf(x, [1 3]));
subplot(528); plot(x, dsigmf(x, [5 2 5 1.1])); hold on ; plot(x, dsigmf(x, [1 3 5 5]));
