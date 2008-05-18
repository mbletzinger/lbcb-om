clear all;
close all;
clc;

ns = repmat('%f',1,54);
hs = repmat('%s',1,54);
root = '/Users/mbletzin/Work/MATLAB/VoltsLog_2008_May';
files = {'_17_22_47_42.txt'};
last = 0;
for f = 1:1
    name = sprintf('%s%s',root,files{f});
    fid = fopen(name, 'r');
    clear headers;
    headers = textscan(fid,hs,1,'Delimiter','\t');
    raw = textscan(fid, ns);
    fclose(fid);
    [raw_c,raw_r] = size(raw);
    t = raw{1};
    t_c = size(t);
    volts = zeros(t_c(1),raw_r);
    for i=1:raw_r
        t = raw{i};
        t_c = size(t);
    
        for rec=1:t_c(1)
            volts(rec,i) = t(rec);
        end
    end
    t_c = size(volts);
    if f == 1
        allvolts = zeros(t_c(1),t_c(2));
    end
    for i = 1:t_c(1)
        for k = 1:t_c(2)
            allvolts(last + i,k) = volts(i,k);
        end
    end
    last = last + t_c(1)
end

headers(:)
headers{1}
headers{13}
headers{19}
headers{37}

sz = size(allvolts)
allvolts(:,19);
plotdata = zeros(sz(1),4);
for i = 1:sz(1)
    plotdata(i,1) = allvolts(i,1);
    plotdata(i,2) = allvolts(i,13);
    plotdata(i,3) = allvolts(i,19);
    plotdata(i,4) = allvolts(i,37);
end
hdrs = cell(54);
for h = 1:54
    hdrs(h) = headers{h};
end
t_c = size(plotdata)
h = plot(plotdata);
legend(h,[ hdrs(1) hdrs(13) hdrs(19) hdrs(37)]);
% for g = 1:5
%     strt = ((g - 1) * 18) + 1
%     nd = g * 18
%     subplot(2,3,g)
%     h = barh(1:18,stats(strt:nd,:),'group');
%     set(gca,'YTickLabel',hdr(strt:nd));
%     set(gca,'YTick',1:18);
% %    legend(h, 'Orig Mean', 'Orig Std Dev', 'New Mean', 'New Std Dev');
% end
% subplot(2,3,6)
% h = barh(1:6,stats(91:96,:),'group');
% %set(gca,'YTickLabel',hdr(91,96));
% set(gca,'YTick',1:6);
% legend(h, 'Orig Mean', 'New Mean','Orig Std Dev', 'New Std Dev');
