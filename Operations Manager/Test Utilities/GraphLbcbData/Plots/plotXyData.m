function plotXyData(hObject,handles,plot,isX)
idx = get(hObject,'Value');
if idx == 1
    handles.timePlot.clearPlot(plot);
    return
end
if isX
    lbl = handles.xyXAxisMenu{idx};
    data = handles.dataSet.findData(lbl);
    handles.xyPlot.setXData(data,plot);
else
    lbl = handles.xyYAxisMenu{idx};
    data = handles.dataSet.findData(lbl);
    handles.xyPlot.setYData(data,plot);
end
