function plotTimeData(hObject,handles,plot)
idx = get(hObject,'Value');
if idx == 1
    timePlot.clearPlot(plot);
else
    lbl = handles.timeAxisMenu{idx};
    data = handles.dataSet.findData(lbl);
    handles.timePlot.setXData(handles.dataSet.timeData,plot);
    handles.timePlot.setYData(data,plot);
end
