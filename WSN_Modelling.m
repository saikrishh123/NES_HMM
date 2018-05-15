function varargout = WSN_Modelling(varargin)
% WSN_MODELLING MATLAB code for WSN_Modelling.fig
%      WSN_MODELLING, by itself, creates a new WSN_MODELLING or raises the existing
%      singleton*.
%
%      H = WSN_MODELLING returns the handle to a new WSN_MODELLING or the handle to
%      the existing singleton*.
%
%      WSN_MODELLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WSN_MODELLING.M with the given input arguments.
%
%      WSN_MODELLING('Property','Value',...) creates a new WSN_MODELLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WSN_Modelling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WSN_Modelling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WSN_Modelling

% Last Modified by GUIDE v2.5 30-Sep-2016 23:44:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WSN_Modelling_OpeningFcn, ...
                   'gui_OutputFcn',  @WSN_Modelling_OutputFcn, ...
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


% --- Executes just before WSN_Modelling is made visible.
function WSN_Modelling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WSN_Modelling (see VARARGIN)

% Choose default command line output for WSN_Modelling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WSN_Modelling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WSN_Modelling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in initialize.
function initialize_Callback(hObject, eventdata, handles)
% hObject    handle to initialize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initializeinputs;

% --- Executes on button press in configurenodes.
function configurenodes_Callback(hObject, eventdata, handles)
% hObject    handle to configurenodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ConfigureNodesCallBack;


% --- Executes on button press in simnetwork.
function simnetwork_Callback(hObject, eventdata, handles)
% hObject    handle to simnetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 NetworkSimulator;