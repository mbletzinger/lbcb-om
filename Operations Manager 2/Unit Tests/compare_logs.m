clear all;
close all;
clc;

s= '%s%s%s';
s = [s,repmat('%f',1,96)];
hs = repmat('%s',1,97);
%orig_file = uigetfile('*.txt', 'Original Program Log','/Users/mbletzin/Work/MATLAB/');
orig_file = 'C:\Documents and Settings\All Users\Desktop\Logs\Original OM Log LV 82 Compiled.txt';
%new_file = uigetfile('*.txt', 'New Program Log','/Users/mbletzin/Work/MATLAB/');
new_file = 'C:\Documents and Settings\All Users\Desktop\Logs\ContLog_2008_May_11_20_24_05.txt';
fid = fopen(new_file, 'r');
headers = textscan(fid,hs,1,'Delimiter','\t');
raw = textscan(fid, s);
[raw_c,raw_r] = size(raw);
t = raw{1};
t_c = size(t);
new_dof = zeros(t_c(1),raw_r - 3);
for i=4:raw_r
    t = raw{i};
    t_c = size(t);
    
    for rec=1:t_c(1)
        new_dof(rec,i-3) = t(rec);
    end
end
hdr = cell(95);
for i=2:96
    hdr(i-1) = headers{i};
end
        
%sz = size(dof)
%ndm = ndims(dof)
fid = fopen(orig_file, 'r');
headers = textscan(fid,hs,1,'Delimiter','\t');
raw = textscan(fid, s);
[raw_c,raw_r] = size(raw);
t = raw{1};
[t_c,t_r] = size(t);
old_dof = zeros(t_c,raw_r-3);
for i=4:raw_r
    t = raw{i};
    [t_c,t_r] = size(t);
    
    for rec=1:t_c
        old_dof(rec,i-3) = t(rec);
    end
end

stats = zeros(96,4);
for i=1:96
    stats(i,1) = mean(old_dof(:,i));
    stats(i,3) = std(old_dof(:,i));
    stats(i,2) = mean(new_dof(:,i));
    stats(i,4) = std(new_dof(:,i));
end
for g = 1:5
    strt = ((g - 1) * 18) + 1
    nd = g * 18
    subplot(2,3,g)
    h = barh(1:18,stats(strt:nd,:),'group');
    set(gca,'YTickLabel',hdr(strt:nd));
    set(gca,'YTick',1:18);
%    legend(h, 'Orig Mean', 'Orig Std Dev', 'New Mean', 'New Std Dev');
end
subplot(2,3,6)
h = barh(1:6,stats(91:96,:),'group');
%set(gca,'YTickLabel',hdr(91,96));
set(gca,'YTick',1:6);
legend(h, 'Orig Mean', 'New Mean','Orig Std Dev', 'New Std Dev');
