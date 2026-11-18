clear;
clc;

%% PARAMS
save_mat = true;

% gradual offset change
goc = true;

% use collision and obstacle avoidance
coa = true;

% choose formation scenario
x00 = 0; y00 = 0;
ang = 0;
dx = 10; dy = 0;

% scenario = 1; % move sideways and back
% scenario = 2; % switch in line
scenario = 3; % obstacle avoidance

model = 'iii';

%% COLLISION AND OBSTACLE AVOIDANCE
q = 2;
if scenario == 2        % collision avoidance
    eta = 5000; rho = 0.65;
elseif scenario == 3    % obstacle avoidance
    eta = 2200; rho = 5.4;
end

%% RUN SIMULATION
str_init_form;
str_ctrl_form;
str_obstacle_grid;

params = [eta, rho, q, safety_dist];

switch model
    case 'iii'      % double integrator
        out = sim('../sim/str_form_iii');
    otherwise
        fprintf('ERROR: Wrong formation model chosen!\n');
end

fprintf('INFO: Straight mode has been simulated.\n');

%% SAVE .MAT FILE
if save_mat
    output_folder = 'mat/';
    if ~coa
        if ~goc
            filename = sprintf('form%d_%s.mat', scenario, string(model));
        else
            filename = sprintf('form%d_%s_goc.mat', scenario, string(model));
        end
    else
        if ~goc
            filename = sprintf('form%d_%s_coa.mat', scenario, string(model));
        else
            filename = sprintf('form%d_%s_coa_goc.mat', scenario, string(model));
        end
    end
    save(fullfile(output_folder, filename), 'out');
    fprintf('INFO: Data saved to .mat file.\n');
end