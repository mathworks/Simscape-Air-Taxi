% Default parameters for electric aircraft examples
%
% Copyright 2017-2021 The MathWorks, Inc.

% Default parameters
battery_capacity        = 100;
battery_vnom            = 200;
battery_pdensity        = 200;
engine_system_mass      = 60;
payload_mass            = 0;
payload_mass_workspace  = 0;
g_norm                  = 9.8;
max_thrust              = 1500;
thrust_tau              = 0.01;
thrust_eff              = 0.9;

gen_torque_demand = 55;       % Torque input to generator in N*m
engine_ref_speed  = 2000;     % Engine RPM command in rpm
motor_ref_speed   = 2000;     % Engine RPM command in rpm

% Initialize Values
HeightBasedProfile = Simulink.Variant('FlightProfileType == 1');
TimeBasedProfile = Simulink.Variant('FlightProfileType == 2');
FlightProfileType = 1;

init_height_type = 0;

% Get flight profile information from Parameter Structure:
FlightProfileChoice = FlightProfileStruct(1);
FlightProfileType = FlightProfileChoice.type;
FlightProfileLength = FlightProfileChoice.FlightProfileLength;

