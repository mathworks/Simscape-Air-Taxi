% Code to set up figure windows so that when full parameterization is run,
% they do not overlap the model.
%
% Copyright 2017-2022 The MathWorks, Inc.

%% Create and minimize figures
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
h4_ssc_airvtol_elec = figure('Name', 'ssc_airvtol_elec');
jFrame = get(h4_ssc_airvtol_elec, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);

h4_ssc_airvtol_elec_hybrid = figure('Name', 'ssc_airvtol_elec_hybrid');
jFrame = get(h4_ssc_airvtol_elec_hybrid, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);

h8_ssc_airvtol_elec = figure('Name', 'ssc_airvtol_elec');
jFrame = get(h8_ssc_airvtol_elec, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);

h8_ssc_airvtol_elec_hybrid = figure('Name', 'ssc_airvtol_elec_hybrid');
jFrame = get(h8_ssc_airvtol_elec_hybrid, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);

h9_ssc_airvtol = figure('Name', 'ssc_airvtol_elec');
jFrame = get(h9_ssc_airvtol, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);

h10_ssc_airvtol = figure('Name', 'ssc_airvtol_elec');
jFrame = get(h10_ssc_airvtol, 'JavaFrame');
pause(0.1);
jFrame.setMinimized(1); 
pause(0.1);


%% Set figure location units pixels
set(h4_ssc_airvtol_elec,'Units','Pixels');
set(h4_ssc_airvtol_elec,'Position',[805.8000  449.8000  560.0000  420.0000]);
%clf(h4_ssc_airvtol_elec);

set(h4_ssc_airvtol_elec_hybrid,'Units','Pixels');
set(h4_ssc_airvtol_elec_hybrid,'Position',[805.8000   40.2000  560.0000  420.0000]);
%clf(h4_ssc_airvtol_elec_hybrid);

set(h8_ssc_airvtol_elec,'Units','Pixels');
set(h8_ssc_airvtol_elec,'Position',[806.6000  449.0000  560.0000  420.0000]);
%clf(h8_ssc_airvtol_elec);

set(h8_ssc_airvtol_elec_hybrid,'Units','Pixels');
set(h8_ssc_airvtol_elec_hybrid,'Position',[806.6000   38.6000  560.0000  420.0000]);
%clf(h8_ssc_airvtol_elec_hybrid);

set(h9_ssc_airvtol,'Units','Pixels');
set(h9_ssc_airvtol,'Position',[805.8000  208.2000  560.0000  420.0000]);
%clf(h9_ssc_airvtol);

set(h10_ssc_airvtol,'Units','Pixels');
set(h10_ssc_airvtol,'Position',[243.4000  208.2000  560.0000  420.0000]);
%clf(h10_ssc_airvtol);

%% Set figure location units pixels normalized
set(h4_ssc_airvtol_elec,'Units','Normalized');
set(h4_ssc_airvtol_elec,'Position',[0.5240    0.4675    0.3646    0.4375]);
%clf(h4_ssc_airvtol_elec);

set(h4_ssc_airvtol_elec_hybrid,'Units','Normalized');
set(h4_ssc_airvtol_elec_hybrid,'Position',[0.5240    0.0408    0.3646    0.4375]);
%clf(h4_ssc_airvtol_elec_hybrid);

set(h8_ssc_airvtol_elec,'Units','Normalized');
set(h8_ssc_airvtol_elec,'Position',[0.5245    0.4667    0.3646    0.4375]);
%clf(h8_ssc_airvtol_elec);

set(h8_ssc_airvtol_elec_hybrid,'Units','Normalized');
set(h8_ssc_airvtol_elec_hybrid,'Position',[0.5245    0.0392    0.3646    0.4375]);
%clf(h8_ssc_airvtol_elec_hybrid);

set(h9_ssc_airvtol,'Units','Normalized');
set(h9_ssc_airvtol,'Position',[0.5240    0.2158    0.3646    0.4375]);
%clf(h9_ssc_airvtol);

set(h10_ssc_airvtol,'Units','Normalized');
set(h10_ssc_airvtol,'Position',[0.1578    0.2158    0.3646    0.4375]);
%clf(h10_ssc_airvtol);