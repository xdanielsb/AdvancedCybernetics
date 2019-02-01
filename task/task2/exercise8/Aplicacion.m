%Ejemplo aplicaci�n ANFIS
%ANFIS: Adaptive Neuro-Fuzzy training of Sugeno-type FIS.
%Signal triangular a seno
 
%Simulacion del sistema
sim('DatosSignals');
 
%Se�al de entrada
x = simout(:,1);
 
%Se�al de salida
y = simout(:,2);
 
%Gr�fica de la se�al
figure
hold on
plot(x,'r');
plot(y,'b');
hold off
 
%�pocas de entrenamiento 
epoch_n = 250;
 
%Generaci�n del sistema difuso
%in_fis  = genfis1([x y],5,'gbellmf','constant');
in_fis  = genfis1([x y],5,'gbellmf','linear');
 
%Entrenamiento del sistema difuso
out_fis = anfis([x y],in_fis,epoch_n);
 
%Resultado del entrenamiento
ys = evalfis(x,out_fis);
 
%Resultados
figure
hold on
plot(x,'r');
plot(y,'b');
plot(ys,'g');
hold off
legend('Triangular','Seno','ANFIS');
 
%Figura del error
e=y-ys;
figure
plot(e)
 
%Error cuadr�tico medio
N = length(e);
ECM = (1/N)*sum(e.^2)
