function varargout = NodeConfiguration(varargin)
% NODECONFIGURATION MATLAB code for NodeConfiguration.fig
%      NODECONFIGURATION, by itself, creates a new NODECONFIGURATION or raises the existing
%      singleton*.
%
%      H = NODECONFIGURATION returns the handle to a new NODECONFIGURATION or the handle to
%      the existing singleton*.
%
%      NODECONFIGURATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NODECONFIGURATION.M with the given input arguments.
%
%      NODECONFIGURATION('Property','Value',...) creates a new NODECONFIGURATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NodeConfiguration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NodeConfiguration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NodeConfiguration

% Last Modified by GUIDE v2.5 22-Oct-2016 15:14:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NodeConfiguration_OpeningFcn, ...
                   'gui_OutputFcn',  @NodeConfiguration_OutputFcn, ...
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


% --- Executes just before NodeConfiguration is made visible.
function NodeConfiguration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NodeConfiguration (see VARARGIN)

% Choose default command line output for NodeConfiguration
handles.output = hObject;
set(hObject,'Name',strcat('NodeConfig',num2str(varargin{end})));
handles.n=varargin{end};
handles.srcb=varargin{1};
% Update handles structure
guidata(hObject, handles);
Node=evalin('base','Node');
n=handles.n;
v=Node(n).RelativeVelocity;
x=Node(n).IntialPosition;
nlevel=Node(n).No_Of_Levels;
windowsize=Node(n).WindowSize;

set(handles.nvx,'String',num2str(v(1)));
set(handles.nvy,'String',num2str(v(2)));
set(handles.nvz,'String',num2str(v(3)));
set(handles.nlevel,'String',num2str(nlevel));
set(handles.ws,'String',num2str(windowsize));

set(handles.npx,'String',num2str(x(1)));
set(handles.npy,'String',num2str(x(2)));
set(handles.npz,'String',num2str(x(3)));
set(handles.alpha,'String',num2str(Node(n).pathlosscoefficient));
set(handles.tstart,'String',num2str(10));
set(handles.tend,'String',num2str(10.1));
set(handles.nodepower,'String',num2str(Node(n).NoisePower));
%set(handles.figure1, 'Color', [1 1 0]);
handles.active.Value=Node(n).Active;
if(Node(n).Active)
   if(Node(n).NoiseCategory==1)
set(varargin{1},'BackGroundColor',[0 1 1]);
   end
if(Node(n).NoiseCategory==2)
set(varargin{1},'BackGroundColor',[1 0 1]);
end
if(Node(n).NoiseCategory==3)
set(varargin{1},'BackGroundColor',[1 1 0]);
end
    
    
    
end
if(Node(n).NoiseCategory==1)
handles.bat.Value=1;
end
if(Node(n).NoiseCategory==2)
handles.bft.Value=1;
end
if(Node(n).NoiseCategory==3)
handles.wifi.Value=1;
end












% UIWAIT makes NodeConfiguration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NodeConfiguration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch1.
function ch1_Callback(hObject, eventdata, handles)
% hObject    handle to ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch1



% --- Executes on button press in ch2.
function ch2_Callback(hObject, eventdata, handles)
% hObject    handle to ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2


% --- Executes on button press in ch3.
function ch3_Callback(hObject, eventdata, handles)
% hObject    handle to ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch3



% --- Executes on button press in ch4.
function ch4_Callback(hObject, eventdata, handles)
% hObject    handle to ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch4


% --- Executes on button press in ch5.
function ch5_Callback(hObject, eventdata, handles)
% hObject    handle to ch5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch5



% --- Executes on button press in ch6.
function ch6_Callback(hObject, eventdata, handles)
% hObject    handle to ch6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch6


% --- Executes on button press in ch7.
function ch7_Callback(hObject, eventdata, handles)
% hObject    handle to ch7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ch8.
function ch8_Callback(hObject, eventdata, handles)
% hObject    handle to ch8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch8



% --- Executes on button press in ch9.
function ch9_Callback(hObject, eventdata, handles)
% hObject    handle to ch9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch9




% --- Executes on button press in ch10.
function ch10_Callback(hObject, eventdata, handles)
% hObject    handle to ch10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch10





