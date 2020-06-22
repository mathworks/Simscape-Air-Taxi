% Copyright 2017-2020 The MathWorks, Inc.

Elec_Aircraft_VTOL_Model_HomeDir = pwd;
%{
addpath(pwd);
addpath([pwd filesep 'Scripts_Data']);
addpath([pwd filesep 'Libraries']);
addpath([pwd filesep 'Images']);
if(exist([pwd filesep 'XLLink'],'dir'))
    addpath([pwd filesep 'XLLink']);
end
addpath([pwd filesep 'html' filesep 'html']);
%}

% Load Parameters
ssc_airvtol_elec_configs
ssc_airvtol_elec_default_params

open('Elec_Aircraft_VTOL_Demo_Script.html')