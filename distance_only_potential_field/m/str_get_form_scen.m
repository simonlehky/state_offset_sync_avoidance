% INIT SCENARIO
max_pos = [250; 0];

% position offsets
if scenario == 1
    % double integrators initial conditions
    x00 =  0*dx; y00 =  0*dy; dx00 = dx; dy00 = 0;    % leader
    x10 = -1*dx; y10 = -1*dy; dx10 = dx; dy10 = 0;    % follower 1
    x20 = -2*dx; y20 =  1*dy; dx20 = dx; dy20 = 0;    % follower 2
    % time-varying offsets
    delta01_1 = [0; 10];
    delta12_1 = [0; -20];
    delta01_2 = [10; 0];
    delta12_2 = [10; 0]; 
    % offsets change time
    t_change1 = 5;
    t_change2 = 15;
    % velocity increase when formation changes
    dVel = 8;
elseif scenario == 2
    % double integrators initial conditions
    x00 =  0*dx; y00 =  0*dy; dx00 = dx; dy00 = 0;    % leader
    x10 = -1*dx; y10 = -1*dy; dx10 = dx; dy10 = 0;    % follower 1
    x20 = -2*dx; y20 =  1*dy; dx20 = dx; dy20 = 0;    % follower 2
    % time-varying offsets
    delta01_1 = [20; 0];
    delta12_1 = [-10; 0];
    delta01_2 = [20; 0];
    delta12_2 = [-10; 0]; 
    % offsets change time
    t_change1 = 2;
    t_change2 = 15;
    % velocity increase when formation changes
    dVel = 2.5;
elseif scenario == 3
    % double integrators initial conditions
    x00 = 0*dx; y00 =  0*dx; dx00 = dx; dy00 = 0;    % leader
    x10 = 0*dx; y10 = -1*dx; dx10 = dx; dy10 = 0;    % follower 1
    x20 = 0*dx; y20 =  1*dx; dx20 = dx; dy20 = 0;    % follower 2
    % time-varying offsets
    delta01_1 = [0; 10];
    delta12_1 = [0; -20];
    delta01_2 = [0; 10];
    delta12_2 = [0; -20]; 
    % offsets change time
    t_change1 = 2;
    t_change2 = 15;
    % velocity increase when formation changes
    dVel = 2.5;
else
    fprintf('ERROR: Wrong scenario chosen!\n');
end

[x00, y00] = transformT([x00; y00], ang, x00, y00);
[x10, y10] = transformT([x10; y10], ang, x00, y00);
[x20, y20] = transformT([x20; y20], ang, x00, y00);  
[dx00, dy00] = transformT([dx00; dy00], ang, 0, 0);
[dx10, dy10] = transformT([dx10; dy10], ang, 0, 0);
[dx20, dy20] = transformT([dx20; dy20], ang, 0, 0);

% init position offsets
delta01_init = [x00-x10; y00-y10];
delta12_init = [x10-x20; y10-y20];

[tmp1, tmp2] = transformT(delta01_1, ang, 0, 0);
delta01_1 = [tmp1; tmp2];
[tmp1, tmp2] = transformT(delta12_1, ang, 0, 0);
delta12_1 = [tmp1; tmp2];
[tmp1, tmp2] = transformT(delta01_2, ang, 0, 0);
delta01_2 = [tmp1; tmp2];
[tmp1, tmp2] = transformT(delta12_2, ang, 0, 0); 
delta12_2 = [tmp1; tmp2];

[tmp1, tmp2] = transformT(max_pos, ang, x00, y00); 
max_pos = [tmp1; tmp2];

offsets = [delta01_init, delta12_init, ...
           delta01_1, delta12_1, ...
           delta01_2, delta12_2];

%% FUNCTIONS
function [x, y] = transformT(X, ang, x00, y00)
    Y = [cos(ang), -sin(ang), x00; sin(ang), cos(ang), y00; 0, 0, 1]*[X; 1]; 
    x = Y(1); y = Y(2);
end