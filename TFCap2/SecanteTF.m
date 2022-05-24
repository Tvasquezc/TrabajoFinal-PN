function [s,xn,n,fn,E] = SecanteTF()
syms x
f = input("Ingrese la funcion f: ");
x0 = input("Ingrese el valor de x0: ");
x1 = input("Ingrese el valor de x1: ");
niter = input("Ingrese el numero maximo de iteraciones: ");
Tol = input("Ingrese el valor de la tolerancia: ");
c=0;
xn1(c+1)=x1;
xn0(c+1)=x0;
xn1=xn1(c+1);
xn0=xn0(c+1);
fn(c+1) = eval(subs(f,xn1));
fm(c+1) = eval(subs(f,xn0));
fe= fn(c+1);
fd= fm(c+1);
E(c+1) = Tol+1;
error= E(c+1);
N(c+1)=c; 
while error >= Tol && c<niter && fe~=0
    xn(c+2)= xn1-((fe*(xn1-xn0))/(fe-fd));
    fn(c+2) = eval(subs(f,xn(c+2)));
    fm(c+2) = eval(subs(f,xn1));
    fe = fn(c+2);
    fd = fm(c+2);
    E(c+2) = abs(xn(c+2)-xn1);
    xn0=xn1;
    error=E(c+2);
    xn1=xn(c+2);
    N(c+2)=(c+1);
    c=c+1;
end
if fe==0;
    s=xn1;
    n=c;
    fprintf('%f es raiz de f(x) \n',xn1)
    
            elseif error<Tol
           s=xn1;
           n=c;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',xn1,Tol)
           
     
elseif fn-fm==0
       s=xn1;
       n=c;
       fprintf('%f es una posible raiz múltiple de f(x) \n',xn1)
else 
   s=xn1;
   n=c;
   fprintf('Fracasó en %f iteraciones \n',niter) 
end
      Tabla=table(N',xn',fn',E','variableNames',{'n','xa','F','E'});
         disp(Tabla);
        title('Método Secante')
        xlabel('x') 
        ylabel('f(x)') 
        hold on
        grid on
        x = linspace(xn1-0.02,xn1+0.02);% Intervalo de Grafica
        y = eval(subs(f,x));
        plot (x,y,'r')
        line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5);
        scatter(s,eval(subs(f,s)),'ko');     
end
    