function ConfigureNodesCallBack
        
%   Get user screen size
        SC = get(0, 'ScreenSize');
        MaxMonitorX = SC(3);
        MaxMonitorY = SC(4);
        
 %   Set the figure window size values
        MainFigScale = 0.9    % Change this value to adjust the figure size
        MaxWindowX = round(MaxMonitorX*MainFigScale);
        MaxWindowY = round(MaxMonitorY*MainFigScale);
        XBorder = (MaxMonitorX-MaxWindowX)/2;
        YBorder = (MaxMonitorY-MaxWindowY)/2; 
        TabOffset = 0;              % This value offsets the tabs inside the figure.
        ButtonHeight = 40;
        PanelWidth = MaxWindowX-2*TabOffset+4;
        PanelHeight = MaxWindowY-ButtonHeight-2*TabOffset;
         ButtonWidth = round((PanelWidth));
       
                
 %   Set the color varables.  
        White = [1  1  1];            % White - Selected tab color     
        BGColor = .5*White;           % Light Grey - Background color
            
%%   Create a figure for the tabs
        hTabFig = figure(...
            'Units', 'pixels',...
            'Toolbar', 'none',...
            'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY ],...
            'NumberTitle', 'off',...
            'Name', 'Node Configuration Window',...
            'MenuBar', 'none',...
            'Resize', 'off',...
            'DockControls', 'off',...
            'Color', White);
        
xPos = 0.01:0.1:2;
yPos = (0.91:-0.1:0)';
[X,Y] = meshgrid(xPos,yPos);

width = 0.1;
height = 0.08;
 Node=evalin('base','Node');


l=size(Node);
p=0;
for i=1:l(2)
    if(Node(i).Active)
        p=p+1;
        nvar(p)=i;
    end
    
end


for n =1:l(2)
   u(n)= uicontrol('Units','normalized',...
              'Parent', hTabFig, ...
              'Position',[X(n),Y(n),width,height],...
              'Callback',{@NodeConfiguration,n},...
              'String',num2str(n));
          if(Node(n).Active==1)
              
             set(u(n),'BackgroundColor',[0.9400 0.94 0.500]); 
          end

          
         
end

        
        
        
        
        
        
        
        
        
        
        
        
        
        


