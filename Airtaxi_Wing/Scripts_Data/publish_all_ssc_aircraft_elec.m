cd([Elec_Aircraft_Model_HomeDir filesep 'Scripts_Data']);

% Republish demo script, keep HTML in same folder.
filename = 'Elec_Aircraft_Demo_Script.m';
filename_info = dir([filename]);
publish(filename_info.name)
HTMLfilename = strrep(filename_info.name,'.m','.html');
movefile(['.' filesep 'html' filesep HTMLfilename],['.' filesep HTMLfilename]);
rmdir('html');

cd([Elec_Aircraft_Model_HomeDir filesep 'html']);

% Publish all publish scripts
filelist_m=dir('*.m');

filenames_m = {filelist_m.name};

warning('off','Simulink:Engine:MdlFileShadowedByFile');

for i=1:length(filenames_m)
    if ~(strcmp(filenames_m{i},'publish_all_html.m'))
    publish(filenames_m{i},'showCode',false)
    end
end

% Copyright 2017-2021 The MathWorks, Inc.
