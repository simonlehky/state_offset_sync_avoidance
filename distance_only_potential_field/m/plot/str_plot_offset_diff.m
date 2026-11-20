%% PARAMS
purple = '#7E2F8E';
light_blue = '#4DBEEE';

run('../str_load_data');

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% CHOOSE DATA
switch model
    case 'iii'      % double integrator
        model_type = 'DI models';
        offset01_ref = iii_offset01_ref;
        offset12_ref = iii_offset12_ref;
        time = iii_time;
end

%% COMPUTE DIFF AND DDIFF OF OFFSET CHANGE
offset01_refD = diff(offset01_ref);
offset01_refDD = diff(offset01_refD);

offset12_refD = diff(offset12_ref);
offset12_refDD = diff(offset12_refD);

%% PLOT REFERENCE OFFSET CHANGE DERIVATIVES IN X COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

plot(time(1:end-1), offset01_refD(:,1), linewidth=2, linestyle='-', color=purple);
hold on;
plot(time(1:end-2), offset01_refDD(:,1), linewidth=2, linestyle='--', color=light_blue);
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
ylim([-inf, inf]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

plot(time(1:end-1), offset12_refD(:,1), linewidth=2, linestyle='-', color=purple);
hold on;
plot(time(1:end-2), offset12_refDD(:,1), linewidth=2, linestyle='--', color=light_blue);
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

lgd = legend('First derivative', 'Second derivative', ...
             location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle(['\textbf{Straight move: derivatives of reference offset in $x$ ' ...
             'coordinate of ' model_type ' }'], fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_diff_x_%s.pdf', string(scenario), string(model)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end

%% PLOT REFERENCE OFFSET CHANGE DERIVATIVES IN Y COORDINATE
figure;

% ------------------------------- OFFSET01 --------------------------------
subplot(1,2,1);

plot(time(1:end-1), offset01_refD(:,2), linewidth=2, linestyle='-', color=purple);
hold on;
plot(time(1:end-2), offset01_refDD(:,2), linewidth=2, linestyle='--', color=light_blue);
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
ylim([-inf, inf]);

% ------------------------------- OFFSET12 --------------------------------
subplot(1,2,2);

plot(time(1:end-1), offset12_refD(:,2), linewidth=2, linestyle='-', color=purple);
hold on;
plot(time(1:end-2), offset12_refDD(:,2), linewidth=2, linestyle='--', color=light_blue);
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

lgd = legend('First derivative', 'Second derivative', ...
             location='SouthOutside', fontsize=14, orientation='horizontal');
lgd.Position = [0.35 0.05 0.3 0.05]; 

if name_fig
    sgtitle(['\textbf{Straight move: derivatives of reference offset in $y$ ' ...
             'coordinate of ' model_type ' }'], fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    filename = strcat(output_folder, sprintf('form%s_str_offset_diff_y_%s.pdf', string(scenario), string(model)));
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end