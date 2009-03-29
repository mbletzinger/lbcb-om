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

% Last Modified by GUIDE v2.5 27-Mar-2009 14:59:41

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
file = uigetfile('*.txt','Select LBCB 1 data file');
data1 = loadLbcbData(file,'LBCB1');
file = uigetfile('*.txt','Select LBCB 2 data file');
data2 = loadLbcbData(file,'LBCB2');
handles.data = cat(1,data1,data2);
handles.timePlot = plotSettings();
init = num2cell(zeros(8,2)); % Initial values of plots

s = plot(handles.timeAxis,init{1,1},init{1,2},'k',init{2,1},init{2,2},'b',...
    init{3,1},init{3,2},'r',init{4,1},init{4,2},'g'...
    ,init{5,1},init{5,2},'m',init{6,1},init{6,1},'k.',...
    init{7,1},init{7,2},'b.',init{8,1},init{8,2},'r.'); % handles to plot
handles.xyPlot.setLineSeries(s);

handles.xylot = plotSettings();
init = num2cell(zeros(5,2)); % Initial values of plots
s = plot(handles.timeAxis,init{1,1},init{1,2},'k',init{2,1},init{2,2},'b',...
    init{3,1},init{3,2},'r',init{4,1},init{4,2},'g'...
    ,init{5,1},init{5,2},'m',init{6,1},init{6,1},'k.',...
    init{7,1},init{7,2},'b.',init{8,1},init{8,2},'r.'); % handles to plot
handles.xyPlot.setLineSeries(s);
handles.labelFilter = dofLabelFilter(handles.data);

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using GraphLbcbData.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

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
axes(handles.timeAxis);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on selection change in timeAxisPopup1.
function timeAxisPopup1_Callback(hObject, eventdata, handles)
% hObject    handle to timeAxisPopup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns timeAxisPopup1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from timeAxisPopup1


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


% --- Executes on selection change in dofPopup.
function dofPopup_Callback(hObject, eventdata, handles)
% hObject    handle to dofPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns dofPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dofPopup


% --- Executes during object creation, after setting all properties.
function dofPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dofPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CheckDx.
function CheckDx_Callback(hObject, eventdata, handles)
% hObject    handle to CheckDx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CheckDx


% --- Executes on button press in DyCheck.
function DyCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DyCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DyCheck


% --- Executes on button press in DzCheck.
function DzCheck_Callback(hObject, eventdata, handles)
% hObject    handle to DzCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DzCheck


% --- Executes on button press in RxCheck.
function RxCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RxCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RxCheck


% --- Executes on button press in RyCheck.
function RyCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RyCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RyCheck


% --- Executes on button press in RzCheck.
function RzCheck_Callback(hObject, eventdata, handles)
% hObject    handle to RzCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RzCheck

function PopupMenuLists(hObject,handles)
    dofs = [];
    if(get(handles.DxCheck,'Value'))
        dofs = [ 1 dofs];
    end
    if(get(handles.DyCheck,'Value'))
        dofs = [ 2 dofs];
    end
    if(get(handles.DyCheck,'Value'))
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

