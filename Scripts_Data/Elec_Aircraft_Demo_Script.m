%% Electric Aircraft Configuration Evaluation
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:10pt">
% <br>
% <tr> These example models enable you to use simulation to evaluate
% electric and hybrid electric architectures against design criteria such
% as flight range and maximum flight time.  The models are parameterized so
% that you can modify many aspects of the design, including automatic
% parameter sweeps of battery size and payload.<br>
% <br>
% <tr>
% <tr><b><u>Electrical Aircraft Models</u></b><br>
% <tr>1.  Electric Aircraft: <a href="matlab:open_system('ssc_aircraft_elec');">Model</a>, <a href="matlab:web('ssc_aircraft_elec.html');">Documentation</a><br>
% <tr>2.  Hybrid Electric Aircraft: <a href="matlab:open_system('ssc_aircraft_elec_hybrid');">Model</a>, <a href="matlab:web('ssc_aircraft_elec_hybrid.html');">Documentation</a><br>
% <br>
% <tr><b><u>Parameter Sweeps</u></b><br>
% <tr>3.  Battery Capacity: <a href="matlab:modelname='ssc_aircraft_elec';ssc_aircraft_sweep_battery;">Electric</a>, <a href="matlab:modelname='ssc_aircraft_elec_hybrid';ssc_aircraft_sweep_battery;">Hybrid</a>, <a href="matlab:ssc_aircraft_sweep_battery_compare;">Compare</a><br>
% <tr>4.  Payload Mass: <a href="matlab:modelname='ssc_aircraft_elec';ssc_aircraft_sweep_payload;">Electric</a>, <a href="matlab:modelname='ssc_aircraft_elec_hybrid';ssc_aircraft_sweep_payload;">Hybrid</a>, <a href="matlab:ssc_aircraft_sweep_payload_compare;">Compare</a><br>
% <tr>5.  Payload and Battery: <a href="matlab:modelname='ssc_aircraft_elec';ssc_aircraft_sweep_payloadbattery;">Electric</a>, <a href="matlab:modelname='ssc_aircraft_elec_hybrid';ssc_aircraft_sweep_payloadbattery;">Hybrid</a>, <a href="matlab:ssc_aircraft_sweep_payloadbattery_compare;">Compare</a> (<a href="matlab:ssc_aircraft_sweep_payloadbattery_compare_setWindows;">set figures first</a>), <a href="matlab:load ssc_aircraft_sweep_payloadbattery_compare_defResults; ssc_aircraft_sweep_payloadbattery_compare_plot;">Plot saved results</a><br>
% <br>
% <tr>   <img src="Elec_Aircraft_Demo_Script_Overview_Image.png" alt="Electric Aircraft Image"><br>
% <br>
% <tr>   <img src="ssc_aircraft_elec_14.png" alt="Electric Aircraft Parameter Sweep Results"><br>
% <br>
% </style>
% </style>
% </html>
% 
% Copyright 2017-2023 The MathWorks(TM), Inc.


