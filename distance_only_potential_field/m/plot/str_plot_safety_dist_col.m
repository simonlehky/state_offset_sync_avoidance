%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

min_dist = 3;

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

    iii_veh0_coa2 = out.form.signals.values(:,1:4);
    iii_veh1_coa2 = out.form.signals.values(:,5:8);
    iii_veh2_coa2 = out.form.signals.values(:,9:12);
    iii_time2 = out.tout;
    clear out
else
    fprintf(sprintf('WARN: File %s could not be loaded.\n', filename));
end

%% GET DISTANCES
veh1_veh2_coa = vecnorm(iii_veh1_coa2(:,1:2) - iii_veh2_coa2(:,1:2), 2, 2);
veh2_veh1_coa = vecnorm(iii_veh2_coa2(:,1:2) - iii_veh1_coa2(:,1:2), 2, 2);

%% PLOT DISTANCE BETWEEN FOLLOWERS
figure;

% ------------------------------ FOLLOWER 1 -------------------------------
ax1 = subplot(1,2,1);

plot(iii_time2, veh1_veh2_coa, linewidth=2, linestyle='-', color=blue);
yline(min_dist, linewidth=2, linestyle='-', color='black', label='$\|\mbox{\boldmath$p$}_{12}\|_2$', labelhorizontalalignment='left', ...
    labelverticalalignment='top', fontsize=14, handlevisibility='off', interpreter='latex');

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Distance $r$ [m]');
ylim([0, 15]);

% ------------------------------ FOLLOWER 2 -------------------------------
ax2 = subplot(1,2,2);
delete(ax2);

pos = get(ax1, 'position')';
pos(1) = 0.5 - pos(3)/2;
set(ax1, 'position', pos);

if name_fig
    sgtitle('\textbf{Straight move with collision avoidance: DI F1 approaching DI F2}', ...
        fontsize=18);
end

%% SAVE FIGURE
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_safety_dist_col_f1_f2.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end