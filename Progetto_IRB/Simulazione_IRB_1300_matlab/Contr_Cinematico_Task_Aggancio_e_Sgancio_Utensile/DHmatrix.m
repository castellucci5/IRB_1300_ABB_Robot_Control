%% DH matrix code 
%  Questo script permette di ottenere da ogni riga della matrice DH la
%  relativa matrice di traformazione T.
%  Restituisce la funzinoe simbolica A(a,alpha,d,th)
syms alpha th d a real

Ralpha(alpha) = [1 0 0;
    0 cos(alpha) -sin(alpha);
    0 sin(alpha) cos(alpha)];

Rth(th) = [cos(th) -sin(th) 0;
    sin(th) cos(th) 0;
    0 0 1];

D = [0 0 d]';
Av = [a 0 0]';

A1(th,d) = [ Rth D;
    0 0 0 1];
A2(alpha,a) = [Ralpha Av;
    0 0 0 1];

A(a, alpha, d, th) = A1(th,d)*A2(alpha,a);
