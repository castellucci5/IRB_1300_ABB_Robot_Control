

function tau = RNE_Calc(q,dq,ddq,robot,DH,grav)
    if nargin < 6
        grav = [0; 0; 0];
    end
   n = length (q); % Numero di giunti
   z0 = [0; 0; 1]; % Orientazione dell’asse Z del link di base 
   vdot0 = [0 0 0]' - grav; % Considero g nell’accelerazione della base del robot
   q = q + DH(:,4);% Offset iniziale  

   % inizializzazione
   [w, dw, vdot, vdotc, f, u] = deal(zeros(3,n));
   tau = zeros(n,1);

   % Ricorsione avanti
   for i  = 1:n
       T  = numeric_T(i-1, i, DH, q); % Matrice di trasformazione omogenea[4x4]
       R  = T(1:3, 1:3);              % Matrice di rotazione [3x3]
       r  = [DH(i,1); DH(i,3)*sin(DH(i,2)); DH(i,3)*cos(DH(i,2))];%))];% dist.tra i frame[3x1]
       rc = robot.r(:,:,i);           % Dist. del CoM rispetto al frame locale del link i 

       if i > 1 % si considerano tutti tranne il link_0 di base 
           w(:,i) = R' * (w(:,i-1) + dq(i).*z0);
           dw(:,i) = R' * (dw(:,i-1) + ddq(i).*z0 + cross(dq(i).*w(:,i-1),z0));
           vdot(:,i) = R'*vdot(:,i-1) + cross(dw(:,i),r) + cross(w(:,i),cross(w(:,i),r));
       else     % i = 1 si considera il link_0 di base
           w(:,i) = R' * (dq(i).*z0);
           dw(:,i) = R' * (ddq(i).*z0);
           vdot(:,i) = R'*vdot0 + cross(dw(:,i),r) + cross(w(:,i),cross(w(:,i),r));
      end
      vdotc(:,i) = vdot(:,i) + cross(dw(:,i),rc) + cross(w(:,i),cross(w(:,i),rc));
   end

   % Ricorsione all’indietro
   for i = n:-1:1
          r = [DH(i,1); DH(i,3)*sin(DH(i,2)); DH(i,3)*cos(DH(i,2))]; %[3x1]
          rc = robot.r(:,:,i) ;

      if i < n
          T = numeric_T(i-1, i, DH, q); % Matrice di trasformazione[4x4]
          R = T(1:3, 1:3);              % Matrice di rotazione [3x3]
          f(:,i) = R*f(:,i+1) + robot.m(i).*vdotc(:,i);
          u(:,i) = R*u(:,i+1) - cross(f(:,i),r+rc) + cross(R*f(:,i+1),rc) + robot.I(:,:,i)*dw(:,i) + cross(w(:,i),robot.I(:,:,i)*w(:,i));

      else % i = n si considera il link_6 ovvero l’end-effector
          f(:,i) = robot.m(i).*vdotc(:,i);
          u(:,i) = robot.I(:,:, i) * dw(:,i) + cross(w(:,i),robot.I(:,:,i)*w(:,i)) - cross(f(:,i),r+rc);
      end

      T = numeric_T(i-1, i, DH, q); % Matrice di trasformazione omogenea[4x4]
      R = T(1:3, 1:3); % Matrice di rotazione [3x3]

      tau(i) = u(:, i)' * R' * z0 ;
                
    end

end






