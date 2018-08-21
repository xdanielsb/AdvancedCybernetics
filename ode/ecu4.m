%{
    y' + f(t)y(t) = g(t)
   AbsTol y RelTol para especificar las tolerancias de error absoluta y relativa, o la opción Mass para proporcionar una matriz de masas.
%}
clc
clear all
close all

ft = linspace(0,5,25);
f = ft.^2 - ft -3;

gt = linspace(1, 6, 25);
g = 3*sin(gt-0.25);

tspan = [1 5];
ic = 1;
opts = odeset('RelTol',1e-2,'AbsTol',1e-4);
[t,y] = ode45(@(t,y) myode(t,y,ft,f,gt,g), tspan, ic, opts); 

plot(t,y)
function dydt = myode(t,y,ft,f,gt,g)
    f = interp1(ft,f,t); % Interpolate the data set (ft,f) at time t
    g  = interp1(gt,g,t); % Interpolate the data set (gt,g) at time t
    dydt = -f.*y + g; % Evaluate ODE at time t
end 

