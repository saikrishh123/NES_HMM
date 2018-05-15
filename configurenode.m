function configurenode(varargin)
src=varargin{1};

n=varargin{3};
inputnum=n;
Node=evalin('base','Node');
timematrix=evalin('base','CT.timematrix');
datmat=Node(inputnum).default_val*(ones(1,length(timematrix)));



Node_Var=Node(n);
 
        SC = get(0, 'ScreenSize');
        MaxMonitorX = SC(3);
        MaxMonitorY = SC(4);
        
 %   Set the figure window size values
        MainFigScale = 0.9 ;  % Change this value to adjust the figure size
        MaxWindowX = round(MaxMonitorX*MainFigScale);
        MaxWindowY = round(MaxMonitorY*MainFigScale);
        XBorder = (MaxMonitorX-MaxWindowX)/2;
        YBorder = (MaxMonitorY-MaxWindowY)/2; 
        TabOffset = 0;              % This value offsets the tabs inside the figure.
      
        
        
                
 %   Set the color varables.  
        White = [1  1  1];            % White - Selected tab color     
        BGColor = .5*White;
        % Light Grey - Background color
            
%%   Create a figure for the tabs
        hTabFig = figure(...
            'Units', 'pixels',...
            'Toolbar', 'none',...
            'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY ],...
            'NumberTitle', 'off',...
            'Name', 'Random Test Case Generator',...
            'MenuBar', 'none',...
            'Resize', 'off',...
            'DockControls', 'off',...
            'Color', White);



bg = uibuttongroup('Visible','off',...
                  'Position',[0 .6  2 1],...
                  'Parent',hTabFig,...
                  'SelectionChangedFcn',@bselection);
              
              update = uicontrol('Style','pushbutton',...
                  'Position',[400 50 200 30],...
                  'Parent',bg,...
                  'String', 'Update',...
                  'Callback',@updatecallback);
              
% Create three radio buttons in the button group.
r1 = uicontrol(bg,'Style',...
                  'radiobutton',...
                  'String','Bluetooth_Audio_Streaming',...
                  'Position',[10 300 200 30],...
                  'FontSize', 15,...
                  'HandleVisibility','off');
              
r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','Bluetooth_File_Transfer',...
                  'Position',[10 200 200 30],...
                  'FontSize', 15,...
                  'HandleVisibility','off');

              r3 = uicontrol(bg,'Style','radiobutton',...
                  'String','Wifi_Communication',...
                  'Position',[10 100 200 30],...
                  'FontSize', 15,...
                  'HandleVisibility','off');
              
              r4 = uicontrol(bg,'Style','radiobutton',...
                  'String','Custom',...
                  'Position',[10 0 200 30],...
                  'FontSize', 15,...
                  'HandleVisibility','off');
              
              
% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';

% f = uifigure('Visible','on',...
%     'Parent',hTabFig,...
%     'Position', [10 100 200 300] );

ax = axes('Parent',hTabFig,...
    'Position', [0.05 0.05 .9 .5]);

stairs(timematrix,datmat);


%Creating Constant Panel
% cpanel = uipanel('Units', 'pixels', ...
%                 'Visible', 'on', ...
%                 'Backgroundcolor', 0.4*White, ...
%                 'BorderWidth',1, ...
%                 'Position', [230 750 ...
%                 1500 1500]);
            
            e1 = uicontrol(bg,'Style','edit',...
               'Position',[250 300 200 30],...
                'String',num2str(Node_Var.constant_val),...
                  'Backgroundcolor', White, ...
                 'FontSize', 15);
             
       
             
             
 inx1=250;
 iny1=230;
 offx1=150;
 offy1=100;
 offdif=30;
 
for i=1:6

s(i) = uicontrol(bg,'Style','text',...
               'Position',[inx1+offx1*(i-1) iny1 100 30],...
                'String',strcat('state',num2str(i)),...
                  'FontSize', 15);
              
               p(i) = uicontrol(bg,'Style','edit',...
               'Position',[inx1+offx1*(i-1) iny1-30 100 30],...
                'String',' ',...
                  'Backgroundcolor', White, ...
                 'FontSize', 15);
             
             
              
             sv(i) = uicontrol(bg,'Style','text',...
               'Position',[inx1+offx1*(i-1) iny1-100 100 30],...
                'String',strcat('Prob',num2str(i)),...
                  'FontSize', 15);
              
               pv(i) = uicontrol(bg,'Style','edit',...
               'Position',[inx1+offx1*(i-1) iny1-100-30 100 30],...
                'String',' ',...
                  'Backgroundcolor', White, ...
                 'FontSize', 15);
             
