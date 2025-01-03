%%  nome file: RUN2_irb1300_parameters

%% Irb 1300 Model %%
%clear; clc;

load H_Matrix_ABBirb1300;

syms th1 th2 th3 th4 th5 th6 real
syms q1 q2 q3 q4 q5 q6 real

T01 = subs(T01, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T02 = subs(T02, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T03 = subs(T03, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T04 = subs(T04, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T05 = subs(T05, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T06 = subs(T06, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);

% DH tabel a alpha d th
r0 = 0.050; % spostamento sull'asse x rispetto alla base, della terna sul link 1  
r1 = 0.544;
r2 = 0.425;
r3 = 0.040;
r4 = 0.150;
r5 = 0.515-0.090-0.150;
r6 = 0.090 + 0.090;


DH = [ %      a       alfa              d          theta offset 
             r0,       pi/2,            r1,           0;
             r2,          0,             0,        pi/2;
             r3,       pi/2,             0,           0;
              0,      -pi/2,         r4+r5,           0;
              0,       pi/2,             0,           0; 
              0,          0,            r6,           0;
     ]; 

TH = [th1 th2 th3 th4 th5 th6]';

% a = char (0, 0, 0, 0, 0, 0) ;
% x = zeros (6,1) ;
% DH = struct ('a', x, 'alpha', x, 'd', x, 'thetaoffset', x, 'type', a) ;

%busInfol = Simulink. Bus. createObject (DH) ;

%TH = [pi pi/2 0 0 pi pi/5]';
% numeric_T(from, to, DH, q)
% T_06 = numeric_T (0,6 , DH, TH);

% Link properties

% Link 1

%mass of the link
rb.m(1) = 15.144;

% Inertial matrix
rb.I(:,:,1) = [0.18827      0               0;
               0            0.13528         0;
               0            0         0.16588]; 

% Link 2
rb.m(2) = 13.168;
rb.I(:,:,2) = [0.097006   0                0;       
               0          0.40092          0;
               0          0          0.34742];

% Link 3
rb.m(3) = 4.4211;
rb.I(:,:,3) = [0.022585       0                     0;       
               0               0.025924             0;
               0               0             0.014833];

% Link 4
rb.m(4) = 3.6953;
rb.I(:,:,4) = [0.0029462    0                       0;       
               0             0.0062115              0;
               0             0                0.03077];
% Link 5
rb.m(5) = 0.60464;
rb.I(:,:,5) = [0.0010433     0                       0;       
               0             0.0010925               0;
               0             0              0.00052962];

% Link 6
rb.m(6) = 0.18879;
rb.I(:,:,6) = [0.00015292       0                          0;       
               0                9.5682E-05                 0;
               0                0                 0.00013292];

% centers of mass w.r.t. its i frame
rb.r (:,:,1) = [-0.036497 -0.14933 -0.0023116].';
rb.r (:,:,2) = [-0.25758 0.0087787 1.2193E-06].';
rb.r (:,:,3) = [-0.028609 0.0013664 0.005576].';
rb.r (:,:,4) = [0.0012847 0.15674 0.0021747].';
rb.r (:,:,5) = [5.8483E-05 -0.0089428 0.02235].';
rb.r (:,:,6) = [-0.0075113 8.3244E-05 -0.056129].';


busInfo2 = Simulink.Bus.createObject(rb);


%% To control in the joint space 
%% questa parte viene utilizzata nel controllo dinamico 
%% nello spazio dei giunti per controllare i PD

Kp = [0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0];


Kd = [0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0
      0 0 0 0 0 0];