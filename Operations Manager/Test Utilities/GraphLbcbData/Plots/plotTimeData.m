function plotTimeData(hObject,handles,plot)
idx = get(hObject,'Value');
if idx == 1
    handles.timePlot.clearPlot(plot);
    handles.timePlot.setXData(handles.dataSet.timeData,plot);
    return
end
lbl = handles.timeAxisMenu{idx};
data = handles.dataSet.findData(lbl);
handles.timePlot.setYData(data,plot);
