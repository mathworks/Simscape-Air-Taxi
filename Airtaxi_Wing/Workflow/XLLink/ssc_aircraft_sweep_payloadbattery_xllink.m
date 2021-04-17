% Code to sweep payload mass and battery for electric aircraft examples
% and plot results.
%
% Copyright 2017-2021 The MathWorks, Inc.

% Minimum range for aircraft for plot
%min_range = 160;  % km               - COMMENTED OUT - get from Excel

% Test set for battery capacity
%battery_capacity_set = [100:20:200]; - COMMENTED OUT - get from Excel

% Code can be used on different models
if (~exist('modelname','var'))
    modelname = 'ssc_aircraft_elec';
end

% Loop over battery capacity
for bc_i=1:length(battery_capacity_set)
    battery_capacity = battery_capacity_set(bc_i);
    
    % Loop over payload
    ssc_aircraft_sweep_payload_xllink
    
    % Save simulation results
    for temp_py_i=1:length(simOut)
        temp_dist_payl_ele(temp_py_i,bc_i) = simOut(temp_py_i).Distance(end);
        temp_dura_payl_ele(temp_py_i,bc_i) = simOut(temp_py_i).tout(end);
    end
end


%% Plot simulation results
% Prepare figure windows
%{
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
%}
