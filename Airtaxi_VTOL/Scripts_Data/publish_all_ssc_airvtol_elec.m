% Script to republish all HTML

cd([Elec_Aircraft_VTOL_Model_HomeDir filesep 'Scripts_Data']);

filename_info.name = 'Elec_Aircraft_VTOL_Demo_Script.m';
publish(filename_info.name)
HTMLfilename = strrep(filename_info.name,'.m','.html');
movefile(['.' filesep 'html' filesep HTMLfilename],['.' filesep HTMLfilename]);
rmdir('html');

cd([Elec_Aircraft_VTOL_Model_HomeDir filesep 'html']);

function publish_all_html
filelist_m=dir('*.m');

filenames_m = {filelist_m.name};

warning('off','Simulink:Engine:MdlFileShadowedByFile');

for i=1:length(filenames_m)
    if ~(strcmp(filenames_m{i},'publish_all_html.m'))
    publish(filenames_m{i},'showCode',false)
    end
end
end