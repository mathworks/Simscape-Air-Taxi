% Code to plot simulation results from ssc_aircraft_elec_hybrid
%% Plot Description:
%
% The plots below show the results of a single simulation.  The aircraft
% starts from a low altitude, climbs to a higher altitude and keeps level
% flight. The first plot shows the battery states of a pure electrical
% aircraft during a flight cycle. The second plot shows the current and
% power levels during simulation.
%
% Copyright 2017-2021 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_ssc_aircraft_elec_hybrid', 'var')
    sim('ssc_aircraft_elec_hybrid')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_ssc_aircraft_elec_hybrid', 'var') || ...
        ~isgraphics(h1_ssc_aircraft_elec_hybrid, 'figure')
    h1_ssc_aircraft_elec_hybrid = figure('Name', 'Battery States in ssc_aircraft_elec_hybrid');
end
figure(h1_ssc_aircraft_elec_hybrid)
clf(h1_ssc_aircraft_elec_hybrid)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_ssc_aircraft_elec_hybrid.Battery.charge.series.time;
% Get battery information
simlog_batterycharge_hybrid = simlog_ssc_aircraft_elec_hybrid.Battery.charge.series.values('A*hr');
simlog_batteryvoltage_hybrid = simlog_ssc_aircraft_elec_hybrid.Battery.v.series.values('V');
simlog_batterycurrent_hybrid = simlog_ssc_aircraft_elec_hybrid.Battery.i.series.values('A');

% Plot results
simlog_handles(1) = subplot(3, 1, 1);
plot(simlog_t/60, simlog_batterycharge_hybrid, 'LineWidth', 1)
text(0.98,1.10,'Hybrid Electric Network','Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
grid on
title('Battery Charge')
ylabel('Charge (A*hr)')

simlog_handles(2) = subplot(3, 1, 2);
plot(simlog_t/60, simlog_batteryvoltage_hybrid, 'LineWidth', 1)
grid on
title('Battery Voltage')
ylabel('Voltage (V)')

simlog_handles(3) = subplot(3, 1, 3);
plot(simlog_t/60, simlog_batterycurrent_hybrid, 'LineWidth', 1)
grid on
title('Battery Current')
ylabel('Current (A)')
xlabel('Time (min)')

linkaxes(simlog_handles, 'x')

% Reuse figure if it exists, else create new figure
if ~exist('h2_ssc_aircraft_elec_hybrid', 'var') || ...
        ~isgraphics(h2_ssc_aircraft_elec_hybrid, 'figure')
    h2_ssc_aircraft_elec_hybrid = figure('Name', 'Currents and Power Levels in ssc_aircraft_elec_hybrid');
end
figure(h2_ssc_aircraft_elec_hybrid)
clf(h2_ssc_aircraft_elec_hybrid)

% Get current flow situations
simlog_motor_hybrid = simlog_ssc_aircraft_elec_hybrid.Motor.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_load_hybrid = simlog_ssc_aircraft_elec_hybrid.DC_Power_Distribution.Resistor.i.series.values('A');
simlog_generator_hybrid = simlog_ssc_aircraft_elec_hybrid.Generator.Electrical_Power.Current_Sensor.I.series.values('A');

% Get load power levels
simlog_lamp_hybrid = simlog_ssc_aircraft_elec_hybrid.Lamp.Electrical_Power.PS_Product.O.series.values('W');
simlog_heater_hybrid = simlog_ssc_aircraft_elec_hybrid.Heater.Electrical_Power.PS_Product.O.series.values('W');
simlog_avionics_hybrid = simlog_ssc_aircraft_elec_hybrid.Avionics.Electrical_Power.PS_Product.O.series.values('W');
simlog_pump_hybrid = simlog_ssc_aircraft_elec_hybrid.Fuel_Pump.Electrical_Power.PS_Product.O.series.values('W');

simlog_handles(4) = subplot(2, 1, 1);
plot(simlog_t/60, simlog_motor_hybrid, 'LineWidth', 1)
hold on
plot(simlog_t/60, simlog_load_hybrid, 'LineWidth', 1)
plot(simlog_t/60, -simlog_generator_hybrid, 'LineWidth', 1)
hold off
text(0.98,1.05,'Hybrid Electric Network','Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
grid on
legend('Motor','Load','Generator','Location','best')
title('Current Levels')
ylabel('Current (A)')

simlog_handles(5) = subplot(2, 1, 2);
plot(simlog_t/60, simlog_lamp_hybrid, 'LineWidth', 1)
hold on
plot(simlog_t/60, simlog_heater_hybrid, 'LineWidth', 1)
plot(simlog_t/60, simlog_avionics_hybrid, 'LineWidth', 1)
plot(simlog_t/60, simlog_pump_hybrid, 'LineWidth', 1)
grid on
legend('Lamp','Heater','Avionics','Fuel Pump','Location','best')
title('Power Levels')
ylabel('Power (W)')
xlabel('Time (min)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles simlog_batterycurrent_hybrid temp_colororder
clear simlog_batterycharge_hybrid simlog_batteryvoltage_hybrid 
clear simlog_motor_hybrid simlog_load_hybrid simlog_generator_hybrid 
clear simlog_lamp_hybrid simlog_heater_hybrid simlog_avionics_hybrid
clear simlog_pump_hybrid

