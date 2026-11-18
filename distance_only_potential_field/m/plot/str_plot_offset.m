%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% GET REAL OFFSET
% double integrator
if exist('iii_time', 'var')
    iii_offset01 = iii_veh0 - iii_veh1;
    iii_offset12 = iii_veh1 - iii_veh2;
end

%% PLOT POSITION OFFSET IN X COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_offset01_ref(:,1), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset01(:,1), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $x$');
ylim([-2, 12]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_offset12_ref(:,1), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset12(:,1), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-2, 12]);

lgd = legend('Reference', 'Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles position offsets in $x$ coordinate}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_x.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT POSITION OFFSET IN Y COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_offset01_ref(:,2), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset01(:,2), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $y$');
ylim([-2, 12]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_offset12_ref(:,2), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset12(:,2), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-22, 2]);

lgd = legend('Reference', 'Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles position offsets in $y$ coordinate}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_y.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT VELOCITY OFFSET IN X COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, zeros(size(iii_time)), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset01(:,3), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $x$');
ylim([-6, 6]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, zeros(size(iii_time)), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset12(:,3), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-6, 6]);

lgd = legend('Reference', 'Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles velocity offsets in $x$ coordinate}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_dx.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT VELOCITY OFFSET IN Y COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, zeros(size(iii_time)), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset01(:,4), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Coordinate $y$');
ylim([-6, 6]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, zeros(size(iii_time)), linewidth=2, linestyle='--', color='black');
end
hold on;
if exist('iii_time', 'var')
    plot(iii_time, iii_offset12(:,4), linewidth=2, linestyle='-', color=blue);
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-6, 6]);

lgd = legend('Reference', 'Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles velocity offsets in $y$ coordinate}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_dy.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end