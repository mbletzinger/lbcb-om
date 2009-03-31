function PopupMenuLists(hObject,handles)
dofs = [];
if(get(handles.DxCheck,'Value'))
    dofs = [ 1 dofs];
end
if(get(handles.DyCheck,'Value'))
    dofs = [ 2 dofs];
end
if(get(handles.DzCheck,'Value'))
    dofs = [ 3 dofs];
end
if(get(handles.RxCheck,'Value'))
    dofs = [ 4 dofs];
end
if(get(handles.RyCheck,'Value'))
    dofs = [ 5 dofs];
end
if(get(handles.RzCheck,'Value'))
    dofs = [ 6 dofs];
end

timeAxisMenu = handles.dataSet.getLabels(dofs,0);
timeAxisMenu = cat(1,'None',timeAxisMenu, handles.dataSet.getForceLabels(dofs));
handles.timeAxisMenu = timeAxisMenu;
set(handles.timeAxisPopup1,'String',timeAxisMenu);
set(handles.timeAxisPopup2,'String',timeAxisMenu);
set(handles.timeAxisPopup3,'String',timeAxisMenu);
set(handles.timeAxisPopup4,'String',timeAxisMenu);
set(handles.timeAxisPopup5,'String',timeAxisMenu);
set(handles.timeAxisPopup6,'String',timeAxisMenu);
set(handles.timeAxisPopup7,'String',timeAxisMenu);
set(handles.timeAxisPopup8,'String',timeAxisMenu);
xyXAxisMenu = cat(1, 'None',handles.dataSet.getLabels(dofs,1));
handles.xyXAxisMenu = xyXAxisMenu;
set(handles.xyAxisPopupX,'String',xyXAxisMenu);
xyYAxisMenu = cat(1,'None',handles.dataSet.getForceLabels(dofs));
handles.xyYAxisMenu = xyYAxisMenu;
set(handles.xyAxisPopupY1,'String',xyYAxisMenu);
set(handles.xyAxisPopupY2,'String',xyYAxisMenu);
set(handles.xyAxisPopupY3,'String',xyYAxisMenu);
set(handles.xyAxisPopupY4,'String',xyYAxisMenu);
set(handles.xyAxisPopupY5,'String',xyYAxisMenu);
set(handles.xyAxisPopupY6,'String',xyYAxisMenu);
guidata(hObject, handles);

