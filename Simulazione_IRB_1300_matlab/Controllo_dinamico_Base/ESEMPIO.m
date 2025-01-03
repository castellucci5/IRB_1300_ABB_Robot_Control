yaw = deg2rad(45);    % Rotazione attorno a Z (in radianti)
pitch = deg2rad(30);  % Rotazione attorno a Y
roll = deg2rad(60);   % Rotazione attorno a X

R_z = [cos(yaw), -sin(yaw), 0;
       sin(yaw),  cos(yaw), 0;
       0,         0,        1];

R_y = [cos(pitch), 0, sin(pitch);
       0,          1,          0;
      -sin(pitch), 0, cos(pitch)];

R_x = [1,         0,          0;
       0, cos(roll), -sin(roll);
       0, sin(roll),  cos(roll)];

R = R_z * R_y * R_x; % Matrice di rotazione totale

calculated_roll = atan2(R(3,2), R(3,3));
calculated_pitch = atan2(-R(3,1), sqrt(R(3,2)^2 + R(3,3)^2));
calculated_yaw = atan2(R(2,1), R(1,1));

disp('Angoli iniziali (rad):');
disp(['Yaw: ', num2str(yaw)]);
disp(['Pitch: ', num2str(pitch)]);
disp(['Roll: ', num2str(roll)]);

disp('Angoli calcolati (rad):');
disp(['Yaw: ', num2str(calculated_yaw)]);
disp(['Pitch: ', num2str(calculated_pitch)]);
disp(['Roll: ', num2str(calculated_roll)]);
