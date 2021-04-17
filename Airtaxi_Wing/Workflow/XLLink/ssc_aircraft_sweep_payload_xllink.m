% Code to sweep payload mass for a single electric aircraft example and
% plot results.
%
% Copyright 2017-2021 The MathWorks, Inc.

% payload_set = [0:10:120]; % - COMMENTED OUT, get from Excel

if (~exist('modelname','var'))
    modelname = 'ssc_aircraft_elec';
end

% open_system(modelname) 

% Set flight profile based on workspace
set_param([modelname '/Flight Cycle'], 'popup_flight_cycle_type', FlightProfileChoice.type-1);
set_param(modelname, 'StopTime', 'FlightProfileLength');

% Configure payload mass to be a run-time parameter
% Ensure value is set from MATLAB Workspace, not Simulink Mask
temp_payload_spec_method = get_param([modelname '/Aircraft'],'checkbox_payload_mass');
set_param([modelname '/Aircraft'],'checkbox_payload_mass','off');

% Store simulation inputs
clear simInput
for temp_pay_i = 1:length(payload_set)
    simInput(temp_pay_i) = Simulink.SimulationInput(modelname);
    simInput(temp_pay_i) = simInput(temp_pay_i).setVariable('payload_mass_workspace',payload_set(temp_pay_i));
end

% Run simulation using Fast Restart
simOut = [];
simOut = sim(simInput,'ShowProgress','off','UseFastRestart','on');

% Get simulation results
temp_distance = zeros(length(simOut),1);
temp_duration = zeros(length(simOut),1);
for temp_py_i=1:length(simOut)
    temp_distance(temp_py_i) = simOut(temp_py_i).Distance(end);
    temp_duration(temp_py_i) = simOut(temp_py_i).tout(end);
end

% Reuse figure if it exists, else create new figure
%{
if(strcmp(modelname,'ssc_aircraft_elec'))
    if ~exist('h4_ssc_aircraft_elec', 'var') || ...
            ~isgraphics(h4_ssc_aircraft_elec, 'figure')
        h4_ssc_aircraft_elec = figure('Name', 'ssc_aircraft_elec');
    end
    figure(h4_ssc_aircraft_elec)
    clf(h4_ssc_aircraft_elec)
    temp_clr_ind = 1;
    temp_plotsym = 'o-';
else
    if ~exist('h4_ssc_aircraft_elec_hybrid', 'var') || ...
            ~isgraphics(h4_ssc_aircraft_elec_hybrid, 'figure')
        h4_ssc_aircraft_elec_hybrid = figure('Name', 'ssc_aircraft_elec_hybrid');
    end
    figure(h4_ssc_aircraft_elec_hybrid)
    clf(h4_ssc_aircraft_elec_hybrid)
    temp_clr_ind = 2;
    temp_plotsym = '*-';
end

temp_colororder = get(gca,'defaultAxesColorOrder');

% Plot results
simlog_handles(1) = subplot(1,2,1);
plot(temp_distance,payload_set,temp_plotsym,'LineWidth',1,'Color',temp_colororder(temp_clr_ind,:));
text(0.95,0.95,['Battery: ' num2str(battery_capacity) ' A*hr'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
title(['Range vs. Payload']);
ylabel('Payload Mass (kg)');
xlabel('Flight Range (km)');
grid on

simlog_handles(2) = subplot(1,2,2);
plot(temp_duration/60,payload_set,temp_plotsym,'LineWidth',1,'Color',temp_colororder(temp_clr_ind,:));
title(['Max Flight Time vs. Payload']);
text(0.95,0.95,['Battery: ' num2str(battery_capacity) ' A*hr'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
ylabel('Payload Mass (kg)');
xlabel('Max Flight Time (min)');
grid on

linkaxes(simlog_handles, 'y');
%}

set_param([modelname '/Aircraft'],'checkbox_payload_mass',temp_payload_spec_method);

clear simlog_handles
clear temp_clr_ind temp_colororder temp_plotsym temp_pay_i
clear temp_distance temp_duration temp_py_i temp_payload_spec_method
 