% Flight profiles for electric aircraft examples
%
% Copyright 2017-2021 The MathWorks, Inc.

%% Definition of Flight Profile 1
FlightProfileStruct(1).description = 'Height-based flight profile at lower altitude.';
FlightProfileStruct(1).type = 1;                    % Flight Profile Type
FlightProfileStruct(1).v0 = 45.1;                   % Initial airspeed of aircraft in m/s
FlightProfileStruct(1).h0 = 100;                    % Initial height of aircraft in m
FlightProfileStruct(1).FlightProfileHeight = 1000;  % Maximum height of aircraft in m
FlightProfileStruct(1).FlightProfileLength = 8000;  % Maximum flight period length in sec
FlightProfileStruct(1).LevelFlightTime = 100;       % Level flight period length in sec

%% Definition of Flight Profile 2
FlightProfileStruct(2).description = 'Height-based flight profile at higher altitude.';
FlightProfileStruct(2).type = 1;                    % Flight Profile Type
FlightProfileStruct(2).v0 = 50;                     % Initial airspeed of aircraft in m/s
FlightProfileStruct(2).h0 = 900;                    % Initial height of aircraft in m
FlightProfileStruct(2).FlightProfileHeight = 1800;  % Maximum height of aircraft in m
FlightProfileStruct(2).FlightProfileLength = 8000;  % Maximum flight period length in sec
FlightProfileStruct(2).LevelFlightTime = 100;       % Level flight period length in sec

%% Definition of Flight Profile 3
FlightProfileStruct(3).description = 'Time-based flight profile at lower altitude.';
FlightProfileStruct(3).type = 2;                    % Flight Profile Type
FlightProfileStruct(3).v0 = 45.1;                   % Initial airspeed of aircraft in m/s
FlightProfileStruct(3).h0 = 100;                    % Initial height of aircraft in m
FlightProfileStruct(3).ClimbFlightTime = 1000;      % Climb flight period length in sec
FlightProfileStruct(3).FlightProfileLength = 8000;  % Maximum flight period length in sec
FlightProfileStruct(3).LevelFlightTime = 100;       % Level flight period length in sec

%% Definition of Time-Based Flight Profile 2
FlightProfileStruct(4).description = 'Time-based flight profile at higher altitude.';
FlightProfileStruct(4).type = 2;                    % Flight Profile Type
FlightProfileStruct(4).v0 = 50;                     % Initial airspeed of aircraft in m/s
FlightProfileStruct(4).h0 = 900;                    % Initial height of aircraft in m
FlightProfileStruct(4).ClimbFlightTime = 800;       % Climb flight period length in sec
FlightProfileStruct(4).FlightProfileLength = 8000;  % Maximum flight period length in sec
FlightProfileStruct(4).LevelFlightTime = 100;       % Level flight period length in sec
