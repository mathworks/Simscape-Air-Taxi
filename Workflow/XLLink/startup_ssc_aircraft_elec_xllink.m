% Copyright 2011-2023 The MathWorks, Inc.

Elec_Aircraft_Model_HomeDir = [pwd filesep '..' filesep '..'];
addpath(Elec_Aircraft_Model_HomeDir);
addpath([Elec_Aircraft_Model_HomeDir filesep 'Scripts_Data']);
addpath([Elec_Aircraft_Model_HomeDir filesep 'Libraries']);
addpath([Elec_Aircraft_Model_HomeDir filesep 'Images']);
addpath([Elec_Aircraft_Model_HomeDir filesep 'Workflow' filesep 'XLLink']);
addpath([Elec_Aircraft_Model_HomeDir filesep 'html' filesep 'html']);

% Load Parameters 
ssc_aircraft_elec_configs
ssc_aircraft_elec_default_params

%open('Elec_Aircraft_Demo_Script.html')




