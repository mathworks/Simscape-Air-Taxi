% Copyright 2011-2020 The MathWorks, Inc.

Elec_Aircraft_Model_VTOL_HomeDir = [pwd filesep '..'];
addpath(Elec_Aircraft_Model_VTOL_HomeDir);
addpath([Elec_Aircraft_Model_VTOL_HomeDir filesep 'Scripts_Data']);
addpath([Elec_Aircraft_Model_VTOL_HomeDir filesep 'Libraries']);
addpath([Elec_Aircraft_Model_VTOL_HomeDir filesep 'Images']);
addpath([Elec_Aircraft_Model_VTOL_HomeDir filesep 'XLLink']);
addpath([Elec_Aircraft_Model_VTOL_HomeDir filesep 'html' filesep 'html']);

% Load Parameters 
ssc_airvtol_elec_configs
ssc_airvtol_elec_default_params

%open('Elec_Aircraft_Demo_Script.html')




