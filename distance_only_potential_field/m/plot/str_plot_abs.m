%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% PLOT POSITION IN X COORDINATE
figure;

% -------------------------------- LEADER ---------------------------------
subplot(3,1,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Leader');
xlim([-inf, inf]);
ylabel('Coordinate $x$ [m]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(3,1,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 1');
xlim([-inf, inf]);
ylabel('Coordinate $x$ [m]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(3,1,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $x$ [m]');
ylim([-inf, inf]);

legend('Double integrator', location='South', fontsize=14, orientation='horizontal');

if name_fig
    sgtitle('\textbf{Straight move: coordinate $x$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_x.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT POSITION IN Y COORDINATE
figure;

% -------------------------------- LEADER ---------------------------------
subplot(3,1,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Leader');
xlim([-inf, inf]);
ylabel('Coordinate $y$ [m]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(3,1,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 1');
xlim([-inf, inf]);
ylabel('Coordinate $y$ [m]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(3,1,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2(:,2), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $y$ [m]');
ylim([-inf, inf]);

legend('Double integrator', location='South', fontsize=14, orientation='horizontal');

if name_fig
    sgtitle('\textbf{Straight move: coordinate $y$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_y.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT VELOCITY IN DX COORDINATE
figure;

% -------------------------------- LEADER ---------------------------------
subplot(3,1,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Leader');
xlim([-inf, inf]);
ylabel('Velocity $\dot{x}$ [m/s]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(3,1,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 1');
xlim([-inf, inf]);
ylabel('Velocity $\dot{x}$ [m/s]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(3,1,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2(:,3), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Velocity $\dot{x}$ [m/s]');
ylim([-inf, inf]);

legend('Double integrator', location='South', fontsize=14, orientation='horizontal');

if name_fig
    sgtitle('\textbf{Straight move: velocity $\dot{x}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_dx.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT VELOCITY IN DY COORDINATE
figure;

% -------------------------------- LEADER ---------------------------------
subplot(3,1,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh0(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Leader');
xlim([-inf, inf]);
ylabel('Velocity $\dot{y}$ [m/s]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(3,1,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 1');
xlim([-inf, inf]);
ylabel('Velocity $\dot{y}$ [m/s]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(3,1,3);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2(:,4), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([7 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Velocity $\dot{y}$ [m/s]');
ylim([-inf, inf]);

legend('Double integrator', location='South', fontsize=14, orientation='horizontal');

if name_fig
    sgtitle('\textbf{Straight move: velocity $\dot{y}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_dy.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end