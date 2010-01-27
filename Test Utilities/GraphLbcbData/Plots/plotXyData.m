function plotXyData(hObject,handles,plot,isX)
idx = get(hObject,'Value');
if idx == 1
    handles.timePlot.clearPlot(plot);
    return
end
labels = get(hObject,'String');
lbl = labels{idx};
if isX
    data = handles.dataSet.findData(lbl);
    handles.xyPlot.setXData(data,plot);
else
    data = handles.dataSet.findData(lbl);
    handles.xyPlot.setYData(data,plot);
end
