function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 19-Nov-2014 15:51:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)
n=3;
shaft_width=5;
blade_length=50;
nose_height=5;
blade_height=3;
angle=10;
tip_length=20;
Propeller_Final
surf2stl('propeller.stl',x,y,z);
% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in create_stl.
function create_stl_Callback(hObject, eventdata, handles)
% hObject    handle to create_stl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
n=handles.edit_text_number_of_blades;
shaft_width=handles.edit_text_shaft_width;
blade_length=handles.edit_text_blade_length;
nose_height=handles.edit_text_nose_height;
blade_height=handles.edit_text_blade_height;
angle=handles.edit_text_angle;
tip_length=handles.edit_text_tip_length;
Propeller_Final
surf2stl('propeller.stl',x,y,z);

% --- Executes on button press in generate.
function generate_Callback(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
n=handles.edit_text_number_of_blades;
shaft_width=handles.edit_text_shaft_width;
blade_length=handles.edit_text_blade_length;
nose_height=handles.edit_text_nose_height;
blade_height=handles.edit_text_blade_height;
angle=handles.edit_text_angle;
tip_length=handles.edit_text_tip_length;
Propeller_Final

function edit_text_number_of_blades_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_number_of_blades (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_number_of_blades as text
%        str2double(get(hObject,'String')) returns contents of edit_text_number_of_blades as a double
n = str2double(get(hObject,'string'));
if isnan(n)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new n
handles.edit_text_number_of_blades = n;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_number_of_blades_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_number_of_blades (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_shaft_width_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_shaft_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_shaft_width as text
%        str2double(get(hObject,'String')) returns contents of edit_text_shaft_width as a double
shaft_width = str2double(get(hObject,'string'));
if isnan(shaft_width)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new shaft width
handles.edit_text_shaft_width= shaft_width;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_shaft_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_shaft_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_blade_length_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_blade_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_blade_length as text
%        str2double(get(hObject,'String')) returns contents of edit_text_blade_length as a double
blade_length = str2double(get(hObject,'string'));
if isnan(blade_length)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new shaft width
handles.edit_text_blade_length= blade_length;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_blade_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_blade_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_nose_height_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_nose_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_nose_height as text
%        str2double(get(hObject,'String')) returns contents of edit_text_nose_height as a double
nose_height = str2double(get(hObject,'string'));
if isnan(nose_height)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new shaft width
handles.edit_text_nose_height= nose_height;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_nose_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_nose_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_blade_height_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_blade_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_blade_height as text
%        str2double(get(hObject,'String')) returns contents of edit_text_blade_height as a double
blade_height = str2double(get(hObject,'string'));
if isnan(blade_height)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new shaft width
handles.edit_text_blade_height= blade_height;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_blade_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_blade_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_angle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_angle as text
%        str2double(get(hObject,'String')) returns contents of edit_text_angle as a double
angle = str2double(get(hObject,'string'));
if isnan(angle)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
if 45>=angle<=0
     errordlg('You must enter a value between 0 and 45','Invalid Input','modal')
  uicontrol(hObject)
  return
end
%Save the new shaft width
handles.edit_text_angle= angle;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_text_tip_length_Callback(hObject, eventdata, handles)
% hObject    handle to edit_text_tip_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_text_tip_length as text
%        str2double(get(hObject,'String')) returns contents of edit_text_tip_length as a double
tip_length = str2double(get(hObject,'string'));
if isnan(tip_length)
  errordlg('You must enter a numeric value','Invalid Input','modal')
  uicontrol(hObject)

end
%Save the new shaft width
handles.edit_text_tip_length=tip_length;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_text_tip_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_text_tip_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
