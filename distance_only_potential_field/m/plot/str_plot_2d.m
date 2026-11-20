%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% PLOT FORMATION POSITION
figure;

% -------------------------------- LEADER ---------------------------------
subplot(1,3,2);

if exist('iii_veh0', 'var')
    plot(iii_veh0(:,2), iii_veh0(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Leader');
xlabel('Coordinate $y$ [m]');
xlim([-inf, inf]);
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 1 ------------------------------
subplot(1,3,1);

if exist('iii_veh1', 'var')
    plot(iii_veh1(:,2), iii_veh1(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 1');
xlabel('Coordinate $y$ [m]');
xlim([-inf, inf]);
ylabel('Coordinate $x$ [m]');
ylim([-inf, inf]);

% ------------------------------- FOLLOWER 2 ------------------------------
subplot(1,3,3);

if exist('iii_veh2', 'var')
    plot(iii_veh2(:,2), iii_veh2(:,1), linewidth=2, linestyle='-', color=blue);
end

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([3 5 1]);

title('Follower 2');
xlabel('Coordinate $y$ [m]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Double integrator', location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle('\textbf{Straight move: position}', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_xy.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end