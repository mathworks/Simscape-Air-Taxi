% Code to sweep payload mass and battery for electric aircraft examples
% and plot results.
%
% Copyright 2017-2021 The MathWorks, Inc.

% Minimum range for aircraft for plot
min_range = 160;  % km

% Test set for battery capacity
battery_capacity_set = [100:20:200];
payload_set = [0:10:120];

% Code can be used on different models
if (~exist('modelname','var'))
    modelname = 'ssc_aircraft_elec';
end

open_system(modelname)

% Set flight profile based on workspace
set_param([modelname '/Flight Cycle'], 'popup_flight_cycle_type', FlightProfileChoice.type-1);
set_param(modelname, 'StopTime', 'FlightProfileLength');

% Configure payload mass to be a run-time parameter
% Ensure value is set from MATLAB Workspace, not Simulink Mask
temp_payload_spec_method = get_param([modelname '/Aircraft'],'checkbox_payload_mass');
set_param([modelname '/Aircraft'],'checkbox_payload_mass','off');


% Store simulation inputs
clear simInput
temp_run_num = 0;

for temp_bc_i = 1:length(battery_capacity_set)
    for temp_pay_i = 1:length(payload_set)
    temp_run_num = temp_run_num+1;
    simInput(temp_run_num) = Simulink.SimulationInput(modelname);
    simInput(temp_run_num) = simInput(temp_run_num).setVariable('battery_capacity',battery_capacity_set(temp_bc_i));
    simInput(temp_run_num) = simInput(temp_run_num).setVariable('payload_mass_workspace',payload_set(temp_pay_i));
    end
end

% Run simulation using Fast Restart
simOut = [];
simOut = sim(simInput,'ShowProgress','off','UseFastRestart','on');

temp_run_num = 0;
for temp_bc_i = 1:length(battery_capacity_set)
    for temp_pay_i = 1:length(payload_set)
        temp_run_num = temp_run_num+1;
        temp_dist_payl_ele(temp_pay_i,temp_bc_i) = simOut(temp_run_num).Distance(end);
        temp_dura_payl_ele(temp_pay_i,temp_bc_i) = simOut(temp_run_num).tout(end);
    end
end



%% Plot simulation results
% Prepare figure windows
if(strcmp(modelname,'ssc_aircraft_elec'))
    if ~exist('h8_ssc_aircraft_elec', 'var') || ...
            ~isgraphics(h8_ssc_aircraft_elec, 'figure')
        h8_ssc_aircraft_elec = figure('Name', 'ssc_aircraft_elec');
    end
    figure(h8_ssc_aircraft_elec)
    clf(h8_ssc_aircraft_elec)
    temp_annotation_str = 'Pure Electric';
else
    if ~exist('h8_ssc_aircraft_elec_hybrid', 'var') || ...
            ~isgraphics(h8_ssc_aircraft_elec_hybrid, 'figure')
        h8_ssc_aircraft_elec_hybrid = figure('Name', 'ssc_aircraft_elec_hybrid');
    end
    figure(h8_ssc_aircraft_elec_hybrid)
    clf(h8_ssc_aircraft_elec_hybrid)
    temp_annotation_str = 'Hybrid Electric';
end

% Plot results
[payGrid,battGrid] = meshgrid(payload_set,battery_capacity_set);
temp_s1_h =surf(battGrid,payGrid,temp_dist_payl_ele');
temp_s1_h.EdgeColor='none';
hold on
temp_s2_h =surf(battGrid([1 end]),payGrid([1 end]),min_range*ones(2));
set(temp_s2_h,'FaceColor',[1 1 1]*0.2,'FaceAlpha',0.8)
hold off
text(0.35,0.9,0.9,sprintf('%s < %d km','Range',min_range),...
    'Units','Normalized',...
    'HorizontalAlignment','center',...
    'Color','w','FontWeight','Bold','FontSize',12)

text(0.05,0.05,0.9,temp_annotation_str,...
    'Units','Normalized',...
    'HorizontalAlignment','left',...
    'Color','w','FontSize',12)

% Top view for overview of design space
view(0,90)
xlabel('Battery Capacity (A*hr)');
ylabel('Payload (kg)');
title('Sweep Battery Capacity, Payload')
clb_h = colorbar;
clb_h.Label.String = 'Flight Range (km)';
colormap(flipud(cool))

clear temp_s1_h temp_s2_h clb_h temp_annotation_str
clear simlog_handles
