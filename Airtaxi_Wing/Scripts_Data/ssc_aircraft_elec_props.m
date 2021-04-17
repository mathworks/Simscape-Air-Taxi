function [mass, wing_area, cd, cl] = ssc_aircraft_elec_props(aircraft_type)
% Returns mass, equivalent wing area, coefficient of drag, coefficient of
% lift properties for a requested aircraft type.

% Copyright 2017-2021 The MathWorks, Inc.

% Data for single seat aircraft similar to Airbus E-Fan
aircraft.singleseatairbusefan.mass          = 360;   % kg without battery
aircraft.singleseatairbusefan.wing_area     = 10;    % m^2
aircraft.singleseatairbusefan.cl            = 0.5;   % Lift coefficient
aircraft.singleseatairbusefan.cd            = 0.05;  % Drag coefficient

% Data for double seat aircraft similar to Alpha Electro
aircraft.doubleseatalphaelectro.mass        = 360;   % kg without battery
aircraft.doubleseatalphaelectro.wing_area   = 15;    % m^2
aircraft.doubleseatalphaelectro.cl          = 0.45;  % Lift coefficient
aircraft.doubleseatalphaelectro.cd          = 0.055; % Drag coefficient

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
        