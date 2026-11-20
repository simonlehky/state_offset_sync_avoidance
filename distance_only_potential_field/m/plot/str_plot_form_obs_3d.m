%% PARAMS
blue   = '#0072BD';
orange = '#D95319';
yellow = '#EDB120';

q = 2;
eta = 2200; 
rho = 5.4;

run('../str_load_data');
if coa
    run('../str_obstacle_grid');
end

model_type = 'double integrators';

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% CREATE POTENTIAL FIELD
% create grid
x_min = -30;
y_min = -40;
x_max = 270;
y_max = 40;
x_vals = x_min:0.1:x_max;
y_vals = y_min:0.1:y_max;
[XX, YY] = meshgrid(x_vals, y_vals);

U = zeros(size(XX));
% compute potential
for i = 1:size(obstacles, 2)
    sigma = obstacles(1:2,i);
    R = obstacles(3,i);
    
    r = sqrt((XX - sigma(1)).^2 + (YY - sigma(2)).^2);
    % repulsive potential based on exponential decay
    U = U + eta.*exp(-((r - R)./rho).^q);
end

%% LIMIT POTENTIAL FIELD TO eta
U(U > eta) = NaN;

%% PLOT POSITION IN POTENTIAL FIELD
figure; 

surf(YY, XX, U, edgecolor='none');
hold on;

% colorbar;
colormap bone;
view(45, 30);
set(gca, projection='perspective');
camlight headlight; 
lighting gouraud;

xq0 = min(max(iii_veh0(:,1), x_min), x_max);
yq0 = min(max(iii_veh0(:,2), y_min), y_max);
xq1 = min(max(iii_veh1(:,1), x_min), x_max);
yq1 = min(max(iii_veh1(:,2), y_min), y_max);
xq2 = min(max(iii_veh2(:,1), x_min), x_max);
yq2 = min(max(iii_veh2(:,2), y_min), y_max);

Z0 = interp2(x_vals, y_vals, U, xq0, yq0, 'linear');
Z1 = interp2(x_vals, y_vals, U, xq1, yq1, 'linear');
Z2 = interp2(x_vals, y_vals, U, xq2, yq2, 'linear');

zoff = 0.02*(max(U(:)) - min(U(:)));
z_const  = max(U(:)) + zoff; 
Z0 = Z0 + zoff;
Z1 = Z1 + zoff;
Z2 = Z2 + zoff;

Ns = 360;   % number of samples per circle
theta = linspace(0, 2*pi, Ns);
for j = 1:size(obstacles, 2)
    cx = obstacles(1,j) + obstacles(3,j)*cos(theta);
    cy = obstacles(2,j) + obstacles(3,j)*sin(theta);
    cxq = min(max(cx, x_min), x_max);
    cyq = min(max(cy, y_min), y_max);
    plot3(cy, cx, z_const*ones(size(cx)), linewidth=2, color='black');
end

v0 = plot3(iii_veh0(:,2), iii_veh0(:,1), Z0, linewidth=2, color=blue, marker='square', ...
    markerindices=numel(iii_veh0(:,1)), markersize=9, markerfacecolor='auto');
v1 = plot3(iii_veh1(:,2), iii_veh1(:,1), Z1, linewidth=2, color=orange, marker='square', ...
    markerindices=numel(iii_veh1(:,1)), markersize=9, markerfacecolor='auto');
v2 = plot3(iii_veh2(:,2), iii_veh2(:,1), Z2, linewidth=2, color=yellow, marker='square', ...
    markerindices=numel(iii_veh2(:,1)), markersize=9, markerfacecolor='auto');
hold off;

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1000, 600]);
box on;
grid on;
pbaspect([1 1 1]);

xlabel('Coordinate $y$ [m]');
xlim([y_min, y_max]);
ylabel('Coordinate $x$ [m]');
ylim([x_min, x_max]);
zlabel('Potential $U$');
zlim([-inf, 1.1*eta]);

if name_fig
    sgtitle(sprintf('\\textbf{Straight move: formation of %s with obstacle avoidance}', ...
            model_type), interpreter='latex', fontsize=18);
end

%% SAVE FIGURE 
if save_fig
    h = gcf;
    set(h, renderer='opengl');      
    set(h, paperorientation='landscape');
    output_folder = '../../graphs/';
    if ~coa
        filename = strcat(output_folder, sprintf('form%s_str_form_%s.pdf', string(scenario), model));
    else
        filename = strcat(output_folder, sprintf('form%s_str_form_%s_coa_3d.pdf', string(scenario), model));
    end
    print(h, '-dpdf', '-r1000', filename);
    fprintf('INFO: Figure saved.\n');
end