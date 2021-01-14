%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [YY,Y_spike,Y_spike1, linesFound,Y_smooth] = SpikeFinder(YY,Y_cent, smoothFactor, w,h)

% Find sudden jumps in frequency
Y_spike=NaN(size(YY,1),1);
Y_spike1=NaN(size(YY,1),1);
Y_smooth = CurveSmoother(YY,smoothFactor,1,size(YY,1));
[maxima,maxlocs] = findpeaks(Y_smooth,1);
SpikeInverse=-Y_smooth;
[minimaInverse,minlocs] = findpeaks(SpikeInverse);
minima=-minimaInverse;
locs=union(maxlocs, minlocs);
locs_Y=YY(locs);
locs_Ysm=Y_smooth(locs);
Y_cent2=Y_smooth;
%{
figure
plot(Y_cent2, '--gs',...
        'LineWidth',1,...
         'MarkerSize',1,...
        'Color', 'k',...
        'LineStyle', 'none');
title('Y cent2 after Smooth');

hold on
plot(locs,locs_Ysm, '--gs',...
        'LineWidth',1,...
        'MarkerSize',10,...
        'Color', 'b',...
        'LineStyle', 'none');

hold on
plot(locs,locs_Y, '--gs',...
        'LineWidth',1,...
        'MarkerSize',10,...
        'Color', 'r',...
        'LineStyle', 'none')
    
    
figure
plot(YY, '--gs',...
        'LineWidth',1,...
        'MarkerSize',1,...
        'Color', 'b',...
        'LineStyle', 'none');
title('Y cent1 before smooth');
%}

linesFound=0;
for qq=1:size(locs)-2
    if ( locs(qq+2) -locs(qq) ) <w
        h1 =  Y_cent2(locs(qq+1  ))-Y_cent2(locs(qq));
        h2 =  Y_cent2(locs(qq+1))-Y_cent2(locs(qq+2));
        if ( h1>0)
            if ( (abs(h1) >h ) && ( abs(h2) > h ) )
                linesFound = linesFound + 1;
                Y_spike ( locs(qq):locs(qq+2) ) = YY ( locs(qq):locs(qq+2) );
                Y_spike1 ( locs(qq):locs(qq+1) ) = YY ( locs(qq):locs(qq+1) );
            end
        end
    end
end
%{
figure
plot(YY,'--gs',...
    'LineWidth',1,...
    'Color', 'k',...
    'MarkerSize',1,...
    'LineStyle', 'none');
title('Y cent1 afterlines out');
%}
end