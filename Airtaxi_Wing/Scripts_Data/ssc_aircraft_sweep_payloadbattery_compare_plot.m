% Code to plot results of parameter sweep for battery capacity and payload
% for electric aircraft examples
%
% Copyright 2017-2021 The MathWorks, Inc.

% Load default data if necessary
if (~exist('temp_dist_payl_ele_hybr','var'))
    % Load previous results
    disp('Loading previously saved results.');
    load ssc_aircraft_sweep_payloadbattery_compare_defResults
end

% Prepare figure window
if ~exist('h10_ssc_aircraft', 'var') || ...
        ~isgraphics(h10_ssc_aircraft, 'figure')
    h10_ssc_aircraft = figure('Name', 'ssc_aircraft_elec');
end
figure(h10_ssc_aircraft)
clf(h10_ssc_aircraft)

temp_colororder = get(gca,'defaultAxesColorOrder');

%% Plot results in single 3D view
temp_s1_h = surf(battGrid,payGrid,temp_dist_payl_ele_hybr');
temp_s1_h.EdgeColor = temp_colororder(2,:);
hold on
temp_s2_h = surf(battGrid,payGrid,temp_dist_payl_ele_pure');
temp_s2_h.EdgeColor = temp_colororder(1,:);
temp_s3_h = surf(battGrid([1 end]),payGrid([1 end]),min_range*ones(2));
set(temp_s3_h,'FaceColor',[1 1 1]*0.2,'FaceAlpha',0.8)
hold off

xlabel('Battery Capacity (A*hr)');
ylabel('Payload (kg)');
zlabel('Flight Range (km)');

title('Flight Range for Electric Aircraft')

clb_h = colorbar;
clb_h.Label.String = 'Flight Range (km)';
colormap(flipud(cool));
legend({'Hybrid','Pure',['Range = ' num2str(min_range) 'km'] },'Location','Best');

%% Plot results separately in 2D views
if ~exist('h9_ssc_aircraft', 'var') || ...
        ~isgraphics(h9_ssc_aircraft, 'figure')
    h9_ssc_aircraft = figure('Name', 'ssc_aircraft_elec');
end
figure(h9_ssc_aircraft)
clf(h9_ssc_aircraft)

simlog_handles(1) = subplot(1,2,1);
temp_s1_h =surf(battGrid,payGrid,temp_dist_payl_ele_pure');
temp_s1_h.EdgeColor='none';
hold on
temp_s2_h =surf(battGrid([1 end]),payGrid([1 end]),min_range*ones(2));
set(temp_s2_h,'FaceColor',[1 1 1]*0.2,'FaceAlpha',0.8)
hold off
text(0.05,0.9,0.9,sprintf('%s < %d km','Range',min_range),...
    'Units','Normalized',...
    'HorizontalAlignment','left',...
    'Color','w','FontWeight','Bold','FontSize',12)

text(0.05,0.05,0.9,'Pure Electric',...
    'Units','Normalized',...
    'HorizontalAlignment','left',...
    'Color','w','FontSize',12)

view(0,90)
xlabel('Battery Capacity (A*hr)');
ylabel('Payload (kg)');
title('Range Pure Electric')
colormap(flipud(cool));

simlog_handles(2) = subplot(1,2,2);
temp_s1_h =surf(battGrid,payGrid,temp_dist_payl_ele_hybr');
temp_s1_h.EdgeColor='none';
hold on
temp_s2_h =surf(battGrid([1 end]),payGrid([1 end]),min_range*ones(2));
set(temp_s2_h,'FaceColor',[1 1 1]*0.2,'FaceAlpha',0.8)
hold off
text(0.05,0.9,0.9,sprintf('%s < %d km','Range',min_range),...
    'Units','Normalized',...
    'HorizontalAlignment','left',...
    'Color','w','FontWeight','Bold','FontSize',12)

text(0.05,0.05,0.9,'Hybrid Electric',...
    'Units','Normalized',...
    'HorizontalAlignment','left',...
    'Color','w','FontSize',12)

% Top view for overview of design space
view(0,90)

xlabel('Battery Capacity (A*hr)');
title('Range Hybrid Electric')
clb_h = colorbar;
clb_h.Label.String = 'Flight Range (km)';
colormap(flipud(cool));

% Ensure limits are same for both 2D plots
cmap_lims_all = [caxis(simlog_handles(1)) caxis(simlog_handles(2))];
cmap_lims = [min(cmap_lims_all) max(cmap_lims_all)];
caxis(simlog_handles(1),cmap_lims);
caxis(simlog_handles(2),cmap_lims);

% Set axes positions manually
% Necessary due to addition of colorbar 
% Subplots are resized automatically, need to manually set the sizes
simlog_handles(1).Position = [0.1300 0.1100 0.30 0.8150];
simlog_handles(2).Position = [0.5200 0.1100 0.30 0.8150];

clear temp_s1_h temp_s2_h temp_s3_h clb_h
clear simlog_handles cmap_lims_all cmap_lims