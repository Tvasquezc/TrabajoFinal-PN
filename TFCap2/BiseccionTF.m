function [s,E,fm] = BiseccionTF()
syms x
f = input("Ingrese la funcion:");%-0.0147+0.352*(0.5*pi*0.19^2-0.19^2*asin(x/0.19)-x*sqrt(0.19^2-x^2));
xi = input("Ingrese el intervalo xi:");% 0<x<xs
xs = input("Ingrese el intervalo xs:");% xi<x<0.19
Tol = input("Ingrese la toleracia:");% 0.5e-5
niter = input ("Ingrese el numero maximo de iteraciones:");
Terr = input("Ingrese el error que quiere hallar, siendo 0 el error absoluto y 1 el error relativo: ");
x = linspace(xi,xs);
    
    fi=eval(subs(f,xi));
    fs=eval(subs(f,xs));
    if fi==0
        s=xi;
        E=0;
        fprintf('%f es raiz de f(x)',xi)
    elseif fs==0
        s=xs;
        E=0;
        fprintf('%f es raiz de f(x)',xs)
    elseif fs*fi<0
        c=0;
        xm=(xi+xs)/2;
        fm(c+1)=eval(subs(f,xm));
        fe=fm(c+1);
        E(c+1)=Tol+1;
        error=E(c+1);
        N(c+1)=c;
        while error>Tol && fe~=0 && c<niter
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs));
            else
                xi=xm;
                fi=eval(subs(f,xi));
            end
            xa(c+2)=xm;
            xm=(xi+xs)/2;
            fm(c+2)=eval(subs(f,xm));
            fe=fm(c+2);
            if Terr==0
                E(c+2)=abs((xm-xa(c+2)));
            else
                E(c+2)=abs((xm-xa(c+2))/xm)
            end
            error=E(c+2);
            N(c+2)=(c+1);
            c=c+1;
        end
        if fe==0 && c==0
           s=xm;
           fprintf('%f es raiz de f(x)\n',xm)
        elseif fe==0
            s=xm;
           fprintf('%f es raiz de f(x)\n',xm)
           disp(['   n       Xa        F         E'])
            D= [N' xa' fm' E'];
            disp(D)
        elseif error<Tol
           s=xm;
           fprintf('%f es una aproximación de una raiz de f(x) con una tolerancia= %f\n',xm,Tol)
          
           
        else 
           s=xm;
           fprintf('Fracasó en %f iteraciones \n',niter)
          
        end
    else
       fprintf('El intervalo es inadecuado\n')         
    end
    Tabla=table(N',xa',fm',E','variableNames',{'n','xa','F','E'});
    disp(Tabla);
    title('Método Bisección')
        xlabel('x') 
        ylabel('f(x)') 
        hold on
        grid on
    p = eval(subs(f,x));
    plot(x,p,'r')
    
    %line([0,0], ylim;, 'Color', 'k', 'LineWidth', 2); 
    line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5); 
    scatter(s,eval(subs(f,s)),'ko')   
end