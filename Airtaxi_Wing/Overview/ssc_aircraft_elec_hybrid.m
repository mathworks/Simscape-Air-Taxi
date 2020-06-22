%% Hybrid Electric Aircraft Component Sizing
%
% This example models a hybrid electric aircraft power network.  It can be
% used to evaluate component sizes with respect to design requirements.
%
% Electric aircraft is an active area of development in the aerospace
% industry. Simulation can accelerate the process of selecting power
% network architectures and sizing components.  This simulation model
% enables rapid exploration of the design space and comparison to design
% criteria, which reduces the number of design iterations and ensures the
% final design meets system-level requirements.
%
% In this example, aircraft configurations, power networks, and component
% sizes are all parameterized using MATLAB. You can test a single-seat
% light aircraft (such as Airbus E-Fan), double-seat light aircraft (such
% as Pipistrel Alpha Electro), or a custom design. Design parameters, such
% as battery capacity and payload mass, can be swept over a set of values
% to determine which combinations will meet flight range requirements.  A
% separate model enables a comparison with a pure electric architecture.
% 
% Copyright 2017-2020 The MathWorks, Inc.

%% Model
%
% The electric aircraft model includes a battery, two DC networks, and a
% mechanical model of the aircraft which acts a load on the high voltage DC
% network.  A combustion engine drives a generator which supplements the
% power available from the battery and can be used to recharge the battery
% during flight. The mass of the fuel consumed by the engine is included in
% the simulation.  The low voltage DC network includes a set of loads that
% turn on and off during the flight cycle, including the fuel pump for the
% combustion engine.

open_system('ssc_aircraft_elec_hybrid')

set_param(find_system('ssc_aircraft_elec_hybrid','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Aircraft Subsystem
%
% This subsystem models the aircraft as a load on the motor.  This abstract
% model assumes that the pilot takes the actions necessary to follow the
% desired flight cycle, set by alpha (angle of attack) and gamma (flight
% path angle with respect to the earth reference frame).  It calculates the
% required thrust to maintain the lift to follow the flight cycle.  The
% mechanical power required to deliver this thrust is calculated and
% converted to the load torque on the motor shaft.
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/Aircraft','force'); Open Subsystem>

set_param('ssc_aircraft_elec_hybrid/Aircraft','LinkStatus','none')
open_system('ssc_aircraft_elec_hybrid/Aircraft','force')

%% Load Torque Subsystem
%
% This subsystem converts the required mechancial power into the load
% torque on the motor shaft.  This abstract model assumes that a specified
% amount of the motor's mechanical power is converted into thrust. Dividing
% the required power to maintain thrust by the motor speed results in the
% load torque on the motor shaft.  The motors control system adjusts to
% maintain the required shaft speed under the varying load.
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/Aircraft/Load%Torque','force'); Open Subsystem>

open_system('ssc_aircraft_elec_hybrid/Aircraft/Load Torque','force')

%% Motor Subsystem
%
% This subsystem represents an electric motor and drive electronics
% operating in torque-control mode, or equivalently current-control mode.
% The motor's permissible range of torques and speeds is defined by a
% torque-speed envelope.
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/Motor','force'); Open Subsystem>

set_param('ssc_aircraft_elec_hybrid/Motor','LinkStatus','none')
open_system('ssc_aircraft_elec_hybrid/Motor','force')

%% DC Power Distribution Subsystem
%
% This subsytem models the breakers that open and close to connect and
% disconnect loads from the low voltage DC network.  The varying conditions
% affect the power drawn from the network, the range of the aircraft, and
% the power requirements for the power lines in the aircraft
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/DC%20Power%20Distribution','force'); Open Subsystem>

set_param('ssc_aircraft_elec_hybrid/DC Power Distribution','LinkStatus','none')
open_system('ssc_aircraft_elec_hybrid/DC Power Distribution','force')

%% Fuel Pump Subsystem
%
% This subsystem models the fuel pump.  An electric motor drives a pump
% that pushes fuel through a valve.  The opening of the valve varies during
% the flight cycle, which changes the current that the motor draws from the
% DC network.
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/Fuel%20Pump','force'); Open Subsystem>

set_param('ssc_aircraft_elec_hybrid/Fuel Pump','LinkStatus','none')
open_system('ssc_aircraft_elec_hybrid/Fuel Pump','force')

%% Generator Subsystem
%
% This subsystem represents the generator and drive electronics operating in
% torque-control mode, or equivalently current-control mode. It is driven
% by the combustion engine to supply additional electrical power to the
% aircraft network.
%
% <matlab:open_system('ssc_aircraft_elec_hybrid');open_system('ssc_aircraft_elec_hybrid/Generator','force'); Open Subsystem>

set_param('ssc_aircraft_elec_hybrid/Generator','LinkStatus','none')
open_system('ssc_aircraft_elec_hybrid/Generator','force')

%% Simulation Results from Simscape Logging
%%
%
% The plots below show the results of a single simulation.  The aircraft
% starts from a low altitude, climbs to a higher altitude and keeps level
% flight. The first plot shows the battery states of a pure electrical
% aircraft during a flight cycle. The second plot shows the current and
% power levels during simulation.
%

ssc_aircraft_elec_hybrid_plot1time

%% Results from Parameter Sweep of Battery Capacities
%
% The plots below show the effect of battery capacity on the flight range
% and maximum flight time of the aircraft. The relationship between the
% battery size and the range is not linear because increasing battery
% capacity also increases the overall weight of the aircraft.
%

payload_mass = 0;
modelname = bdroot;
ssc_aircraft_sweep_battery;

%% Results from Parameter Sweep of Payload Mass
%
% The plots below show the effect of payload mass on flight range and
% maximum flight time of the aircraft. Varying the payload mass represents
% adding additional luggage or an additional passenger to the aircraft
%

battery_capacity = 200;
modelname = bdroot;
ssc_aircraft_sweep_payload;

%% Results from Parameter Sweep of Battery Capacity and Payload Mass
%
% The plots below show the effect of varying both the payload mass and
% battery capacity on flight range. A significant percentage of the
% design space examined will permit flights of over 160 km (100 miles).
%

modelname = bdroot;
ssc_aircraft_sweep_payloadbattery;
close(h4_ssc_aircraft_elec_hybrid)

%% Comparison with Electric Architecture
%
% A separate model includes a electric-only architecture.  Testing both
% of these models enables a comparison of the architectures against design
% requirements.
%
%

open_system('ssc_aircraft_elec')
set_param(find_system('ssc_aircraft_elec','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% 
% The plots below show that for a given payload or battery capacity, the
% hybrid electric aircraft will permit a longer flight.

payload_mass = 0;
ssc_aircraft_sweep_battery_compare
close(h3_ssc_aircraft_elec)
close(h3_ssc_aircraft_elec_hybrid)

battery_capacity = 200;
ssc_aircraft_sweep_payload_compare
close(h4_ssc_aircraft_elec)
close(h4_ssc_aircraft_elec_hybrid)

%%
% The plots below show that the hybrid electric aircraft will achieve
% flights of over 160 km (100 miles) in a larger percentage of the design
% space.

ssc_aircraft_sweep_payloadbattery_compare
close(h8_ssc_aircraft_elec)
close(h8_ssc_aircraft_elec_hybrid)

%%
close all
bdclose all