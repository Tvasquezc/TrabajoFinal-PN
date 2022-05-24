x=input('ingrese el vector traspuesto: ');%[200; 400; 600; 800; 1000];
y=input('ingrese el vector traspuesto: ');%[2.3; 8.5; 18.6; 32.4; 51.7];
[coeficientes] = Spline(x,y,1)
xpol1=200:0.001:400;
xpol2=400:0.001:600;
xpol3=600:0.001:800;
xpol4=800:0.001:1000;

p1=coeficientes(1,1)*xpol1+coeficientes(1,2);
p2=coeficientes(2,1)*xpol2+coeficientes(2,2);
p3=coeficientes(3,1)*xpol3+coeficientes(3,2);
p4=coeficientes(4,1)*xpol4+coeficientes(4,2);

figure
title('Spline Lineal')
xlabel('Caudal(gpm)') 
ylabel('Perdida de Carga(ft)') 
hold on
grid on
plot(x,y,'ko',xpol1,p1,'b',xpol2,p2,'b',xpol3,p3,'b',xpol4,p4,'b')