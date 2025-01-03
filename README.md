# IRB_1300_ABB_Robot_Control
This repository was created as part of the project for the university course: Dynamics and Control of Intelligent Robots and Vehicles. It features the kinematic and dynamic control modeling of ABB's latest anthropomorphic robot, the IRB 1300, using MATLAB Simulink.


# This project is composed of four main phases:
# Phase 1:
Starting from the CAD drawings (.STEP) of the IRB 1300 robot's links provided by ABB, SolidWorks was used to assign frames following the Denavit-Hartenberg convention. 
Subsequently, the meshes were generated in (.STL) format, along with the corresponding URDF file.

From this phase, the directory Robot_IRB1300 was generated. Inside, two configurations of the robot are included:

- IRB1300_BASE+URDF+MESH: Standard configuration (From ABB documentation).
- IRB1300+Pinza_Hsk+URDF+MESH: Configuration with an Hsk F63 gripper for tool attachment.

# Phase 2:
In this phase, the robot was modeled in MATLAB starting from the Denavit-Hartenberg matrix, compiled according to the documentation provided by ABB.
Additionally, the transformation matrix for forward kinematics and the Jacobian, both for position and orientation, were calculated to implement inverse kinematics.
The kinematic control loop was then implemented in Simulink.
From this phase, several simulations were produced starting from the kinematic control, available in the directory Simulazione_IRB_1300_matlab:

- Contr_Cinematico_Base: Implementation of inverse kinematic control, for position.
- 








