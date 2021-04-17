% Code to sweep payload mass for electric aircraft examples
% and plot comparison of the results.
%
% Copyright 2017-2021 The MathWorks, Inc.

modelname = 'ssc_aircraft_elec';
ssc_aircraft_sweep_payload

% Get simulation results
temp_dist_payl_ele = zeros(length(simOut),1);
temp_dura_payl_ele = zeros(length(simOut),1);
for temp_py_i=1:length(simOut)
    temp_dist_payl_ele(temp_py_i) = simOut(temp_py_i).Distance(end);
    temp_dura_payl_ele(temp_py_i) = simOut(temp_py_i).tout(end);
end

modelname = 'ssc_aircraft_elec_hybrid';
ssc_aircraft_sweep_payload

% Get simulation results
temp_dist_payl_hyd = zeros(length(simOut),1);
temp_dura_payl_hyd = zeros(length(simOut),1);
for temp_py_i=1:length(simOut)
    temp_dist_payl_hyd(temp_py_i) = simOut(temp_py_i).Distance(end);
    temp_dura_payl_hyd(temp_py_i) = simOut(temp_py_i).tout(end);
end

if ~exist('h7_ssc_aircraft', 'var') || ...
        ~isgraphics(h7_ssc_aircraft, 'figure')
    h7_ssc_aircraft = figure('Name', 'ssc_aircraft payload');
end
figure(h7_ssc_aircraft)
clf(h7_ssc_aircraft)

% Plot results
simlog_handles(1) = subplot(1,2,1);
plot(temp_dist_payl_ele,payload_set,'o-','LineWidth',1);
hold on
plot(temp_dist_payl_hyd,payload_set,'*-','LineWidth',1);
hold off
text(0.95,0.8,['Battery: ' num2str(battery_capacity) ' A*hr'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
title(['Range vs. Payload']);
ylabel('Payload Mass (kg)');
xlabel('Flight Range (km)');
legend({'Electric','Hybrid'},'Location','NorthEast');
grid on

% Plot results
simlog_handles(2) = subplot(1,2,2);
plot(temp_dura_payl_ele/60,payload_set,'o-','LineWidth',1);
hold on
plot(temp_dura_payl_hyd/60,payload_set,'*-','LineWidth',1);
text(0.95,0.8,['Battery: ' num2str(battery_capacity) ' A*hr'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
hold off
title(['Max Flight Time vs. Payload']);
ylabel('Payload Mass (kg)');
xlabel('Max Flight Time (min)');
legend({'Electric','Hybrid'},'Location','NorthEast');
grid on

linkaxes(simlog_handles, 'y');

clear simlog_handles
clear temp_clr_ind temp_colororder temp_payload_spec_method
clear temp_dura_payl_ele  temp_dura_payl_hyd
clear temp_dist_payl_ele  temp_dist_payl_hyd
clear temp_duration temp_distance temp_plotsym temp_py_i 
