%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

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
    iii_offset01_ref_coa = out.offset.signals.values(:,1:2);
    iii_offset12_ref_coa = out.offset.signals.values(:,3:4);
    iii_time = out.tout;
    clear out
else
    fprintf(sprintf('WARN: File %s could not be loaded.\n', filename));
end

%% GET REAL OFFSET
iii_offset01_coa = iii_veh0_coa(:,1:2) - iii_veh1_coa(:,1:2);
iii_offset12_coa = iii_veh1_coa(:,1:2) - iii_veh2_coa(:,1:2);

%% PLOT OFFSET TRANSIENT IN X COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

plot(iii_time, iii_offset01_ref_coa(:,1), linewidth=2, linestyle='-', color='black');
hold on;
plot(iii_time, iii_offset01_coa(:,1), linewidth=2, linestyle=':', color=blue);
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Position offset [m]');
ylim([-inf, inf]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

plot(iii_time, iii_offset12_ref_coa(:,1), linewidth=2, linestyle='-', color='black');
hold on;
plot(iii_time, iii_offset12_coa(:,1), linewidth=2, linestyle=':', color=blue);
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Reference', '$q = 2$', location='SouthOutside', ...
             fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle(['\textbf{Straight move with obstacle avoidance: offsets transient ' ...
             'in $x$ coordinate}'], fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_transient_x_coa.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT OFFSET TRANSIENT IN Y COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

plot(iii_time, iii_offset01_ref_coa(:,2), linewidth=2, linestyle='-', color='black');
hold on;
plot(iii_time, iii_offset01_coa(:,2), linewidth=2, linestyle=':', color=blue);
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Leader -- Follower 1');
xlabel('Time [s]');
xlim([-inf, inf]);
ylabel('Position offset [m]');
ylim([-inf, inf]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

plot(iii_time, iii_offset12_ref_coa(:,2), linewidth=2, linestyle='-', color='black');
hold on;
plot(iii_time, iii_offset12_coa(:,2), linewidth=2, linestyle=':', color=blue);
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

title('Follower 1 -- Follower 2');
xlabel('Time [s]');
xlim([-inf, inf]);
ylim([-inf, inf]);

lgd = legend('Reference', '$q = 2$', location='SouthOutside', ...
             fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle(['\textbf{Straight move with obstacle avoidance: offsets transient ' ...
             'in $y$ coordinate}'], fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_transient_y_coa.pdf', string(scenario)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end