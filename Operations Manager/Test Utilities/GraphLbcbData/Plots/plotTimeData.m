function plotTimeData(hObject,handles,plot)
idx = get(hObject,'Value');
lgnds = handles.timePlotLegends;
if idx == 1
    timePlot.clearPlot(plot);
    lgnds{plot} = '';
else
    lbl = handles.timeAxisMenu{idx};
    data = handles.dataSet.findData(lbl);
    handles.timePlot.setXData(handles.dataSet.timeData,plot);
    handles.timePlot.setYData(data,plot);
    lgnds{plot} = data.shortLabel;
end
[legend_h,object_h,plot_h,text_strings] =legend(lgnds);
handles.timePlotLegends = text_strings;
