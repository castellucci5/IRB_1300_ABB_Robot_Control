
%% Lezione 18 

function tau = RNE_Calc(q,dq,ddq,robot,DH,grav)
    if nargin < 6
        grav = [0; 0; 0];
    end
   n = length (q); %dofs
   z0 = [0; 0; 1]; % z axiz orientation of the link 0
   vdot0 = [0 0 0]' - grav; % vdot0=ddp_0 = initial translational acceleration
   % vdot=ddp_i = translational acceleration of Origin Oi of ref. frame i,
   % vdotc=ddpc_i= translational acceleration of mass center of link i
   q = q + DH(:,4);

   % Initialization
   [w, dw, vdot, vdotc, f, u] = deal(zeros(3,n));
   tau = zeros(n,1);

%Forward recursion
   for i  = 1:n
       T  = numeric_T(i-1, i, DH, q); %[4x4]
       R  = T(1:3, 1:3); %[3x3]
       r  = [DH(i,1); DH(i,3)*sin(DH(i,2)); DH(i,3)*cos(DH(i,2))];%[3x1]
       rc = robot.r(:,:,i);

       if i > 1
           w(:,i) = R' * (w(:,i-1) + dq(i).*z0);
           dw(:,i) = R' * (dw(:,i-1) + ddq(i).*z0 + cross(dq(i).*w(:,i-1),z0));
           vdot(:,i) = R'*vdot(:,i-1) + cross(dw(:,i),r) + cross(w(:,i),cross(w(:,i),r));
       else
           % i = 1 this is the base link (fixed link)
           w(:,i) = R' * (dq(i).*z0);
           dw(:,i) = R' * (ddq(i).*z0);
           vdot(:,i) = R'*vdot0 + cross(dw(:,i),r) + cross(w(:,i),cross(w(:,i),r));
      end
      vdotc(:,i) = vdot(:,i) + cross(dw(:,i),rc) + cross(w(:,i),cross(w(:,i),rc));
      %f(:,i)=robot.m(i)*vdotc(:,i);
      %u(:,i) =robot.I(:,:, i)*dw + cross(w(:,i),robot.I(:,:,i)*w(:,i));

   end

         % Backward Recursion
      for i = n:-1:1
          r = [DH(i,1); DH(i,3)*sin(DH(i,2)); DH(i,3)*cos(DH(i,2))];%[3x1]
          rc = robot.r(:,:,i) ;

          if i < n
              T = numeric_T(i-1, i, DH, q); %[4x4]
              R = T(1:3, 1:3); %[3x3]
              f(:,i) = R*f(:,i+1) + robot.m(i).*vdotc(:,i);
              u(:,i) = R*u(:,i+1) - cross(f(:,i),r+rc) + cross(R*f(:,i+1),rc) + robot.I(:,:,i)*dw(:,i) + cross(w(:,i),robot.I(:,:,i)*w(:,i));

          else
              % i = n this is the end effector link
              f(:,i) = robot.m(i).*vdotc(:,i);
              u(:,i) = robot.I(:,:, i) * dw(:,i) + cross(w(:,i),robot.I(:,:,i)*w(:,i)) - cross(f(:,i),r+rc);
          end

          T = numeric_T(i-1, i, DH, q); %[4x4]
          R = T(1:3, 1:3); %[3x3]

          tau(i) = u(:, i)' * R' * z0 ;
                     %+ link.G^2 * link.Jm*ddq(i) - ...
                     %link.friction(dq(i));


      end

end






