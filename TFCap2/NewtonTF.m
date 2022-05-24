function [n,xn,fm,dfm,E] = NewtonTF()
    syms x
f = input("Ingrese la funcion f:");
x0 = input("Ingrese x0:");
Tol = input("Ingrese la toleracia:"); 
niter = input ("Ingrese el numero maximo de iteraciones:");

        df=diff(f);
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm = eval(subs(df,x0));
        dfe=dfm;
        E(c+1)=Tol+1;
        error=E(c+1);
        xn(c+1)=x0;
        N(c+1)=c;
        while error>Tol && fe~=0 && dfe~=0 && c<niter
            xn(c+2)=x0-fe/dfe;
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            dfm=eval(subs(df,xn(c+2)));
            dfe=dfm;
            E(c+2)=abs((xn(c+2)-x0)/(xn(c+2)));
            error=E(c+2);
            x0=xn(c+2);
            N(c+2)=(c+1);
            c=c+1;
               
        end
        if fe==0
           n=x0;
           fprintf('%f es raiz de f(x) \n',x0)
          
   

        elseif error<Tol
           n=x0;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',x0,Tol)
         

        elseif dfe==0
           n=x0;
           fprintf('%f es una posible raiz múltiple de f(x) \n',x0)
          
          
        else 
           n=x0;
           fprintf('Fracasó en %f iteraciones \n',niter)
         
            
        end
         Tabla=table(N',xn',fm',E','variableNames',{'n','xa','F','E'});
         disp(Tabla);
        title('Método Punto Fijo')
        title('Método Newton')
        xlabel('x') 
        ylabel('f(x)') 
        hold on
        grid on
         x = linspace(0,0.19);% Intervalo de Grafica
        y = eval(subs(f,x));
        plot (x,y,'r')
        
        line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5);
        scatter(n,eval(subs(f,n)),'o');
end