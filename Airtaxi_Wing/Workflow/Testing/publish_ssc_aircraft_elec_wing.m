% Script for testing ssc_aircraft_elec and ssc_aircraft_elec_hybrid
% and publishing results
% Copyright 2012-2021 The MathWorks, Inc.

% List of test models 
% Note that publish scripts do not match model names
mdl_list = {...
    'ssc_aircraft_elec',...
    'ssc_aircraft_elec_hybrid.slx'...
    };

% Close models to avoid shadowing issues
for mdl_list_i = 1:length(mdl_list)
    bdclose(mdl_list{mdl_list_i});
end

% Move to folder with publish scripts
cd(fileparts(which(mdl_list{1})))
cd('Overview')

% Loop over publish scripts
filelist_m=dir('*.m');
filenames_m = {filelist_m.name};
warning('off','Simulink:Engine:MdlFileShadowedByFile');
for filenames_m_i=1:length(filenames_m)
    publish(filenames_m{filenames_m_i},'showCode',false)
end

clear filelist_m filenames_m filenames_m_i
clear mdl_list mdl_list_i
