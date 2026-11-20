%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% CREATE DIFFERENCES
% double integrator
if exist('iii_time', 'var')
    iii_veh0_diff = get_diff(iii_veh0);
    iii_veh1_diff = get_diff(iii_veh1);
    iii_veh2_diff = get_diff(iii_veh2);
end

%% PLOT FORMATION POSITION DIFFERENCE X
figure;

% -------------------------- LEADER: difference x -------------------------
subplot(1,3,2);
ax = gca; 

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0_diff(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Leader');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

% ------------------------ FOLLOWER 1: difference x -----------------------
subplot(1,3,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_diff(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Difference $\delta x$ [m]');
ylim([-inf, inf]);

% ------------------------ FOLLOWER 2: difference x -----------------------
subplot(1,3,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_diff(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05];

if name_fig
    sgtitle('\textbf{Straight move: position difference $\delta{x}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_diff_x.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT FORMATION POSITION DIFFERENCE Y
figure;

% -------------------------- LEADER: difference y -------------------------
subplot(1,3,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0_diff(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Leader');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

% ------------------------ FOLLOWER 1: difference y -----------------------
subplot(1,3,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_diff(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Difference $\delta y$ [m]');
ylim([-inf, inf]);

% ------------------------ FOLLOWER 2: difference y -----------------------
subplot(1,3,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_diff(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05];

if name_fig
    sgtitle('\textbf{Straight move: position difference $\delta{y}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_diff_y.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT FORMATION VELOCITY DIFFERENCE DX
figure;

% ------------------------- LEADER: difference dx -------------------------
subplot(1,3,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0_diff(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Leader');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

% ----------------------- FOLLOWER 1: difference dx -----------------------
subplot(1,3,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_diff(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Difference $\delta \dot{x}$ [m/s]');
ylim([-inf, inf]);

% ----------------------- FOLLOWER 2: difference dx -----------------------
subplot(1,3,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_diff(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: velocity difference $\delta{\dot{x}}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_diff_dx.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT FORMATION VELOCITY DIFFERENCE DY
figure;

% ------------------------- LEADER: difference dy -------------------------
subplot(1,3,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0_diff(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Leader');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

% ----------------------- FOLLOWER 1: difference dy -----------------------
subplot(1,3,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_diff(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Difference $\delta \dot{y}$ [m/s]');
ylim([-inf, inf]);

% ----------------------- FOLLOWER 2: difference dy -----------------------
subplot(1,3,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_diff(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, 'fontsize', 14);
set(gcf, 'position', [100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: velocity difference $\delta{\dot{y}}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_diff_dy.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% FUNCTION
function x_diff = get_diff(x)
    x_diff = diff(x);
    x_diff = reshape(x_diff, size(x,1)-1, size(x,2));
    x_diff = [x_diff; x_diff(end,:)];
end