% --- Executes on button press in ch11.
function ch11_Callback(hObject, eventdata, handles)
% hObject    handle to ch11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch11


% --- Executes on button press in ch12.
function ch12_Callback(hObject, eventdata, handles)
% hObject    handle to ch12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch12



% --- Executes on button press in ch13.
function ch13_Callback(hObject, eventdata, handles)
% hObject    handle to ch13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch13



% --- Executes on button press in ch14.
function ch14_Callback(hObject, eventdata, handles)
% hObject    handle to ch14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch14



% --- Executes on button press in ch15.
function ch15_Callback(hObject, eventdata, handles)
% hObject    handle to ch15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% Hint: get(hObject,'Value') returns toggle state of ch15


% --- Executes on button press in ch16.
function ch16_Callback(hObject, eventdata, handles)
% hObject    handle to ch16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch16



% --- Executes on button press in plotchannel.
function plotchannel_Callback(hObject, eventdata, handles)
% hObject    handle to plotchannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in plotmovingaverage.
function plotmovingaverage_Callback(hObject, eventdata, handles)
% hObject    handle to plotmovingaverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in plotcontour.
function plotcontour_Callback(hObject, eventdata, handles)
% hObject    handle to plotcontour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in analyze.
function analyze_Callback(hObject, eventdata, handles)
% hObject    handle to analyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function npx_Callback(hObject, eventdata, handles)
% hObject    handle to npx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of npx as text
%        str2double(get(hObject,'String')) returns contents of npx as a double


% --- Executes during object creation, after setting all properties.
function npx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to npx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nvx_Callback(hObject, eventdata, handles)
% hObject    handle to nvx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nvx as text
%        str2double(get(hObject,'String')) returns contents of nvx as a double


% --- Executes during object creation, after setting all properties.
function nvx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nvx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function npy_Callback(hObject, eventdata, handles)
% hObject    handle to npy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of npy as text
%        str2double(get(hObject,'String')) returns contents of npy as a double


% --- Executes during object creation, after setting all properties.
function npy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to npy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nvy_Callback(hObject, eventdata, handles)
% hObject    handle to nvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nvy as text
%        str2double(get(hObject,'String')) returns contents of nvy as a double


% --- Executes during object creation, after setting all properties.
function nvy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nvy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function npz_Callback(hObject, eventdata, handles)
% hObject    handle to npz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of npz as text
%        str2double(get(hObject,'String')) returns contents of npz as a double


% --- Executes during object creation, after setting all properties.
function npz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to npz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nvz_Callback(hObject, eventdata, handles)
% hObject    handle to nvz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nvz as text
%        str2double(get(hObject,'String')) returns contents of nvz as a double


% --- Executes during object creation, after setting all properties.
function nvz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nvz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in updateparameters.
function updateparameters_Callback(hObject, eventdata, handles)
% hObject    handle to updateparameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Node=evalin('base','Node');
n=handles.n;
Node(n).RelativeVelocity(1)=str2num(get(handles.nvx,'String'));
Node(n).RelativeVelocity(2)=str2num(get(handles.nvy,'String'));
Node(n).RelativeVelocity(3)=str2num(get(handles.nvz,'String'));
Node(n).IntialPosition(1)=str2num(get(handles.npx,'String'));
Node(n).IntialPosition(2)=str2num(get(handles.npy,'String'));
Node(n).IntialPosition(3)=str2num(get(handles.npz,'String'));
Node(n).pathlosscoefficient=str2num(get(handles.alpha,'String'));
Node(n).Active=handles.active.Value;
Node(n).No_Of_Levels=str2num(get(handles.nlevel,'String'));
Node(n).WindowSize=str2num(get(handles.ws,'String'));
Node(n).NoisePower=str2num(get(handles.nodepower,'String'));
if(handles.bat.Value==1)
    
    Node(n).NoiseCategory=1;
end

if(handles.bft.Value==1)
    
    Node(n).NoiseCategory=2;
end
if(handles.wifi.Value==1)
    
    Node(n).NoiseCategory=3;
end

assignin('base','Node',Node);




% --- Executes on button press in generatenoise.
function generatenoise_Callback(hObject, eventdata, handles)
% hObject    handle to generatenoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Node=evalin('base','Node');
n=handles.n;
Node(n)=Node(n).generateNoise;
assignin('base','Node',Node);

