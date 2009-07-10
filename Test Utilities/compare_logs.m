clear all;
close all;
clc;

t_format= '%d';
daq_s = [t_format,repmat('%f',1,36)];
daq_hs = repmat('%s',1,37);
cmd_s = [t_format,repmat('%f',1,12)];
cmd_hs = repmat('%s',1,13);
daq_file = 'C:\LBCB_Log\DAQ_Log.txt';
cmd_file = 'C:\LBCB_Log\CMD_Log.txt';
fid = fopen(daq_file, 'r');
headers = textscan(fid,daq_hs,1,'Delimiter','\t');
daq_hdr = cell(36);
for i=2:37
    daq_hdr(i-1) = headers{i};
end
raw = textscan(fid, daq_s);
[raw_c,raw_r] = size(raw);
times = raw{1}
sample_set_c = size(times);
daq_dof = zeros(sample_set_c(1),raw_r - 3);
for i=2:raw_r
    sample_set = raw{i};
    sample_set_c = size(sample_set);
    
    for rec=1:sample_set_c(1)
        daq_dof(rec,i-1) = sample_set(rec);
    end
end
dof_c = size(daq_dof)
for g = 1:6
    strt = ((g - 1) * 6) + 1;
    nd = g * 6;
    subplot(6,1,g)
    h = plot(times,daq_dof(:,strt:nd));
legend(h, daq_hdr(strt:nd));
end
