%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

u_sat = 5;

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% PLOT ACCELERATION INPUT DDX
figure;

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_in(:,1), linewidth=2, linestyle='-', color=blue);
end
hold on;
% saturation
if exist('iii_time', 'var')
    plot([0, iii_time(end)], [u_sat, u_sat], linewidth=1, linestyle='--', color='black');
    plot([0, iii_time(end)], -[u_sat, u_sat], linewidth=1, linestyle='--', color='black');
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Acceleration $\ddot{x}$ [m/s$^2$]');
ylim([-(u_sat+1), u_sat+1]);
yticks([-5, -2, 0, 2, 5]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_in(:,1), linewidth=2, linestyle='-', color=blue);
end
hold on;
% saturation
if exist('iii_time', 'var')
    plot([0, iii_time(end)], [u_sat, u_sat], linewidth=1, linestyle='--', color='black');
    plot([0, iii_time(end)], -[u_sat, u_sat], linewidth=1, linestyle='--', color='black');
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-(u_sat+1), u_sat+1]);
yticks([-5, -2, 0, 2, 5]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles input $\ddot{x}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_in_x.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT ACCELERATION INPUT DDY
figure;

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(1,2,1);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh1_in(:,2), linewidth=2, linestyle='-', color=blue);
end
hold on;
% saturation
if exist('iii_time', 'var')
    plot([0, iii_time(end)], [u_sat, u_sat], linewidth=1, linestyle='--', color='black');
    plot([0, iii_time(end)], -[u_sat, u_sat], linewidth=1, linestyle='--', color='black');
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Acceleration $\ddot{y}$ [m/s$^2$]');
ylim([-(u_sat+1), u_sat+1]);
yticks([-5, -2, 0, 2, 5]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(1,2,2);

if exist('iii_time', 'var')
    plot(iii_time, iii_veh2_in(:,2), linewidth=2, linestyle='-', color=blue);
end
hold on;
% saturation
if exist('iii_time', 'var')
    plot([0, iii_time(end)], [u_sat, u_sat], linewidth=1, linestyle='--', color='black');
    plot([0, iii_time(end)], -[u_sat, u_sat], linewidth=1, linestyle='--', color='black');
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-(u_sat+1), u_sat+1]);
yticks([-5, -2, 0, 2, 5]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: vehicles input $\ddot{y}$}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_in_y.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end