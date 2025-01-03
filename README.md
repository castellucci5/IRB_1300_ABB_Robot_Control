# IRB_1300_ABB_Robot_Control
This repository was created as part of the project for the university course: Dynamics and Control of Intelligent Robots and Vehicles. It features the kinematic and dynamic control modeling of ABB's latest anthropomorphic robot, the IRB 1300, using MATLAB Simulink.


# This project is composed of Three main Steps:

# Step 1:
Starting from the CAD drawings (.STEP) of the IRB 1300_11_900 robot's links provided by ABB, SolidWorks was used to assign frames following the Denavit-Hartenberg convention. 
Subsequently, the meshes were generated in (.STL) format, along with the corresponding URDF file.

From this step, the directory *Robot_IRB1300* was generated. Inside, two configurations of the robot are included:


- *IRB1300_BASE+URDF+MESH:* Standard configuration (From ABB documentation).
- *IRB1300+Pinza_Hsk+URDF+MESH:* Configuration with an Hsk F63 gripper for tool attachment.
- *ABB CAD drawings (.STEP)* and *ABB Documentation*.


# Step 2:
In this step, the robot was modeled in MATLAB starting from the Denavit-Hartenberg matrix, compiled according to the documentation provided by ABB.
Additionally, the transformation matrix for forward kinematics and the Jacobian, both for position and orientation, were calculated to implement inverse kinematics.
The kinematic control loop was then implemented in Simulink.
From this step, several simulations were produced starting from the kinematic control, available in the directory *Simulazione_IRB_1300_matlab*:

- *Contr_Cinematico_Base:* Implementation of inverse kinematic control, for position.
- *Contr_Cinematico_Task_Aggancio_e_Sgancio_Utensile:* Implementation of two tasks for tool attachment and detachment using inverse kinematic control for position and orientation.


# Step 3:
In this step, dynamic control was implemented using the RNE (Recursive Newton-Euler) algorithm.
This dynamic control Loop is aviable in the directory *Simulazione_IRB_1300_matlab*:

- *Controllo_dinamico_Base:*  Implementation of Dynamic Control, for position.







