%%  Robot manipolator 6 DOF ABB irb 1300
%  Partendo dalla lezione 14 viene costruita la rigidbodytree per IL robot
%  IRB 1300 

clear
clc

% DH tabel a alpha d th
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
r0, pi/2, r1, 0;
r2,   0,  0, 0;
r3, pi/2, 0, 0;
0, -pi/2, r4+r5, 0;
0,  pi/2, 0, 0;%% Offset del giunto 5 rispetto a 4 
0,   0,  r6, 0;
];


Irb1300 = robotics.RigidBodyTree; % create a rigid body tree object to build the robot
addVisual(Irb1300.Base,"Mesh",'mesh_IRB1300/base_link.stl'); % add the 3D mesh to the base, stl format3
body1 = robotics.RigidBody('body1'); %create a rigid.body for each link of the robot
addVisual(body1,"Mesh",'mesh_IRB1300/link_1.stl'); % add the 3D mesh to body1 stl format
jnt1 = robotics.Joint('jnt1','revolute'); % define jnt1 as a revolute joint 
setFixedTransform(jnt1, DH(1,:), 'dh'); % this is used to specify the body-to-body transformation using DH-parameters
 
% Create and add other rigid bodies to the robot. Specify the previous body
% name when calling addBody to attach it. Each fixed transform is relative 
% to the previous joint coordinate frame.
body2 = robotics.RigidBody('body2');
addVisual(body2,"Mesh",'mesh_IRB1300/link_2.stl');
jnt2 = robotics.Joint('jnt2','revolute');
jnt2.HomePosition = pi/2; % set home position different from 0 permanently viene configurato in config
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

body1.Joint = jnt1;
body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = jnt5;
body6.Joint = jnt6;

body1.Mass=15.144;
body2.Mass=13.168;
body3.Mass=4.4211;
body4.Mass=3.6953;
body5.Mass=0.60464;
body6.Mass=0.18879; %% Massa link_6 + Pinza_Hsk

% Origin_CenterOfMass = [x , y, z]
body1.CenterOfMass=[-0.036497 -0.14933 -0.0023116];
body2.CenterOfMass=[-0.25758 0.0087787 1.2193E-06];
body3.CenterOfMass=[-0.028609 0.0013664 0.005576];
body4.CenterOfMass=[0.0012847 0.15674 0.0021747];
body5.CenterOfMass=[5.8483E-05 -0.0089428 0.02235];
body6.CenterOfMass=[-0.0075113 8.3244E-05 -0.056129];

% Moment of inertia (Kg *m^2) =  [Ixx Iyy Izz Iyz Ixz Ixy] 
body1.Inertia=[0.18827    0.13528     0.16588      -0.044222      -0.0068491     -0.019308]; % [Ixx Iyy Izz Iyz Ixz Ixy]
body2.Inertia=[0.097006   0.40092     0.34742       3.6986E-05     0.0043308     -0.0027252];
body3.Inertia=[0.022585   0.025924    0.014833     -3.4884E-06    -0.0015482      0.00010962];
body4.Inertia=[0.029462   0.0062115   0.03077       0.0022669      6.9749E-05    -0.00021694];
body5.Inertia=[0.0010433  0.0010925   0.00052962   -0.00010986     2.3034E-06    -5.8934E-08];
body6.Inertia=[0.00015292 9.5682E-05  0.00013292    4.8014E-08     7.2743E-06    -5.9238E-08];

% call add body to attach the first body joint to the base frame and
% consequently to the other
addBody(Irb1300,body1,'base');
addBody(Irb1300,body2,'body1')
addBody(Irb1300,body3,'body2')
addBody(Irb1300,body4,'body3')
addBody(Irb1300,body5,'body4')
addBody(Irb1300,body6,'body5')

% Verify that your robot was built properly by using the showdetails or show
% function. showdetails lists all the bodies in the MATLAB® command window. 
% show displays the robot with a given configuration (home by default). 
% Calls to axis modify the axis limits and hide the axis labels.
showdetails(Irb1300)

% config=6×2 struct
%   JointName
%   JointPosition

% homeConfiguration returns the home configuration of the robot model with
% q vector [0]^T
config = homeConfiguration(Irb1300);
% set config as a struct and define the joint value (2).jointPosition
% config(2).JointPosition = pi/2;

 show(Irb1300, config);
% il comando seguente con 'visual','off' permette di spegnere la mesh e
% visualizzare le terne 
% show(Irb1300, config, 'visual', 'off');

%end effector pose specified by a 4x4 Homogeneous matrix T06
T06 = getTransform(Irb1300,config,'body6','body1'); 

clear DH;
% nella lezione 24 in cui prepara i file per il controllo dinamico 
%perchè nel File RUN2_Irb120_parameters.m riutilizza nuovamente la mmatrice
% DH

%% set new configuration
% newConfig = config;
% newConfig(2).JointPosition = pi;
% newConfig(4).JointPosition = pi/4;
% newConfig(5).JointPosition = -pi/2;
% newConfig(6).JointPosition = -pi/2;
% 
% show(Irb120, newConfig);