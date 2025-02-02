%% Nome file: MatriceDH_Robot_irb1300.m


bdclose all
close all
clear all
clc

syms th1 th2 th3 th4 th5 th6 real
r0 = 0.050; % spostamento sull'asse x rispetto alla base della terna sul link 1  
r1 = 0.544;
r2 = 0.425;
r3 = 0.040;
r4 = 0.150;
r5 = 0.515-0.090-0.150;
r6 = 0.090 + 0.090; 
 % aggiunta di 0.090mm a r6 per tenere conto dello spostamento della terna
 % dovuta al Montaggio del gruppo pinza di 0.090 mm 

DH = [
 %      a        alfa          d              theta     
        r0,      pi/2,        r1,             th1;
        r2,         0,         0,        th2+pi/2;
        r3,      pi/2,         0,             th3;
        0,      -pi/2,     r4+r5,             th4;
        0,       pi/2,         0,             th5;
        0,          0,        r6,             th6;
        ];


% Escuzione dello script DHmatrix.m
DHmatrix;

% Matrici di trasformazione omogenee
i = 1;
T01 = A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
i = 2;
T02 = T01*A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
i = 3;
T03 = T02*A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
i = 4;
T04 = T03*A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
i = 5;
T05 = T04*A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));
i = 6;
T06 = T05*A(DH(i,1),DH(i,2),DH(i,3),DH(i,4));

Q = [th1 th2 th3 th4 th5 th6]';

% jacobiano di posizione [3x6]
Jp = jacobian(T06(1:3,4),Q);


z0 = [0 0 1]';
z1 = T01(1:3,1:3)*z0;
z2 = T02(1:3,1:3)*z0;
z3 = T03(1:3,1:3)*z0;
z4 = T04(1:3,1:3)*z0;
z5 = T05(1:3,1:3)*z0;

% jacobiano di orientazione [3x6]
Jo = [z0 z1 z2 z3 z4 z5];

%jacobiano totale [6x6]
J = [Jp; Jo];

save('H_Matrix_ABBirb1300.mat', 'T01', 'T02','T03','T04','T05','T06');
save('J_Jp_Jo_irb1300.mat','J','Jo','Jp');