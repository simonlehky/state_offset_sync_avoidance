%% INITIALIZATION
addpath('../');
addpath('../sim');
format short;

% open library
if ~bdIsLoaded('lib_vehicle_dyn')
    open_system('lib_vehicle_dyn');
    fprintf('INFO: Library lib_vehicle_dyn has been opened.\n')
end

f = 50;     % [Hz]
Ts = 1/f;
max_time = 60;

u_sat = 5;  % [m/s^2]
safety_dist = 3;    % [m]

str_get_form_scen;  % get position and velocity initial conditions and offsets

% enable contribution from collision and obstacle avoidance
if scenario == 1
    use_col = 0;
    use_obs = 0;
elseif scenario == 2
    use_col = 1;
    use_obs = 0;
elseif scenario == 3
    use_col = 0;
    use_obs = 1;
end

%% DISTURBANCE
% white noise
if scenario == 2
    % distance-only field cannot resolve exactly aligned head-on exchange,
    % small white noise breaks symmetry
    wn_amp = 0.0005;
else
    wn_amp = 0;
end
wn_smpl_time = Ts;
wn_gain = 1;

% pulse generator
pg_amp = 10;
pg_period = 0.4;
pg_pw = 10;  % [%]
pg_gain = 0;