%% DOUBLE INTEGRATOR DYNAMICS
Ax = [0, 1; 0, 0];
Bx = [0; 1];
Ay = [0, 1; 0, 0];
By = [0; 1];

A = blkdiag(Ax, Ay);
B = blkdiag(Bx, By);

R = 0.7*diag([1, 1]);
Q = 30*diag([7, 6, 7, 6]);

% compute Riccati Equation
[X,K,L] = icare(A,B,Q,R);

K(K<10e-10) = 0;
fprintf('INFO: Control gain K is\n');
disp(K);