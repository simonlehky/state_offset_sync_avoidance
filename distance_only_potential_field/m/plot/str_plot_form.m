%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

run('../str_load_data');
if coa && scenario == 3
    run('../str_obstacle_grid');
end

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% CHOOSE DATA
switch model
    case 'iii'      % double integrator
        veh0 = iii_veh0;
        veh1 = iii_veh1;
        veh2 = iii_veh2;
        model_type = 'double integrators';
end

%% PLOT FORMATION POSITION
subplot(1,2,1);

plot(veh0(:,2), veh0(:,1), linewidth=2, color=blue, marker='square', ...
    markerindices=numel(veh0(:,1)), markersize=9, markerfacecolor='auto');
hold on;
plot(veh1(:,2), veh1(:,1), linewidth=2, color=orange, marker='square', ...
    markerindices=numel(veh1(:,1)), markersize=9, markerfacecolor='auto');
plot(veh2(:,2), veh2(:,1), linewidth=2, color=yellow, marker='square', ...
    markerindices=numel(veh2(:,1)), markersize=9, markerfacecolor='auto');
if coa && scenario == 3
    % plot obstacles
    theta = linspace(0, 2*pi);
    for i = 1:size(obstacles,2)
        xc = obstacles(3,i)*cos(theta) + obstacles(1,i); 
        yc = obstacles(3,i)*sin(theta) + obstacles(2,i); 
        fill(yc, xc, 'black');
    end
end
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
if ~coa
    pbaspect([1 1 1]);
else
    pbaspect([2 3 1]);
end

title('Position');
xlabel('Coordinate $y$ [m]');
xlim([-30, 30]);
ylabel('Coordinate $x$ [m]');
ylim([-inf, veh0(end,1)+5]);

legend('Leader', 'Follower 1', 'Follower 2', location='NorthEast', fontsize=14);

%% PLOT FORMATION VELOCITY
subplot(1,2,2);

plot(veh0(:,4), veh0(:,3), linewidth=2, color=blue, marker='square', ...
    markerindices=numel(veh0(:,3)), markersize=9, markerfacecolor='auto');
hold on;
plot(veh1(:,4), veh1(:,3), linewidth=2, color=orange, marker='square', ...
    markerindices=numel(veh1(:,3)), markersize=9, markerfacecolor='auto');
plot(veh2(:,4), veh2(:,3), linewidth=2, color=yellow, marker='square', ...
    markerindices=numel(veh2(:,3)), markersize=9, markerfacecolor='auto');
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
if ~coa
    pbaspect([1 1 1]);
else
    pbaspect([2 3 1]);
end

title('Velocity');
xlabel('Velocity $\dot{y}$ [m/s]');
xlim([-7, 7]);
ylabel('Velocity $\dot{x}$ [m/s]');
ylim([0, 20]);

legend('Leader', 'Follower 1', 'Follower 2', location='SouthEast', fontsize=14);

if name_fig
    if ~coa
        sgtitle(sprintf('\\textbf{Straight move: formation of %s}', model_type), interpreter='latex', fontsize=18);
    else
        sgtitle(sprintf('\\textbf{Straight move: formation of %s with obstacle avoidance}', ...
                model_type), interpreter='latex', fontsize=18);
    end
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, paperpositionmode='auto');         
    set(h, paperorientation='landscape');
    output_folder = '../../fig/';
    if ~coa
        filename = strcat(output_folder, sprintf('form%s_str_form_%s.pdf', string(scenario), model));
    else
        filename = strcat(output_folder, sprintf('form%s_str_form_%s_coa.pdf', string(scenario), model));
    end
    print(gcf, '-dpdf', filename);
    fprintf('INFO: Figure saved.\n');
end