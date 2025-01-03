function T = numeric_T (from, to, DH, q)
% Built the T matrix from i to i+1
% Transformation from one joint to another joint
% 0 <= from<N_DOFS
% 0<to <= N DOFS
T = eye (4);
N_DOFS = length (q) ;

% Sanity check
if (from >= N_DOFS) || (from <0) || (to <= 0) || (to > N_DOFS)
    return;

end

    for i = from+1 : to

    ct = cos(q(i) + DH(i,4));
    st = sin(q(i) + DH(i,4));
    ca = cos(DH(i, 2)) ;
    sa = sin(DH(i, 2));

    T= T * [ ct -st*ca   st*sa  DH(i,1)*ct ; ...
             st  ct*ca  -ct*sa  DH(i,1)*st ; ...
             0   sa      ca     DH(i,3)     ; ...
             0   0       0      1           ];

   end

end