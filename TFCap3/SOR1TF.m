function  [E,s,c] = SOR()
A=input('ingrese la matriz A: ');
b=input('ingrese el vector de terminos independientes (sin transponer): ');
b=b';
x0=input('ingrese un vector aproximado a la solucion (sin transponer): ');
x0=x0';
Tol=input('ingrese la tolerancia: ');
niter=input('ingrese numero maximo de iteraciones: ');
Terr=input('ingrese el tipo de norma 0 pra infinita, 1 para cuadrada: ');
w=input('ingrese el valor de w 0<w<2: ');
        n(1)=0;
        c=n(1);
        mx=x0';
        error=Tol+1;
        D=diag(diag(A));
        L=-tril(A,-1);
        U=-triu(A,+1);
        E(c+1)=1;
         while error>Tol && c<niter
    
            T=inv(D-w*L)*((1-w)*D+w*U);
            C=w*inv(D-w*L)*b;
            x1=T*x0+C;
            if Terr==0
            E(c+2)=norm(x1-x0,'inf');
            else
                E(c+2)=norm(x1-x0,'inf');
            end
            error=E(c+2);
            mx=[mx;x1'];
            x0=x1;
            n(c+2)=c+1;
            c=n(c+2);
        end
        if error < Tol
            s=x0;
            fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
        else 
            s=x0;
            fprintf('Fracasó en %f iteraciones',niter) 
        end
        fprintf(', el vector:\n');
    disp(s);
    disp('la tabla de iteraciones es:');
    Tabla=table(n',E',mx,'variableNames',{'n','error n','vector solucion (con orden x1 x2 x3.....xn)'});
    disp(Tabla);
    
    end