% --- Executes on button press in generaterelativenoise.
function generaterelativenoise_Callback(hObject, eventdata, handles)
% hObject    handle to generaterelativenoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Node=evalin('base','Node');
n=handles.n;
Node(n)=Node(n).generateRelativeNoise;
assignin('base','Node',Node);



% --- Executes on button press in plotnoise.
function plotnoise_Callback(hObject, eventdata, handles)
% hObject    handle to plotnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=0;
Node=evalin('base','Node');
n=handles.n;
tstart=str2num(get(handles.tstart,'String'));
tend=str2num(get(handles.tend,'String'));
for i=1:16
l=strcat('handles.ch',num2str(i),'.Value');
m(i)=eval(l);
if(m(i))
    k(p+1)=i+10;
    p=p+1;
end

end

if(handles.radiobutton5.Value)
    Node(n).plotchannel(k,tstart,tend,1);
end


if(handles.radiobutton6.Value)
    Node(n).plotchannelmovavg(k,tstart,tend,1);
end


if(handles.radiobutton7.Value)
    Node(n).plotContour;
end

if(handles.radiobutton8.Value)
    Node(n).dataanalyze(1);
end









% --- Executes on button press in plotrelativenoise.
function plotrelativenoise_Callback(hObject, eventdata, handles)
% hObject    handle to plotrelativenoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=0;
Node=evalin('base','Node');
n=handles.n;
tstart=str2num(get(handles.tstart,'String'));
tend=str2num(get(handles.tend,'String'));
for i=1:16
l=strcat('handles.ch',num2str(i),'.Value');
m(i)=eval(l);
if(m(i))
    k(p+1)=i+10;
    p=p+1;
end
end
if(handles.radiobutton5.Value)
    Node(n).plotchannel(k,tstart,tend,2);
end


if(handles.radiobutton6.Value)
    Node(n).plotchannelmovavg(k,tstart,tend,2);
end


if(handles.radiobutton7.Value)
    Node(n).plotContour(2);
end

if(handles.radiobutton8.Value)
    Node(n).dataanalyze(2);
end



function tstart_Callback(hObject, eventdata, handles)
% hObject    handle to tstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tstart as text
%        str2double(get(hObject,'String')) returns contents of tstart as a double


% --- Executes during object creation, after setting all properties.
function tstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tend_Callback(hObject, eventdata, handles)
% hObject    handle to tend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tend as text
%        str2double(get(hObject,'String')) returns contents of tend as a double


% --- Executes during object creation, after setting all properties.
function tend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in active.
function active_Callback(hObject, eventdata, handles)
% hObject    handle to active (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of active
n=handles.n;
Node=evalin('base','Node');
Node(n).Active=handles.active.Value;
if(handles.bat.Value==1)
    
    Node(n).NoiseCategory=1;
end

if(handles.bft.Value==1)
    
    Node(n).NoiseCategory=2;
end
if(handles.wifi.Value==1)
    
    Node(n).NoiseCategory=3;
end

if(Node(n).Active)

if(Node(n).NoiseCategory==1)
set(handles.srcb,'BackGroundColor',[0 1 1]);
end
if(Node(n).NoiseCategory==2)
set(handles.srcb,'BackGroundColor',[1 0 1]);
end
if(Node(n).NoiseCategory==3)
set(handles.srcb,'BackGroundColor',[1 1 0]);
end
else
    set(handles.srcb,'BackGroundColor',[0.94 0.94 0.94]);
    
end
    




assignin('base','Node',Node);



function ws_Callback(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ws as text
%        str2double(get(hObject,'String')) returns contents of ws as a double


% --- Executes during object creation, after setting all properties.
function ws_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nlevel_Callback(hObject, eventdata, handles)
% hObject    handle to nlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nlevel as text
%        str2double(get(hObject,'String')) returns contents of nlevel as a double


% --- Executes during object creation, after setting all properties.
function nlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodepower_Callback(hObject, eventdata, handles)
% hObject    handle to nodepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodepower as text
%        str2double(get(hObject,'String')) returns contents of nodepower as a double


% --- Executes during object creation, after setting all properties.
function nodepower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
