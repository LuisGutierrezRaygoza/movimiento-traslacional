clc;
clear;
valor = 1;
tinicial = 0;
if(valor == 1)
tfinal = 10;
end
if(valor == 2)
tfinal = 10;
end
paso = .0001;
duracion = (tinicial:paso:tfinal);
inicial = [0,0,0,0];
[t,x] = ode45(@odefun,duracion, inicial);
figure(1)
plot(t,x(:,1));
hold on
plot(t,x(:,2));
hold off
grid on
title("Posición")
xlabel("Tiempo")
ylabel("Metros")
legend('X1','X2')

figure(2)
plot(t,x(:,3));
hold on
plot(t,x(:,4));
hold off
grid on
title("Velocidad")
xlabel("Tiempo")
ylabel("Metros/Segundo")
legend('X1','X2')



function dx= odefun(t,x)
valor = 1;
m1 = 290;
b1 = 1000;
m2 = 59;
k1 = 16182;
f = 0;
k2 = 19000;
if(valor == 1)
z = 0.05*sin(.5*pi*t);
end
if(valor == 2)
    z = 0.05*sin(20*pi*t);
end
dx = zeros(4,1);
dx(1) = x(3);
dx(2) = x(4);
dx(3) = (1/m1)*(-b1*x(3)+b1*x(4)-k1*x(1)+k1*x(2)+f);
dx(4) = (1/m2)*(b1*x(3)-b1*x(4)+k1*x(1)-(k1+k2)*x(2)-f+k2*z);
end
