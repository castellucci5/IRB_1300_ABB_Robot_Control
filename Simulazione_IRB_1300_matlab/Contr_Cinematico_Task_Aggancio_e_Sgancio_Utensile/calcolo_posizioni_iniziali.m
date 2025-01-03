T06 = [
    0.0000   -0.0000    1.0000    0.6050;
    1.0000         0   -0.0000    0.4650;
         0    1.0000    0.0000    0.0000;
         0         0         0    1.0000
];

% Estrazione della matrice di rotazione e traslazione
R = T06(1:3, 1:3); % Matrice di rotazione
t = T06(1:3, 4);   % Vettore di traslazione

% Calcolo degli angoli RPY (ZYX)
phi = atan2(R(3, 2), R(3, 3)); % Roll (phi)
theta = asin(-R(3, 1));        % Pitch (theta)
psi = atan2(R(2, 1), R(1, 1)); % Yaw (psi)

% Risultato
angles_RPY = [phi; theta; psi];
disp('Angoli RPY (roll, pitch, yaw):');
disp(angles_RPY);

disp('Traslazione (x, y, z):');
disp(t);
