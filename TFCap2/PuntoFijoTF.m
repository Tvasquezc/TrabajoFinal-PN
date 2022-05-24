function [n,xn,fm,E] = PuntoFijoTF()
    syms x
f = input("Ingrese la funcion f:");
g = input("Ingrese la funcion g:");
x0 = input("Ingrese x0:");
Tol = input("Ingrese la toleracia:"); 
niter = input ("Ingrese el numero maximo de iteraciones:");
Terr = input("Ingrese el error que quiere hallar, siendo 0 el error absoluto y 1 el error relativo: ");
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        E(c+1)=Tol+1;
        error=E(c+1);
        xn(c+1)=x0;
        N(c+1)=c;
        while error>Tol && fe~=0 && c<niter
            xn(c+2)=eval(subs(g,x0));
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            if Terr==0
                E(c+2)=abs(xn(c+2)-x0);
            else
                E(c+2)=abs((xn(c+2)-x0)/x0);
            end
            error=E(c+2);
            x0=xn(c+2);
            N(c+2)=(c+1);
            c=c+1;
        end
        if fe==0
           n=x0;
           fprintf('%f es raiz de f(x)',x0)
           
        elseif error<Tol
           n=x0;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f',x0,Tol)
          
        else 
           n=x0;
           fprintf('Fracasó en %f iteraciones',niter) 
        end  
        
         Tabla=table(N',xn',fm',E','variableNames',{'n','xa','F','E'});
         disp(Tabla);
        title('Método Punto Fijo')
        xlabel('x') 
        ylabel('f(x)') 
        hold on
        grid on
        x = linspace(0,0.19);% Intervalo de Grafica
        y = eval(subs(f,x));
        h=x;
        y1= eval(subs(g,x));
        plot (x,y,'r',x,y1,'b',x,h,'k')
        line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5);
        scatter(n,eval(subs(f,n)),'ko');
        
end