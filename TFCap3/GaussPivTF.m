%GaussPiv: Calcula la solución de un sistema de ecuaciones Ax=b, ya sea
% sin pivoteo piv=0, usando pivoteo parcial piv=1 o pivoteo totalpiv=2. 
% Donde A es de tamaño nxn y b de tamaño nx1

function [x, mark] = GaussPivTF(A,b,n,Piv)
A = input('Ingrese la matriz A: ');
b = input('Ingrese el vector b: ');
n = input('Ingrese n: ');
Piv = input('sin pivoteo piv=0, usando pivoteo parcial piv=1 o pivoteo totalpiv=2: ');
    Ab=[A b];
    mark=1:1:n;
    for k=1:n-1
        if Piv==1
            Ab=pivpar(Ab,n,k);
        elseif Piv==2
            [Ab, mark]=pivtot(Ab,mark,n,k);
        end
        for i=k+1:n
            M=Ab(i,k)/Ab(k,k);
            for j=k:n+1
                Ab(i,j)=Ab(i,j)-M*Ab(k,j);
            end
        end
    end
    x=sustreg(Ab,n);
    mark;
end