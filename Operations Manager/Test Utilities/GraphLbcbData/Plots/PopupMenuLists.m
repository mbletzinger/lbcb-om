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
setMenu(handles.timeAxisPopup1,timeAxisMenu);
setMenu(handles.timeAxisPopup2,timeAxisMenu);
setMenu(handles.timeAxisPopup3,timeAxisMenu);
setMenu(handles.timeAxisPopup4,timeAxisMenu);
setMenu(handles.timeAxisPopup5,timeAxisMenu);
setMenu(handles.timeAxisPopup6,timeAxisMenu);
setMenu(handles.timeAxisPopup7,timeAxisMenu);
setMenu(handles.timeAxisPopup8,timeAxisMenu);
xyXAxisMenu = cat(1, 'None',handles.dataSet.getLabels(dofs,1));
handles.xyXAxisMenu = xyXAxisMenu;
setMenu(handles.xyAxisPopupX,xyXAxisMenu);
xyYAxisMenu = cat(1,'None',handles.dataSet.getForceLabels(dofs));
handles.xyYAxisMenu = xyYAxisMenu;
setMenu(handles.xyAxisPopupY1,xyYAxisMenu);
setMenu(handles.xyAxisPopupY2,xyYAxisMenu);
setMenu(handles.xyAxisPopupY3,xyYAxisMenu);
setMenu(handles.xyAxisPopupY4,xyYAxisMenu);
setMenu(handles.xyAxisPopupY5,xyYAxisMenu);
setMenu(handles.xyAxisPopupY6,xyYAxisMenu);
guidata(hObject, handles);
end
function setMenu(handle,newMenu)
    idx = get(handle,'Value');
    if idx ~= 1
        oldMenu = get(handle,'String');
        newMenu(idx) = oldMenu(idx);
    end
    set(handle,'String',newMenu);
end
