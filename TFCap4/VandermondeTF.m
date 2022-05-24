x=input('ingrese el vector y sin trasponer: ');%[200 400 600 800 1000];
y=input('ingrese el vector y sin trasponer: ');%[2.3 8.5 18.6 32.4 51.7];
V=vander(x)
%a=V\y
a=inv(V)*y'
n=length(a);
xx=linspace(min(x),max(x));
yy=a(1)*xx.^4+a(2)*xx.^3+a(3)*xx.^2+a(4)*xx+a(5);                
title('Polinomio Interpolante Basado en sistema de ecuaciones')
xlabel('Caudal(gpm)') 
ylabel('Perdida de Carga(ft)') 
hold on
grid on
plot(xx,yy,'b')
scatter(x,y,'ko')