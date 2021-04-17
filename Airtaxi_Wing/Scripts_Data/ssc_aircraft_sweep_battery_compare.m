% Code to sweep battery capacity for electric aircraft examples
% and plot comparison of the results.
%
% Copyright 2017-2021 The MathWorks, Inc.

modelname = 'ssc_aircraft_elec';
ssc_aircraft_sweep_battery

% Get simulation results
temp_dist_batt_ele = zeros(length(simOut),1);
temp_dura_batt_ele = zeros(length(simOut),1);
for temp_bc_i=1:length(simOut)
    temp_dist_batt_ele(temp_bc_i) = simOut(temp_bc_i).Distance(end);
    temp_dura_batt_ele(temp_bc_i) = simOut(temp_bc_i).tout(end);
end

modelname = 'ssc_aircraft_elec_hybrid';
ssc_aircraft_sweep_battery

% Get simulation results
temp_dist_batt_hyd = zeros(length(simOut),1);
temp_dura_batt_hyd = zeros(length(simOut),1);
for temp_bc_i=1:length(simOut)
    temp_dist_batt_hyd(temp_bc_i) = simOut(temp_bc_i).Distance(end);
    temp_dura_batt_hyd(temp_bc_i) = simOut(temp_bc_i).tout(end);
end

if ~exist('h5_ssc_aircraft', 'var') || ...
        ~isgraphics(h5_ssc_aircraft, 'figure')
    h5_ssc_aircraft = figure('Name', 'ssc_aircraft battery');
end
figure(h5_ssc_aircraft)
clf(h5_ssc_aircraft)

% Plot results
simlog_handles(1) = subplot(1,2,1);
plot(temp_dist_batt_ele,battery_capacity_set,'o-','LineWidth',1);
hold on
plot(temp_dist_batt_hyd,battery_capacity_set,'*-','LineWidth',1);
hold off
text(0.95,0.05,['Payload: ' num2str(payload_mass) ' kg'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
title('Range vs. Battery Capacity');
ylabel('Battery Capacity (A*hr)');
xlabel('Flight Range (km)');
legend({'Electric','Hybrid'},'Location','NorthWest');
grid on

% Plot results
simlog_handles(2) = subplot(1,2,2);
plot(temp_dura_batt_ele/60,battery_capacity_set,'o-','LineWidth',1);
hold on
plot(temp_dura_batt_hyd/60,battery_capacity_set,'*-','LineWidth',1);
hold off
text(0.95,0.05,['Payload: ' num2str(payload_mass) ' kg'],'Units','Normalized','HorizontalAlignment','right','Color',[0.4 0.4 0.4]);
title('Duration vs. Battery Capacity');
ylabel('Battery Capacity (A*hr)');
xlabel('Max Flight Time (min)');
legend({'Electric','Hybrid'},'Location','NorthWest');
grid on

linkaxes(simlog_handles, 'y');

clear simlog_handles
clear temp_dist_batt_hyd  temp_dura_batt_hyd  
clear temp_dist_batt_ele  temp_dura_batt_ele 
clear temp_bc_i
