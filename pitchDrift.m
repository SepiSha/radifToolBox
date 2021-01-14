%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  pitchDrift( y_cent,  GusheName, WidthHist, xlim1, xlim2,seggraph, ix, iy,midiNotesSetCents,midiNotesSet,Y_centHisto) %need name change: driftFinder?
global GusheNameSimple;
global GusheName;
variables;
seggraph;
allpoints=[];
allYz = [];

for z=1:size(seggraph,2)
    cBeg  = iy(seggraph(z).curveBeg);
    cEnd  = iy(seggraph(z).curveEnd);
    t = seggraph(z).zeroEnd;
    if t == -1
        cZero = -1
    else
        cZero = iy(seggraph(z).zeroEnd);
    end
    
    [histSmoothY, histoYStart, histoYEnd,histogramY] = histofinder(y_cent(cBeg:cEnd));
    %{
    figure
    plot (histSmoothY, 'color', 'blue');
    hold on
    plot (histogramY, 'color', 'yellow');
    xlim([histoYStart histoYEnd]);
    strr= sprintf("histo#%d", z);
    title(strr);
    
    figure
    plot(y_cent(cBeg:cEnd), 'color', 'red')
    strr= sprintf("histo#%d   --%d  %d", z, cBeg,cEnd );
    title(strr);
    %}
    
    
    [histoUpperEnv,histoLowerEnv]=envelope(histSmoothY,30,'peak');
    %% here we find the note name of each of the main peaks of histogram
    trimmedHistoEnv = histoUpperEnv;
    trimmedHistoEnv(1:histoYStart)=0;
    trimmedHistoEnv(histoYEnd:end)=0;
    [UpperEnvmaxima,UpperEnvmaxlocs] = findpeaks(histoUpperEnv);
    if ( size(UpperEnvmaxlocs,1) == 0 ) % error
        fprintf("error: no peaks found  z=%d\n", z);
        continue;
    end
    [histoSmoothmaxima,histoSmoothmaxlocs] = findpeaks(histSmoothY,'minpeakProminence', 3,...
        'MinPeakDistance', 18, 'MINPEAKHEIGHT',max(  max(UpperEnvmaxima/18),3  ));%15,5
    
    derivative= -histSmoothY(histoYStart:histoYEnd-15) + histSmoothY(histoYStart+15:histoYEnd);
    
    if size(histoSmoothmaxlocs,1) == 0
        [histoSmoothmaxima,histoSmoothmaxlocs] = findpeaks(histSmoothY, 'minpeakProminence', .5,  ...
            'MinPeakDistance', 18);%15,5
        derivative= -histSmoothY(histoYStart:histoYEnd-15) + histSmoothY(histoYStart+15:histoYEnd);
    end
    if size(histoSmoothmaxlocs,1) == 0
        error("splitplot2: why");
    end
    [audioYShahed,dummy,histoYSmoothmaxlocs] = findNoteRange(histSmoothY, z,derivative, histoSmoothmaxima, ...
        histoSmoothmaxlocs,histoYStart); % derivative should move to findNoteRange
    
    fprintf("avrage ycent=%d\n", mean(y_cent(cBeg:cEnd)) );
    allpoints = [allpoints; histoYSmoothmaxlocs];
    Yz=ones(size(histoYSmoothmaxlocs));
    allYz= [allYz; z*Yz];
    
end
hold off;

name=regexprep(GusheName,"firstB","firstB_dtw");
name=regexprep(name,"lastC","lastC_dtw");

figure;ax_shift=axes()
plot(allpoints, allYz, 'LineStyle', 'none', 'Marker', '*');

xlim([xlim1 xlim2]);
ylim([1 45]);  % more than 25 sentences is really too much anyway

% drifts happen to Audio, so firstB and lastC are the same and both of them
% generate the plot.

if ( size(seggraph,2) <24)
    ysize = 25;
else
    ysize = 40;
end
for nn= 1:size( midiNotesSetCents)
    temp=mod(midiNotesSet(nn), 96)+1;
    if (temp == 0)
        error("this should not happen. Remove later on");
        temp = 96;
    end
    
    namestr= NoteNamesFigure(temp);
    axes(ax_shift);
    histomax= max(Y_centHisto);
    text(ax_shift, midiNotesSetCents(nn),(round(ysize*0.5)),namestr, 'FontSize', 10);
    %axes(ax_histoSmooth);
    %text(midiNotesSetCents(nn)-25,(round(histomax*0.5)),namestr, 'FontSize', 10);
    
    hold on;
    plot(ax_shift, [midiNotesSetCents(nn) midiNotesSetCents(nn)],[1 ;(round(ysize*0.4))],...
        'Marker','.','Color', [.4 .4 .2], 'LineWidth', 0.5, 'LineStyle', '--');
end
f=get(ax_shift, 'Parent');
set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
GusheName1= strrep(GusheNameSimple,  "_lastC_","_"); %abbriviated
GusheName1= strrep(GusheName1,  "_firstB_","_");
GusheName2= strrep(GusheName,  "_lastC_","_");       %full name
GusheName2= strrep(GusheName2,  "_firstB_","_");
%startIndex = regexp(GusheName,"firstB")  % only save the pitchShift for firstB files.
%if isempty(startIndex)
shiftName= sprintf("Pitch drift_%s.jpeg", GusheName2); %fullname
shiftNameTitle= sprintf("Pitch drift %s", GusheName1); %abbriviated
title(shiftNameTitle,'interpreter', 'none' );

print(f,strcat("print_", shiftName) ,'-djpeg','-r600','-noui');

end