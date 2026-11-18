%% PARAMS
n = 3;  % number of agents
colors = ["#0072BD", "#D95319", "#EDB120"];

%% SET LATEX FONT
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% INITALIZE POSITION AND VELOCITY ARRAYS
X0 = [veh0(1,1:2); veh1(1,1:2); veh2(1,1:2)];
dX0 = [veh0(1,3:4); veh1(1,3:4); veh2(1,3:4)];

form_pos = zeros(n,2,length(time)-1);
form_pos(:,:,1) = X0;

form_vel = zeros(n,2,length(time)-1);
form_vel(:,:,1) = dX0;

%% FIGURE SETUP
fig = figure;
ax = axes(fig);

set(gca, fontsize=14);
set(gcf, position=[100, 100, 1920, 1080]);
box on;
grid on;
if use_axis_equal
    axis equal;
end

hold on;
plot(veh0(:,2), veh0(:,1), linewidth=2, color=colors(1), marker='square', ...
    markerindices=numel(veh0(:,1)), markersize=13, markerfacecolor='auto', handlevisibility='off');
plot(veh1(:,2), veh1(:,1), linewidth=2, color=colors(2), marker='square', ...
    markerindices=numel(veh0(:,1)), markersize=13, markerfacecolor='auto', handlevisibility='off');
plot(veh2(:,2), veh2(:,1), linewidth=2, color=colors(3), marker='square', ...
    markerindices=numel(veh0(:,1)), markersize=13, markerfacecolor='auto', handlevisibility='off');

if coa
    % plot obstacles
    theta = linspace(0, 2*pi);
    for j = 1:size(obstacles, 2)
        cx = obstacles(1,j) + obstacles(3,j)*cos(theta);
        cy = obstacles(2,j) + obstacles(3,j)*sin(theta);
        fill(cy, cx, 'black', handlevisibility='off');
    end
end

% UI controls
text(1.09, 0.88, 'Zoom', interpreter='latex', fontsize=14, ...
    units='normalized', horizontalalignment='right');
zoom_slider = uicontrol(style='slider', min=5, max=50, value=20, ...
    units='normalized', position=[0.945, 0.2, 0.03, 0.6], ...
    backgroundcolor=[0.8 0.8 0.8], callback=@(src, event) adjust_zoom(src, ax));

h_fixed = gobjects(n,1);
arrow_handles = gobjects(n-1,1);

title(vid_title, fontsize=18);
subtitle(model_type, fontsize=14);
xlabel('Coordinate $y$ [m]');
ylabel('Coordinate $x$ [m]');

% store UI data
data.ax = ax;
data.h_fixed = h_fixed;
data.positions_fixed = form_pos;
guidata(fig, data);

%% VIDEO SETUP
if save_vid
    path = '../../videos/';  % possible to change path to save video
    filename = strcat('form', num2str(scenario), '_', vid_name);
    filename = strcat(filename, '.mp4');
    
    % check if video file already exists
    if exist(strcat(path, filename), 'file')
        fprintf("INFO: File already exists. Press 'y' if you wish to " + ...
                "delete it or 'n' otherwise.\n");
        while true
            cur_key = input('', 's');
            if strcmp(cur_key, 'y')
                delete(strcat(path, filename));
                fprintf('INFO: Original video deleted.\n');
                break;
            elseif strcmp(cur_key, 'n')
                fprintf('INFO: Visualization terminated. Choose different file name.\n');
                close(fig);
                return;
            else
                fprintf('WARN: Incorrect key pressed.\n');
            end
        end
    end
    
    vid = VideoWriter(strcat(path, filename), 'MPEG-4');
    vid.FrameRate = 30;
    
    open(vid);  % open video writer
end

%% SIMULATION LOOP
fprintf('INFO: Visualization started.\n');

for t = 1:length(time)-1
    X = [veh0(t,1:2); veh1(t,1:2); veh2(t,1:2)];
    dX = [veh0(t,3:4); veh1(t,3:4); veh2(t,3:4)];
    form_pos(:,:,t) = X;
    form_vel(:,:,t) = dX;
    
    data.positions_fixed = X;
    guidata(fig, data);
    adjust_zoom(zoom_slider, ax);
    
    for i = 1:n
        if isvalid(h_fixed(i))
            delete(h_fixed(i));
        end
        h_fixed(i) = plot(X(i,2), X(i,1), 'o', markersize=13, ...
            markerfacecolor=colors(i), markeredgecolor='black');
        
        if i < n && isvalid(arrow_handles(i))
            delete(arrow_handles(i));
        end
        if i < n
            arrow_handles(i) = quiver(X(i,2), X(i,1), ...
                X(i+1,2) - X(i,2), X(i+1,1) - X(i,1), ...
                0, maxheadsize=0.5, color='black', linewidth=1.5, handlevisibility='off');
        end
        if use_axis_equal
            axis equal;
        end
    end

    legend('Leader', 'Follower 1', 'Follower 2', location='South', fontsize=14, ...
           orientation='horizontal');
    
    if save_vid
        % capture frame and write to video
        frame = getframe(fig);
        writeVideo(vid, frame);
    end
    
    pause(Ts);
end

%% FINISH VIDEO
if save_vid
    close(vid);
    clear vid;
    fprintf('INFO: Video saved as ' + string(filename) + '.\n');
end

%% FUNCTIONS
function adjust_zoom(src, ax)   % adjust zoom to fit window
    data = guidata(src);
    zoom_factor = get(src, 'Value');
    centroid = mean(data.positions_fixed, 1);
    set(ax, xlim=[centroid(2) - zoom_factor, centroid(2) + zoom_factor], ...
            ylim=[centroid(1) - zoom_factor, centroid(1) + zoom_factor]);
end