end

l=size(Node_Var.probability_state);

for i=1:min(6,l(2))

set(p(i),'String',num2str(Node_Var.probability_state(i)));

              
               
end
l=size(Node_Var.probability_val);

for i=1:min(6,l(2))

set(pv(i),'String',num2str(Node_Var.probability_val(i)));

              
               
end


             
             
              ft = uicontrol(bg,'Style','text',...
               'Position',[250 130 500 30],...
                'String','symbolic function of "t" e.g sin(t)',...
                  'FontSize', 15);
              
               fd = uicontrol(bg,'Style','edit',...
               'Position',[250 100 500 30],...
                'String',' ',...
                  'Backgroundcolor', White, ...
                 'FontSize', 15);
            
          
for i=1:6
    s(i).Visible='off';
    p(i).Visible='off';
    sv(i).Visible='off';
   pv(i).Visible='off';
    ft.Visible='off';
    fd.Visible='off';
end




    function bselection(source,callbackdata)
        
      
      if(strcmp('Probability' ,callbackdata.NewValue.String))
           buttonstate=3;
          for i=1:6
    s(i).Visible='on';
    p(i).Visible='on';
    sv(i).Visible='on';
   pv(i).Visible='on';
    e1.Visible='off';
    ft.Visible='off';
    fd.Visible='off';
          end
      end
      
      
      
      if(strcmp('Function' ,callbackdata.NewValue.String))
           buttonstate=2;
          for i=1:6
              s(i).Visible='off';
              p(i).Visible='off';
              sv(i).Visible='off';
              pv(i).Visible='off';
              ft.Visible='on';
              fd.Visible='on';
              e1.Visible='off';
          end
          
          
      end
      
      
      
           if(strcmp('Constant' ,callbackdata.NewValue.String))
       
               buttonstate=1;
           for i=1:6
    s(i).Visible='off';
    p(i).Visible='off';
    sv(i).Visible='off';
   pv(i).Visible='off';
    ft.Visible='off';
    fd.Visible='off';
    e1.Visible='on';
           end
      end
      
    end
%button selection ends



    function updatecallback(varargin)
        
     bs=get(bg,'SelectedObject');
     str=get(bs,'String');
     
     
         if(strcmp('Probability' ,str))
        j=0;
        for i=1:6
            k=get(p(i),'String');
            k=str2num(k);
            
            if(size(k))
                j=j+1;
                
                snv(j)=k;
            end
        end
        
        
        
          
        j=0;
        for i=1:6
            k=get(pv(i),'String');
            k=str2num(k);
            
            if(size(k))
                j=j+1;
                
                pnv(j)=k;
            end
        end
        
        
              Node(inputnum).probability_state=snv;
              Node(inputnum).probability_val=pnv;
              data=[snv;pnv];
              Node(inputnum).DataMatrix= genraterandommatrixsinglevarSIL(data,length(timematrix)-2, Node(inputnum).default_val);
           
              Node(inputnum).probability_status=1;
              Node(inputnum).func_status=0;
              Node(inputnum).constant_status=0;
              Node(inputnum).Updated=1;
              set(src,'BackgroundColor',[0.9400 0.94 0.500]);
              
              stairs(timematrix,Node(inputnum).DataMatrix);
              
              assignin('base','Node',Node);
              
         end
         
         
         
         
         if(strcmp('Constant' ,str))
        j=0;
 
            k=get(e1,'String');
            k=str2num(k);
            
             Node(inputnum).DataMatrix=[Node(inputnum).default_val  ones(1,length(timematrix)-2)*k Node(inputnum).default_val]
            
              Node(inputnum).probability_status=0;
              Node(inputnum).func_status=0;
              Node(inputnum).constant_status=1;
              Node(inputnum).Updated=1;
              
              stairs(timematrix,Node(inputnum).DataMatrix);
             
              assignin('base','Node',Node);
              set(src,'BackgroundColor',[0.9400 0.94 0.500]);
              
         end
         
          if(strcmp('DefaultValue' ,str))
        j=0;
 
            k=get(e1,'String');
            k=str2num(k);
            
          
            
              Node(inputnum).probability_status=0;
              Node(inputnum).func_status=0;
              Node(inputnum).constant_status=0;
              Node(inputnum).Updated=0;
              
              stairs(timematrix,Node(inputnum).DataMatrix);
             
              assignin('base','Node',Node);
              set(src,'BackgroundColor',[0.9400 0.94 0.9400]);
              
         end
         
         
         
         
              
    
    end





end