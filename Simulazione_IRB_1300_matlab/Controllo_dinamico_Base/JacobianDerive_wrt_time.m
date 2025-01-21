%% Derivata del Jacobiano rispetto al Tempo 
clear;
clc;

% Inizializzazione variabili simboliche 
syms t th1 th2 th3 th4 th5 th6 dth1 dth2 dth3 dth4 dth5 dth6 ddth1 ddth2 ddth3 ddth4 ddth5 ddth6 real
syms q1 q2 q3 q4 q5 q6 dq1 dq2 dq3 dq4 dq5 dq6 ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 real

% Importazione delle matrici omogenee T01 ... T06 calcolate con la
% convenzione DH 
load H_Matrix_ABBirb1300;

% importazione dei jacobiani geometrici calcolati
load J_Jp_Jo_irb1300.mat;

% dichiarazione della dipendenza da t delle variabili di giunto 
 q1 = symfun('q1(t)',t);
 q2 = symfun('q2(t)',t);
 q3 = symfun('q3(t)',t);
 q4 = symfun('q4(t)',t);
 q5 = symfun('q5(t)',t);
 q6 = symfun('q6(t)',t);

% Sostituzione theta con q
Jp = subs(Jp, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
Jo = subs(Jo, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);

var_long_q = sym({diff(q1,t,2),diff(q1,t),q1,diff(q2,t,2), diff(q2,t),q2,...
     diff(q3,t,2),diff(q3,t),q3,diff(q4,t,2), diff(q4,t),q4,...
     diff(q5,t,2),diff(q5,t),q5,diff(q6,t,2),diff(q6,t),q6});

var_short_q = sym({'DDq1','Dq1','q1','DDq2','Dq2','q2','DDq3','Dq3','q3',...
                 'DDq4','Dq4','q4','DDq5','Dq5','q5','DDq6','Dq6','q6'});

var_theta = sym({'ddth1', 'dth1', 'th1', 'ddth2', 'dth2', 'th2', 'ddth3', 'dth3', 'th3',...
    'ddth4', 'dth4', 'th4', 'ddth5', 'dth5', 'th5', 'ddth6', 'dth6', 'th6'});
 

DJp = diff(Jp, t);
DJp = subs(DJp,var_long_q,var_short_q);

% Il DJp seguente viene utilizzato nel blocco DJa del controllo dinamico 
DJp = subs(DJp, var_short_q, var_theta);

Jp = subs(Jp, var_long_q, var_theta);

DJo = diff(Jo, t);
DJo = subs(DJo, var_long_q, var_short_q );

% Il DJo seguente può essere utilizzato nel blocco DJa del controllo
% dinamico se si implementa il controllo dell'orientazione
DJo = subs(DJo, var_short_q, var_theta);

Jo = subs(Jo, var_long_q, var_theta);
