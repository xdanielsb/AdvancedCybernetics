
% Datos  Find serie de Data

Y = Datos(:,5);
X = Datos(:,1:2);

figure
plot(Y);
xlabel('Tiempo (seg)'); ylabel('x(t)');
title('Mackey-Glass serie de tiempo ca�tica');

%Generaci�n del sistema difuso a emplear
fis = genfis1(Datos, 2);

%Presentaci�n de las funciones de pertenec�a empleados
figure
for input_index=1:4,
    subplot(2,2,input_index)
    [x,y]=plotmf(fis,'input',input_index);
    plot(x,y)
    axis([-inf inf 0 1.2]);
    xlabel(['Input ' int2str(input_index)]);
end

%Entrenamiento del sistema difuso mediante anfis
[fistrn,error] = anfis(Datos,fis);

%Presentaci�n de las funciones de pertenencia
figure
for input_index=1:4,
    subplot(2,2,input_index)
    [x,y]=plotmf(fistrn,'input',input_index);
    plot(x,y)
    axis([-inf inf 0 1.2]);
    xlabel(['Input ' int2str(input_index)]);
end

%Simulaci�n del sistema
Ys = evalfis(X,fistrn);

%Presentaci�n de resultados
figure
hold on
plot(Y,'r')
plot(Ys,'b')
hold off
xlabel('Tiempo (seg)'); ylabel('x(t)');
title('Mackey-Glass serie de tiempo ca�tica');
legend('Reales', 'Simulados')

%Figura del error
e = Y - Ys;
figure
plot(e)
xlabel('Tiempo (seg)'); ylabel('e(t)');
title('Error');

%Error cuadr�tico medio
N = length(e);
MSE = (1/N)*sum(e.^2)
