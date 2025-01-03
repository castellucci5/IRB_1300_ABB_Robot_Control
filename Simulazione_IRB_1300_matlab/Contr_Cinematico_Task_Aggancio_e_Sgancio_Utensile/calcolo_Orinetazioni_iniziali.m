R06 = T06(1:3, 1:3);

theta = -asin(R06(3,1));
if cos(theta) ~= 0
    phi = atan2(R06(3,2) / cos(theta), R06(3,3) / cos(theta));
    psi = atan2(R06(2,1) / cos(theta), R06(1,1) / cos(theta));
else
    % Gestire il caso di gimbal lock
    phi = 0;
    psi = atan2(-R06(1,2), R06(2,2));
end

angles = rad2deg([phi, theta, psi]);
disp('Angles [Roll, Pitch, Yaw]:');
disp(angles);

% Risultato:
% Angles [Roll, Pitch, Yaw]:
%         90     0    90