% Code to plot simulation results from ssc_airvtol_elec
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
if ~exist('simlog_ssc_airvtol_elec', 'var')
    sim('ssc_airvtol_elec')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_ssc_airvtol_elec', 'var') || ...
        ~isgraphics(h1_ssc_airvtol_elec, 'figure')
    h1_ssc_airvtol_elec = figure('Name', 'Battery States in ssc_airvtol_elec');
end
figure(h1_ssc_airvtol_elec)
clf(h1_ssc_airvtol_elec)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t = simlog_ssc_airvtol_elec.Battery.charge.series.time;
% Get battery information
simlog_batterycharge = simlog_ssc_airvtol_elec.Battery.charge.series.values('A*hr');
simlog_batteryvoltage = simlog_ssc_airvtol_elec.Battery.v.series.values('V');
simlog_batterycurrent = simlog_ssc_airvtol_elec.Battery.i.series.values('A');

% Plot results
simlog_handles(1) = subplot(3, 1, 1);
plot(simlog_t/60, simlog_batterycharge, 'LineWidth', 1)
hold off
grid on
title('Battery Charge')
text(0.98,1.10,'Pure Electric Network','Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
ylabel('Charge (A*hr)')

simlog_handles(2) = subplot(3, 1, 2);
plot(simlog_t/60, simlog_batteryvoltage, 'LineWidth', 1)
grid on
title('Battery Voltage')
ylabel('Voltage (V)')

simlog_handles(3) = subplot(3, 1, 3);
plot(simlog_t/60, simlog_batterycurrent, 'LineWidth', 1)
grid on
title('Battery Current')
ylabel('Current (A)')
xlabel('Time (min)')

linkaxes(simlog_handles, 'x')

% Reuse figure if it exists, else create new figure
if ~exist('h2_ssc_airvtol_elec', 'var') || ...
        ~isgraphics(h2_ssc_airvtol_elec, 'figure')
    h2_ssc_airvtol_elec = figure('Name', 'Currents and Power Levels in ssc_airvtol_elec');
end
figure(h2_ssc_airvtol_elec)
clf(h2_ssc_airvtol_elec)

% Get current flow situations
simlog_motor1 = simlog_ssc_airvtol_elec.Motor1.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor2 = simlog_ssc_airvtol_elec.Motor2.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor3 = simlog_ssc_airvtol_elec.Motor3.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor4 = simlog_ssc_airvtol_elec.Motor4.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor5 = simlog_ssc_airvtol_elec.Motor5.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor6 = simlog_ssc_airvtol_elec.Motor6.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor7 = simlog_ssc_airvtol_elec.Motor7.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_motor8 = simlog_ssc_airvtol_elec.Motor8.Electrical_Power.Current_Sensor.I.series.values('A');
simlog_load = simlog_ssc_airvtol_elec.DC_Power_Distribution.Resistor.i.series.values('A');

% Get load power levels
simlog_lamp = simlog_ssc_airvtol_elec.Lamp.Electrical_Power.PS_Product.O.series.values('W');
simlog_heater = simlog_ssc_airvtol_elec.Heater.Electrical_Power.PS_Product.O.series.values('W');
simlog_avionics = simlog_ssc_airvtol_elec.Avionics.Electrical_Power.PS_Product.O.series.values('W');

simlog_handles(4) = subplot(2, 1, 1);
plot(simlog_t/60, simlog_load, 'LineWidth', 1)
hold on
plot(simlog_t/60, simlog_motor1, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor2, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor3, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor4, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor5, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor6, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor7, 'LineWidth', 1)
plot(simlog_t/60, simlog_motor8, 'LineWidth', 1)
text(0.98,1.05,'Pure Electric Network','Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
grid on
legend('Load','Motor1','Motor2','Motor3','Motor4','Motor5','Motor6','Motor7','Motor8','Location','best')
title('Current Levels')
ylabel('Current (A)')

simlog_handles(5) = subplot(2, 1, 2);
plot(simlog_t/60, simlog_lamp, 'LineWidth', 1)
hold on
plot(simlog_t/60, simlog_heater, 'LineWidth', 1)
plot(simlog_t/60, simlog_avionics, 'LineWidth', 1)
grid on
legend('Lamp','Heater','Avionics','Location','best')
title('Power Levels')
ylabel('Power (W)')
xlabel('Time (min)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles simlog_batterycurrent temp_colororder
clear simlog_batterycharge simlog_batteryvoltage 
clear simlog_motor simlog_load simlog_generator 
clear simlog_lamp simlog_heater simlog_avionics
