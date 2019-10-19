% Copyright 2011-2017 The MathWorks, Inc.

Elec_Aircraft_Model_HomeDir = pwd;
addpath(pwd);
addpath([pwd filesep 'Scripts_Data']);
addpath([pwd filesep 'Libraries']);
addpath([pwd filesep 'Images']);
addpath([pwd filesep 'html' filesep 'html']);

% Load Parameters 
ssc_aircraft_elec_configs
ssc_aircraft_elec_default_params

open('Elec_Aircraft_Demo_Script.html')




