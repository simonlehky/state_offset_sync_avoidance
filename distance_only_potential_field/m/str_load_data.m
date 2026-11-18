%% LOAD .MAT DATA
% double integrator
if ~goc
    if ~coa
        filename = sprintf('mat/form%d_iii.mat', scenario);
    else
        filename = sprintf('mat/form%d_iii_coa.mat', scenario);
    end
else
    if ~coa
        filename = sprintf('mat/form%d_iii_goc.mat', scenario);
    else
        filename = sprintf('mat/form%d_iii_coa_goc.mat', scenario);
    end
end
if exist(filename, 'file')
    load(filename, '-mat');
    fprintf(sprintf('INFO: File %s loaded.\n', filename));

    iii_veh0 = out.form.signals.values(:,1:4);
    iii_veh1 = out.form.signals.values(:,5:8);
    iii_veh2 = out.form.signals.values(:,9:12);
    iii_veh0_in = out.form_in.signals.values(:,1:2);
    iii_veh1_in = out.form_in.signals.values(:,3:4);
    iii_veh2_in = out.form_in.signals.values(:,5:6);
    iii_offset01_ref = out.offset.signals.values(:,1:2);
    iii_offset12_ref = out.offset.signals.values(:,3:4);
    iii_time = out.tout;
    clear out
else
    fprintf(sprintf('WARN: File %s could not be loaded.\n', filename));
end