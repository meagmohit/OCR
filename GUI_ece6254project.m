function varargout = GUI_ece6254project(varargin)
% GUI_ECE6254PROJECT MATLAB code for GUI_ece6254project.fig
%      GUI_ECE6254PROJECT, by itself, creates a new GUI_ECE6254PROJECT or raises the existing
%      singleton*.
%
%      H = GUI_ECE6254PROJECT returns the handle to a new GUI_ECE6254PROJECT or the handle to
%      the existing singleton*.
%
%      GUI_ECE6254PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ECE6254PROJECT.M with the given input arguments.
%
%      GUI_ECE6254PROJECT('Property','Value',...) creates a new GUI_ECE6254PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ece6254project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ece6254project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ece6254project

% Last Modified by GUIDE v2.5 21-Apr-2015 10:20:21

% Begin initialization code - DO NOT EDIT

global Latex_string;
global y;
global x;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ece6254project_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ece6254project_OutputFcn, ...
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


% --- Executes just before GUI_ece6254project is made visible.
function GUI_ece6254project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ece6254project (see VARARGIN)

% Choose default command line output for GUI_ece6254project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ece6254project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ece6254project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load_picture.
function Load_picture_Callback(hObject, eventdata, handles)
% hObject    handle to Load_picture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;
global Latex_string;
%global image_add;
[fname,pname] = uigetfile('.png','Select the file','D:\gatech spring 2015 course\6254');
if fname == 0
return
end
iamge_add=[pname,fname];
axes(handles.Image_show);
imshow(iamge_add);
Latex_string=main(pname,fname);
%pname
Segmentation_add= [(pname),'Out.png'];
axes(handles.Segmentation_show);
imshow(Segmentation_add);
str1='auto gene script';
str2='auto gene result';
%Latex_string = main(pname,fname);
%str3='auto gene script and rsult';
if(sum(size(x)>0)&&(sum(size(y)>0)))
if ((x>5) && (y<=5))
    set(handles.Calculation,'string',str1)
end
if (y>5 && x<=5)
    set(handles.Latex_code,'string',str2);
end
if (y>5 && x>5)
    set(handles.Latex_code,'string',str1);
    set(handles.Calculation,'string',str2);
end
end

% --- Executes on button press in Latex_script.
function Latex_script_Callback(hObject, eventdata, handles)
% hObject    handle to Latex_script (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global Latex_string;
if isempty(y)
    y=0;
end
y=y+1;
str1=Latex_string;
set(handles.Latex_code,'string',str1);

% --- Executes on button press in Calculation_result.
function Calculation_result_Callback(hObject, eventdata, handles)
% hObject    handle to Calculation_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global Latex_string;
if isempty (x)
    x=0;
end
x=x+1;
Cal = Calculation(Latex_string);
str=sprintf(strcat('Calculation result: ', num2str(Cal)));
set(handles.Calculation,'string',str);


function Latex_code_Callback(hObject, eventdata, handles)
% hObject    handle to Latex_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Latex_code as text
%        str2double(get(hObject,'String')) returns contents of Latex_code as a double


% --- Executes during object creation, after setting all properties.
function Latex_code_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Latex_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Calculation_Callback(hObject, eventdata, handles)
% hObject    handle to Calculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Calculation as text
%        str2double(get(hObject,'String')) returns contents of Calculation as a double


% --- Executes during object creation, after setting all properties.
function Calculation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Calculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Refresh_memory.
function Refresh_memory_Callback(hObject, eventdata, handles)
% hObject    handle to Refresh_memory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x=0;
global y;
y=0;


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
