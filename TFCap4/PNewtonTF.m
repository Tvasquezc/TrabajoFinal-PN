x=input('ingrese el vector traspuesto: ');%[200; 400; 600; 800; 1000];
y=input('ingrese el vector traspuesto: ');%[2.3; 8.5; 18.6; 32.4; 51.7];
[Tabla] = Newtonint(x,y)
[pol] = Newtonor(x,diag(Tabla,+1))
xx=linspace(min(x),max(x));
p=pol(1)*xx.^4+pol(2)*xx.^3+pol(3)*xx.^2+pol(4)*xx+pol(5);
figure
title('Polinomio Interpolante de Newton')
xlabel('Caudal(gpm)') 
ylabel('Perdida de Carga(ft)') 
hold on
grid on
plot(x,y,'ko',xx,p,'b')

