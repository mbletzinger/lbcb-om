clear all
clear classes

file = uigetfile('*.txt','Select LBCB 1 data file');
    
[timeData data] = loadLbcbData(file,'LBCB1');
    

timePlot = plotSettings();

ts = plot(0,0,'k',0,0,'b',0,0,'r',0,0,'g',0,0,'m',0,0,':k',0,0,':b',0,0,':r');
timePlot.setLineSeries(ts);

dataSet = plotDataSet(data,timeData);
timePlot.setXData(timeData,1);
timePlot.setYData(data{1},1);
timePlot.setXData(timeData,2);
timePlot.setYData(data{2},2);
lgndS = cell(8,1);
lgndS{1} = data{1}.shortLabel;
lgndS{2} = data{2}.shortLabel;
lgndS{3} = '';
lgndS{4} = '';
lgndS{5} = '';
lgndS{6} = '';
lgndS{7} = '';
lgndS{8} = '';
