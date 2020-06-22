if(strcmp(xllink_modelname,'Electric'))
    modelname = 'ssc_airvtol_elec';
else
    modelname = 'ssc_airvtol_elec_hybrid';
end
load_system(modelname)
if(strcmp(xllink_airframe,'Custom'))
    set_param([modelname '/Aircraft'],'popup_aircraft_type','Custom');
elseif(strcmp(xllink_airframe,'Single Seat'))
    set_param([modelname '/Aircraft'],'popup_aircraft_type','Single Seat Ehang 184');
else
    set_param([modelname '/Aircraft'],'popup_aircraft_type','Double Seat Workhorse Surefly');
end
battery_capacity_set = linspace(xllink_battery_capacity_min,xllink_battery_capacity_max,6);
payload_set = linspace(xllink_payload_min,xllink_payload_max,13);
min_range = xllink_min_range;

ssc_airvtol_elec_sweep_payloadbattery_xllink

temp_dist_payl_ele_xllink = flipud(temp_dist_payl_ele);

% Copyright 2017-2020 The MathWorks, Inc.
