%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_obstacle_grid');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% LOAD DATA
if ~goc
    filename = sprintf('../mat/form%d_iii_coa.mat', scenario);
else
    filename = sprintf('../mat/form%d_iii_coa_goc.mat', scenario);
end
if exist(filename, 'file')
    load(filename, '-mat');
    fprintf(sprintf('INFO: File %s loaded.\n', filename));

    iii_veh0_coa = out.form.signals.values(:,1:4);
    iii_veh1_coa = out.form.signals.values(:,5:8);
    iii_veh2_coa = out.form.signals.values(:,9:12);
    iii_time = out.tout;
    clear out
else
    fprintf(sprintf('WARN: File %s could not be loaded.\n', filename));
end

%% GET DISTANCES
veh1_obs1_coa = vecnorm(iii_veh1_coa(:,1:2) - obstacles(1:2,1)', 2, 2);
veh1_obs2_coa = vecnorm(iii_veh1_coa(:,1:2) - obstacles(1:2,2)', 2, 2);
veh2_obs1_coa = vecnorm(iii_veh2_coa(:,1:2) - obstacles(1:2,1)', 2, 2);
veh2_obs2_coa = vecnorm(iii_veh2_coa(:,1:2) - obstacles(1:2,2)', 2, 2);

%% PLOT FOLLOWER 1 DISTANCE TO ALL OBSTACLES
figure;

% ------------------------------ OBSTACLE 1 -------------------------------
subplot(1,2,1);

plot(iii_time, veh1_obs1_coa, linewidth=2, linestyle='-', color=blue);
yline(obstacles(3,1), linewidth=2, linestyle='-', color='black', label='$R$', labelhorizontalalignment='left', ...
    labelverticalalignment='top', fontsize=14, handlevisibility='off', interpreter='latex');

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Obstacle 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Distance $r$ [m]');
ylim([0, 10*obstacles(3,1)]);

% ------------------------------ OBSTACLE 2 -------------------------------
subplot(1,2,2);

plot(iii_time, veh1_obs2_coa, linewidth=2, linestyle='-', color=blue);
yline(obstacles(3,1), linewidth=2, linestyle='-', color='black', label='$R$', labelhorizontalalignment='left', ...
    labelverticalalignment='top', fontsize=14, interpreter='latex');

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Obstacle 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([0, 10*obstacles(3,2)]);

if name_fig
    sgtitle(['\textbf{Straight move with obstacle avoidance: DI F1 approaching safety ' ...
        'distance}'], fontsize=18);
end

%% SAVE FIGURE
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_safety_dist_obs_f1.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT FOLLOWER 2 DISTANCE TO ALL OBSTACLES
figure;

% ------------------------------ OBSTACLE 1 -------------------------------
subplot(1,2,1);

plot(iii_time, veh2_obs1_coa, linewidth=2, linestyle='-', color=blue);
yline(obstacles(3,1), linewidth=2, linestyle='-', color='black', label='$R$', labelhorizontalalignment='left', ...
    labelverticalalignment='top', fontsize=14, interpreter='latex');

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 2 -- Obstacle 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Distance $r$ [m]');
ylim([0, 10*obstacles(3,1)]);

% ------------------------------ OBSTACLE 2 -------------------------------
subplot(1,2,2);

plot(iii_time, veh2_obs2_coa, linewidth=2, linestyle='-', color=blue);
yline(obstacles(3,1), linewidth=2, linestyle='-', color='black', label='$R$', labelhorizontalalignment='left', ...
    labelverticalalignment='top', fontsize=14, interpreter='latex');

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 2 -- Obstacle 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([0, 10*obstacles(3,2)]);

if name_fig
    sgtitle(['\textbf{Straight move with obstacle avoidance: DI F2 approaching safety ' ...
        'distance}'], fontsize=18);
end

%% SAVE FIGURE
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_safety_dist_obs_f2.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end