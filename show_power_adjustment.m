function show_power_adjustment
    global STL;
    
    STL.print.mvx_now = 1;
    STL.print.mvy_now = 1;
    STL.print.mvz_now = 1;
    
    ao_volts_raw.B = [];
    
    ao_volts_out = printimage_modify_beam(ao_volts_raw);
    x = reshape(ao_volts_out.B, STL.print.metavoxel_resolution{1,1,1});
    
    figure(34);
    subplot(1,2,2);
    %mesh(1:152, 1:512, squeeze(x(:,:,end))');
    imagesc(STL.print.voxelpos_wrt_fov{1,1,1}.x, ...
        STL.print.voxelpos_wrt_fov{1,1,1}.y, ...
        squeeze(x(:,:,end))');
    axis square;
    colorbar;
    colormap(jet);
    title('Power compensation');
    xlabel('X (\mu{}m)');
    ylabel('Y (\mu{}m)');
    %zlabel('Laser power');
end
