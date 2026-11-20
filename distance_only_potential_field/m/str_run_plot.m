clear;
clc;

%% FORMATION IN 2D
% CHOOSE VEHICLE MODEL
model = 'iii';

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = false;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 1;
name_fig = true;
save_fig = false;

run('plot/str_plot_form');

%% FORMATION IN 2D WITH COLLISION AVOIDANCE
% CHOOSE VEHICLE MODEL
model = 'iii';

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 2;
name_fig = true;
save_fig = false;

run('plot/str_plot_form_coa_2d');

%% FORMATION IN 3D WITH OBSTACLE AVOIDANCE
% CHOOSE VEHICLE MODEL
model = 'iii';

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_form_obs_3d');

%% POSITION IN 2D
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_2d');

%% ABSOLUTE POSITION AND VELOCITY
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_abs');

%% POSITION AND VELOCITY DIFFERENCES
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = false;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_diff');

%% INPUTS
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_in');

%% POSITION AND VELOCITY OFFSETS
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_offset');

%% REFERENCE OFFSETS DIFFERENCE
% CHOOSE VEHICLE MODEL
model = 'iii';

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_offset_diff');

%% SAFETY DISTANCE CHECK FOR COLLISION AVOIDANCE
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 2;
name_fig = true;
save_fig = false;

run('plot/str_plot_safety_dist_col');

%% SAFETY DISTANCE CHECK FOR OBSTACLE AVOIDANCE
% COMPARE VEHICLE MODELS

% gradual offset change
goc = true;
% collision and obstacle avoidance
coa = true;
% 1: formation reconfiguration, 2: collision avoidance, 3: obstacle_avoidance
scenario = 3;
name_fig = true;
save_fig = false;

run('plot/str_plot_safety_dist_obs');