%% Nome file: IRB1300_ABB6DOF_parametri_RUN2.m

load H_Matrix_ABBirb1300;

syms th1 th2 th3 th4 th5 th6 real
syms q1 q2 q3 q4 q5 q6 real

T01 = subs(T01, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T02 = subs(T02, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T03 = subs(T03, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T04 = subs(T04, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T05 = subs(T05, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);
T06 = subs(T06, [th1 th2 th3 th4 th5 th6], [q1 q2 q3 q4 q5 q6]);

% Quote del robot in [m] per la realizzazione della matrice DH
r0 = 0.050; % Spostamento sull'asse x del link 1 rispetto alla terna di base 
r1 = 0.544;
r2 = 0.425;
r3 = 0.040;
r4 = 0.150;
r5 = 0.515-0.090-0.150;
r6 = 0.090 + 0.090;

% Matrice DH 
DH = [ %      a       alfa              d          theta offset 
             r0,       pi/2,            r1,           0;
             r2,          0,             0,        pi/2;
             r3,       pi/2,             0,           0;
              0,      -pi/2,         r4+r5,           0;
              0,       pi/2,             0,           0; 
              0,          0,            r6,           0;
     ]; 

TH = [th1 th2 th3 th4 th5 th6]';

% Proprietà dei link

% Link 1

% Massa del link
rb.m(1) = 22.716;

% Matrice di inerzia
rb.I(:,:,1) = [0.282405      -0.028962   -0.010274;
               -0.028962          0.20292    -0.066333;
               -0.010274          -0.066333       0.24882]; 

% Link 2
rb.m(2) = 19.752;
rb.I(:,:,2) = [0.145509    -0.0040878    0.0064972;       
              -0.0040878         0.60138      5.5480E-05;
               0.0064972         5.5480E-05         0.52113];

% Link 3
rb.m(3) = 6.63165;
rb.I(:,:,3) = [0.0338775         0.00016443        -0.0023223;       
               0.00016443              0.038886        -5.2326E-06;
               -0.0023223             -5.2326E-06            0.02225];

% Link 4
rb.m(4) = 5.54295;
rb.I(:,:,4) = [0.044193    -0.00032541            0.000104623;       
               -0.00032541             0.00931725         0.00340035;
               0.000104623   0.00340035          0.046155];
% Link 5
rb.m(5) = 0.60464;
rb.I(:,:,5) = [0.001565        -8.8401E-08      3.4551E-06;       
               -8.8401E-08           0.00163875       -0.00016479;
               3.4551E-06           -0.00016479            0.00079443];

% Link 6
rb.m(6) = 0.28318;
rb.I(:,:,6) = [0.00022938        -8.8857E-08         1.091145E-05;       
               -8.8857E-08             0.000143523         7.2019E-08;
                1.091145E-05             7.2019E-08                0.00019938];

% Definizione dei centri di massa di ogni link rispetto alla terna locale
rb.r (:,:,1) = [-0.036497 -0.14933 -0.0023116].';
rb.r (:,:,2) = [-0.25758 0.0087787 1.2193E-06].';
rb.r (:,:,3) = [-0.028609 0.0013664 0.005576].';
rb.r (:,:,4) = [0.0012847 0.15674 0.0021747].';
rb.r (:,:,5) = [5.8483E-05 -0.0089428 0.02235].';
rb.r (:,:,6) = [-0.0075113 8.3244E-05 -0.056129].';


busInfo2 = Simulink.Bus.createObject(rb);

