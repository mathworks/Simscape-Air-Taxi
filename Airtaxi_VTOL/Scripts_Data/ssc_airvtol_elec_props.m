function [mass, wing_area, cd, cl] = ssc_airvtol_elec_props(aircraft_type)
% Returns mass, equivalent wing area, coefficient of drag, coefficient of
% lift properties for a requested aircraft type.

% Copyright 2017-2021 The MathWorks, Inc.

% Data for single seat aircraft similar to Airbus E-Fan
aircraft.singleseatehang184.mass                = 210;   % kg without battery
aircraft.singleseatehang184.wing_area           = 4;     % m^2
aircraft.singleseatehang184.cl                  = 0.5;   % Lift coefficient
aircraft.singleseatehang184.cd                  = 0.05;  % Drag coefficient

% Data for double seat aircraft similar to Alpha Electro
aircraft.doubleseatworkhorsesurefly.mass        = 400;   % kg without battery
aircraft.doubleseatworkhorsesurefly.wing_area   = 9;    % m^2
aircraft.doubleseatworkhorsesurefly.cl          = 0.45;  % Lift coefficient
aircraft.doubleseatworkhorsesurefly.cd          = 0.055; % Drag coefficient

field_name = lower(strrep(strrep(strrep(strrep(...
    aircraft_type,' ',''),...
    '-',''),...
    '(',''),...
    ')',''));


% Assign output
mass        = aircraft.(field_name).mass;
wing_area   = aircraft.(field_name).wing_area;
cd          = aircraft.(field_name).cd;
cl          = aircraft.(field_name).cl;
        