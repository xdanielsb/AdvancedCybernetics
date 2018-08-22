%{
    Van der pol ecuation
    y1´´ -u(1 -y1^2)y1´'+ y1 = 0

    writing again with y1´ = y2 we get
    y2´ = u(1 - y1^2)y2 - y1ze
%}

tspan = [0, 20];
y0 = [2 0];
[t, y] = ode45(@vdp1, tspan, y0);
plot( t, y(:,1), '-o', t, y(:,2), '-o')
title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2')

function dydt = vdp1(t,y)
 dydt = [y(2); (1- y(1)^2) * y(2) - y(1)];
end