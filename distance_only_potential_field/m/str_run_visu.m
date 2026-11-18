clear;
clc;

% -------------------------------- PARAMS ---------------------------------
goc = true;    % gradual offset change
save_vid = true;

% use collision and obstacle avoidance
coa = true;

model = 'iii';

% scenario = 1; % move sideways and back
% scenario = 2;   % switch in line
scenario = 3;   % obstacle avoidance

visu = '2d';
% -------------------------------- PARAMS ---------------------------------

% load obstacles
if coa
    str_obstacle_grid;
end

%% LOAD DATA
str_load_data;
switch model
    case 'iii'      % double integrator
        veh0 = iii_veh0;
        veh1 = iii_veh1;
        veh2 = iii_veh2;
        time = iii_time;
        model_type = 'Double integrator models';
        vid_name = 'str_iii';
end

%% RUN VISU
if strcmp(visu, '2d')
    f = 50;     % [Hz]
    Ts = 1/f;
    use_axis_equal = false;
    vid_title = 'Straight move';

    % start visualization
    run('visu_2d');
end