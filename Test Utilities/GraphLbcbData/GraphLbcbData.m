function varargout = GraphLbcbData(varargin)
% GRAPHLBCBDATA M-file for GraphLbcbData.fig
%      GRAPHLBCBDATA, by itself, creates a new GRAPHLBCBDATA or raises the existing
%      singleton*.
%
%      H = GRAPHLBCBDATA returns the handle to a new GRAPHLBCBDATA or the handle to
%      the existing singleton*.
%
%      GRAPHLBCBDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHLBCBDATA.M with the given input arguments.
%
%      GRAPHLBCBDATA('Property','Value',...) creates a new GRAPHLBCBDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GraphLbcbData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GraphLbcbData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GraphLbcbData

% Last Modified by GUIDE v2.5 01-Apr-2009 11:52:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GraphLbcbData_OpeningFcn, ...
                   'gui_OutputFcn',  @GraphLbcbData_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before GraphLbcbData is made visible.
function GraphLbcbData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GraphLbcbData (see VARARGIN)

% Choose default command line output for GraphLbcbData
handles.output = hObject;
data1 = {}; data2 = {};
file = uigetfile('*.txt','Select LBCB 1 data file');
if(file ~= 0)
    [timeData data1] = loadLbcbData(file,'LBCB1');
end

file = uigetfile('*.txt','Select LBCB 2 data file');
if(file ~= 0)
    [timeData data2] = loadLbcbData(file,'LBCB2');
end

handles.data = cat(1,data1,data2);
handles.timePlot = plotSettings();

ts = plot(handles.timeAxis,0,0,'k',0,0,'b',0,0,'r',0,0,'g',0,0,'m',0,0,':k',0,0,':b',0,0,':r');
handles.timePlot.setLineSeries(ts);

handles.xyPlot = plotSettings();
xys = plot(handles.xyAxis,0,0,'k',0,0,'b',0,0,'r',0,0,'g',0,0,'m',0,0,':k',0,0,':b',0,0,':r');
handles.xyPlot.setLineSeries(xys);
handles.dataSet = plotDataSet(handles.data,timeData);

handles.timePlot.setXData(handles.dataSet.timeData,1);

checkHandles = [handles.DxCheck,handles.DyCheck,handles.DzCheck,...
    handles.RxCheck,handles.RyCheck,handles.RzCheck];

handles.timeMenus = dofMenus(handles.dataSet,0,0,1);
handles.timeMenus.setCheckHandles(checkHandles);

timeHandles = [handles.timeAxisPopup1,handles.timeAxisPopup2,handles.timeAxisPopup3,...
    handles.timeAxisPopup4,handles.timeAxisPopup5,handles.timeAxisPopup6,...
    handles.timeAxisPopup7,handles.timeAxisPopup8];

handles.timeMenus.setPopupHandles(timeHandles);

handles.xyXMenus = dofMenus(handles.dataSet,1,0,0);
handles.xyXMenus.setCheckHandles(checkHandles);
handles.xyXMenus.setPopupHandles(handles.xyAxisPopupX);

handles.xyYMenus = dofMenus(handles.dataSet,0,1,0);
handles.xyYMenus.setCheckHandles(checkHandles);

xyHandles = [handles.xyAxisPopupY1,handles.xyAxisPopupY2,handles.xyAxisPopupY3,...
    handles.xyAxisPopupY4,handles.xyAxisPopupY5,handles.xyAxisPopupY6];

handles.xyYMenus.setPopupHandles(xyHandles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GraphLbcbData wait for user response (see UIRESUME)
% uiwait(handles.LbcbData);


% --- Outputs from this function are returned to the command line.
function varargout = GraphLbcbData_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in timeAxisButton.
function timeAxisButton_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.timePlot.plotPopup();

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.LbcbData)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.LbcbData,'Name') '?'],...
                     ['Close ' get(handles.LbcbData,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.LbcbData)

% --- Executes on selection change in timeAxisPopup1.
function timeAxisPopup1_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup1
plotTimeData(hObject,handles,1);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup2.
function timeAxisPopup2_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup2
plotTimeData(hObject,handles,2);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup3.
function timeAxisPopup3_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup3
plotTimeData(hObject,handles,3);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup4.
function timeAxisPopup4_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup4
plotTimeData(hObject,handles,4);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup5.
function timeAxisPopup5_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup5
plotTimeData(hObject,handles,5);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup6.
function timeAxisPopup6_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup6
plotTimeData(hObject,handles,6);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup7.
function timeAxisPopup7_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup7
plotTimeData(hObject,handles,7);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupX.
function xyAxisPopupX_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupX
plotXyData(hObject,handles,1,1);

% --- Executes during object creation, after setting all properties.
function xyAxisPopupX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY1.
function xyAxisPopupY1_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY1
plotXyData(hObject,handles,1,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY2.
function xyAxisPopupY2_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY2
plotXyData(hObject,handles,2,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY3.
function xyAxisPopupY3_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY3
plotXyData(hObject,handles,3,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY4.
function xyAxisPopupY4_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY4
plotXyData(hObject,handles,4,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY5.
function xyAxisPopupY5_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY5
plotXyData(hObject,handles,5,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xyAxisPopupY6.
function xyAxisPopupY6_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns xyAxisPopupY6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xyAxisPopupY6
plotXyData(hObject,handles,6,0);


% --- Executes during object creation, after setting all properties.
function xyAxisPopupY6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xyAxisPopupY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in timeAxisPopup8.
function timeAxisPopup8_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup8
plotTimeData(hObject,handles,8);


% --- Executes during object creation, after setting all properties.
function timeAxisPopup8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in xyAxisButton.
function xyAxisButton_Callback(hObject, eventdata, handles)
% hObject    handle to xyAxisButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.xyPlot.plotPopup();

% --- Executes on button press in DxCheck.
function DxCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DxCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DxCheck
handles.timeMenus.setMenus(1);
handles.xyXMenus.setMenus(1);
handles.xyYMenus.setMenus(1);

% --- Executes on button press in DyCheck.
function DyCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DyCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DyCheck
handles.timeMenus.setMenus(2);
handles.xyXMenus.setMenus(2);
handles.xyYMenus.setMenus(2);

% --- Executes on button press in DzCheck.
function DzCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DzCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DzCheck
handles.timeMenus.setMenus(3);
handles.xyXMenus.setMenus(3);
handles.xyYMenus.setMenus(3);

% --- Executes on button press in RxCheck.
function RxCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RxCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RxCheck
handles.timeMenus.setMenus(4);
handles.xyXMenus.setMenus(4);
handles.xyYMenus.setMenus(4);

% --- Executes on button press in RyCheck.
function RyCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RyCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RyCheck
handles.timeMenus.setMenus(5);
handles.xyXMenus.setMenus(5);
handles.xyYMenus.setMenus(5);

% --- Executes on button press in RzCheck.
function RzCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RzCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RzCheck
handles.timeMenus.setMenus(6);
handles.xyXMenus.setMenus(6);
handles.xyYMenus.setMenus(6);


% --- Executes on button press in timePlotClearButton.
function timePlotClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to timePlotClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.timePlot.clearAll();
handles.timeMenus.clearMenus();

% --- Executes on button press in xyPlotClearButton.
function xyPlotClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to xyPlotClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.xyPlot.clearAll();
resetPopups(handles,1);
handles.xyXMenus.clearMenus();
handles.xyYMenus.clearMenus();


