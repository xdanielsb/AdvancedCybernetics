%{
    Model the following system
    y' = 2t
%}

tspan = [0, 5];
y0 = 0;
[t,y] = ode45(@(t,y) 2*t, tspan, y0)


plot(t,y, '-o')