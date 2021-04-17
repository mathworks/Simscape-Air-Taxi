% Code to sweep battery capacity for a single electric aircraft example and
% plot results.
%
% Copyright 2017-2021 The MathWorks, Inc.

battery_capacity_set = [100:20:200];

if (~exist('modelname','var'))
    modelname = 'ssc_aircraft_elec';
end

open_system(modelname)

% Set flight profile based on workspace
set_param([modelname '/Flight Cycle'], 'popup_flight_cycle_type', FlightProfileChoice.type-1);
set_param(modelname, 'StopTime', 'FlightProfileLength');

% Store simulation inputs
clear simInput
for temp_bc_i = 1:length(battery_capacity_set)
    simInput(temp_bc_i) = Simulink.SimulationInput(modelname);
    simInput(temp_bc_i) = simInput(temp_bc_i).setVariable('battery_capacity',battery_capacity_set(temp_bc_i));
end

clear simOut
% Run simulation using Fast Restart
simOut = sim(simInput,'ShowProgress','off','UseFastRestart','on');

% Get simulation results
temp_distance = zeros(length(simOut),1);
temp_duration = zeros(length(simOut),1);
for temp_bc_i=1:length(simOut)
    temp_distance(temp_bc_i) = simOut(temp_bc_i).Distance(end);
    temp_duration(temp_bc_i) = simOut(temp_bc_i).tout(end);
end

% Reuse figure if it exists, else create new figure
if(strcmp(modelname,'ssc_aircraft_elec'))
    if ~exist('h3_ssc_aircraft_elec', 'var') || ...
            ~isgraphics(h3_ssc_aircraft_elec, 'figure')
        h3_ssc_aircraft_elec = figure('Name', 'ssc_aircraft_elec');
    end
    figure(h3_ssc_aircraft_elec)
    clf(h3_ssc_aircraft_elec)
    temp_clr_ind = 1;
    temp_plotsym = 'o-';
else
    if ~exist('h3_ssc_aircraft_elec_hybrid', 'var') || ...
            ~isgraphics(h3_ssc_aircraft_elec_hybrid, 'figure')
        h3_ssc_aircraft_elec_hybrid = figure('Name', 'ssc_aircraft_elec_hybrid');
    end
    figure(h3_ssc_aircraft_elec_hybrid)
    clf(h3_ssc_aircraft_elec_hybrid)
	temp_clr_ind = 2;
    temp_plotsym = '*-';
end

temp_colororder = get(gca,'defaultAxesColorOrder');

% Plot results
simlog_handles(1) = subplot(1,2,1);
plot(temp_distance,battery_capacity_set,temp_plotsym,'LineWidth',1,'Color',temp_colororder(temp_clr_ind,:));
text(0.05,0.95,['Payload: ' num2str(payload_mass) ' kg'],'Units','Normalized','Color',[0.4 0.4 0.4]);
title('Range vs. Battery Capacity');
ylabel('Battery Capacity (A*hr)');
xlabel('Flight Range (km)');
grid on

simlog_handles(2) = subplot(1,2,2);
plot(temp_duration/60,battery_capacity_set,temp_plotsym,'LineWidth',1,'Color',temp_colororder(temp_clr_ind,:));
text(0.05,0.95,['Payload: ' num2str(payload_mass) ' kg'],'Units','Normalized','Color',[0.4 0.4 0.4]);
title('Max Flight Time vs. Battery Capacity');
ylabel('Battery Capacity (A*hr)');
xlabel('Max Flight Time (min)');
grid on

linkaxes(simlog_handles, 'y');

clear simlog_handles
clear temp_distance temp_plotsym temp_colororder tempclr_ind
clear temp_bc_i temp_clr_ind temp_duration