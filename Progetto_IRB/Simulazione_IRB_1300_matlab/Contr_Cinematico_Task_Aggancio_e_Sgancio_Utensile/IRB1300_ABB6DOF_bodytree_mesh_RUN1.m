%% Nome file: IRB1300_ABB6DOF_bodytree_mesh_RUN1.m

clear % Pulizia Workspace
clc   % Pulizia console 

% Quote del robot in [m] per la realizzazione della matrice DH
r0 = 0.050; % spostamento sull'asse x rispetto alla base della terna sul link 1  
r1 = 0.544;
r2 = 0.425;
r3 = 0.040;
r4 = 0.150;
r5 = 0.515-0.090-0.150;
r6 = 0.090 + 0.090; 
% aggiunta di 0.090mm a r6 per tenere conto dello spostamento della terna
% dovuta al Montaggio del gruppo pinza di 0.090 mm 

% Matrice DH 

DH = [ %      a        alfa              d         theta offset 
             r0,       pi/2,            r1,           0;
             r2,          0,             0,        pi/2;
             r3,       pi/2,             0,           0;
              0,      -pi/2,         r4+r5,           0;
              0,       pi/2,             0,           0; 
              0,          0,            r6,           0;
     ]; 




Irb1300 = robotics.RigidBodyTree; % Creazione dell’oggetto RigidBodyTree per la costruzione del robot
addVisual(Irb1300.Base,"Mesh",'mesh_IRB1300/base_link.stl'); % inserimento della mesh 3D della base, in formato “.stl”
body1 = robotics.RigidBody('body1'); % Creazione della rigid.body per ogni link del robot
addVisual(body1,"Mesh",'mesh_IRB1300/link_1.stl'); % Inserimento della mesh 3D del primo link, in formato “.stl”
jnt1 = robotics.Joint('jnt1','revolute'); % definizione del giunto 1, come giunto di tipo revolute (rotazionale) 
setFixedTransform(jnt1, DH(1,:), 'dh'); % Definizione delle relazioni (trasformazioni) tra link, utilizzando i parametri della matrice DH.
% Crezione e aggiunta delle rigidbody di ogni link alla RigidBodyTree: Irb1300
% Ogni trasformazione fissa 
% è relativa al sistema di riferimento del giunto precedente

body2 = robotics.RigidBody('body2');
addVisual(body2,"Mesh",'mesh_IRB1300/link_2.stl');
jnt2 = robotics.Joint('jnt2','revolute');
jnt2.HomePosition = pi/2; % Viene impostata la posizione iniziale + pi/2 sul secondo giunto in modo permanente
setFixedTransform(jnt2,DH(2,:),'dh');

body3 = robotics.RigidBody('body3');
addVisual(body3,"Mesh",'mesh_IRB1300/link_3.stl');
jnt3 = robotics.Joint('jnt3','revolute');
setFixedTransform(jnt3,DH(3,:),'dh');


body4 = robotics.RigidBody('body4');
addVisual(body4,"Mesh",'mesh_IRB1300/link_4.stl');
jnt4 = robotics.Joint('jnt4','revolute');
setFixedTransform(jnt4,DH(4,:),'dh');

body5 = robotics.RigidBody('body5');
addVisual(body5,"Mesh",'mesh_IRB1300/link_5.stl');
jnt5 = robotics.Joint('jnt5','revolute');
setFixedTransform(jnt5,DH(5,:),'dh');

body6 = robotics.RigidBody('body6');
addVisual(body6,"Mesh",'mesh_IRB1300/link_6.stl');
jnt6 = robotics.Joint('jnt6','revolute');
setFixedTransform(jnt6,DH(6,:),'dh');

% Associazione del giunto alla rigidbody del link corrispondente
body1.Joint = jnt1;
body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = jnt5;
body6.Joint = jnt6;

 
% Associazione della massa alla rigidbody del link corrispondente
body1.Mass=22.716;
body2.Mass=19.752;
body3.Mass=6.63165;
body4.Mass=5.54295;
body5.Mass=0.90696;
body6.Mass=0.283185; % Massa link_6 + Pinza_Hsk                  
                  

% Definizioni delle origini del centro di massa = [x , y, z]
body1.CenterOfMass=[-0.036497 -0.14933 -0.0023116];
body2.CenterOfMass=[-0.25758 0.0087787 1.2193E-06];
body3.CenterOfMass=[-0.028609 0.0013664 0.005576];
body4.CenterOfMass=[0.0012847 0.15674 0.0021747];
body5.CenterOfMass=[5.8483E-05 -0.0089428 0.02235];
body6.CenterOfMass=[-0.0075113 8.3244E-05 -0.056129];

% Matrici dei Momenti di inerzia [Kg *m^2] -> [Ixx Iyy Izz Iyz Ixz Ixy] 
body1.Inertia = [0.282405 0.20292 0.24882 -0.066333 -0.010274 -0.028962];
body2.Inertia = [0.145509 0.60138 0.52113 5.5480E-05 0.0064972 -0.0040878];
body3.Inertia = [0.0338775 0.038886 0.02225 -5.2326E-06 -0.0023223 0.00016443];
body4.Inertia = [0.044193 0.00931725 0.046155 0.00340035 0.000104623 -0.00032541];
body5.Inertia = [0.001565 0.00163875 0.00079443 -0.00016479 3.4551E-06 -8.8401E-08];
body6.Inertia = [0.00022938 0.000143523 0.00019938  7.2019E-08 1.091145E-05 -8.8857E-08];

% Mediante la funzione addBody() viene popolata la rigid body
addBody(Irb1300,body1,'base');
addBody(Irb1300,body2,'body1');
addBody(Irb1300,body3,'body2');
addBody(Irb1300,body4,'body3');
addBody(Irb1300,body5,'body4');
addBody(Irb1300,body6,'body5');

% Verfica della rigid body 
showdetails(Irb1300) 

% Assegnazione della configurazione di riposo alla variabile config
config = homeConfiguration(Irb1300);

% Visualizzazione grafica della configurazione di riposo
show(Irb1300, config);

% OPZIONALE:
% Il comando seguente con 'visual','off' permette di spegnere la mesh e
% visualizzare le terne 
% show(Irb1300, config, 'visual', 'off');


% Mediante getTransform() si ottiene la posa dell'end effector rispetto
% alla base (T06) di dimensione [4x4]
T06 = getTransform(Irb1300,config,'body6','base'); 

clear DH; 
