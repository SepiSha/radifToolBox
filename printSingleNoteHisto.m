%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  printSingleNoteHisto(Y_centExtrapolated, MidiPointsCent, midiNotesSetCentsFull,ix, iy , WidthHist, xlim1, xlim2 )

global X;
global GusheName;
global GusheNameSimple;
% print each note's histogram separately. Needs to be a function.
len=20;
noteHisto = [];
noteHistoTrim = [];
Y_centExtrapolatedTrim = Y_centExtrapolated;
for i=len+1:size(Y_centExtrapolatedTrim,1)-len-1 %\50
    if ( Y_centExtrapolated(i) == 0)
        for k=1:len
            Y_centExtrapolatedTrim( i+k) = 0;
            Y_centExtrapolatedTrim( i-k) = 0;
        end
    end
end

for i = 1+len: size(ix)-len-1
    if ( MidiPointsCent (ix(i)) ~=  MidiPointsCent (ix(i+1)) )
        for k=1:len
            Y_centExtrapolatedTrim( iy(i+k)) = 0;
            Y_centExtrapolatedTrim( iy(i-k)) = 0;
        end
    end
end

noteHisto = zeros(size(midiNotesSetCentsFull,1),5000);
%new pernote histograms:
for k = 1: size(ix)
    
    for i=1 : size(midiNotesSetCentsFull)
        if ( MidiPointsCent( ix(k)) == midiNotesSetCentsFull(i) )
            if ( round(Y_centExtrapolated(iy(k))) ~= 0 )
                noteHisto( i, round(Y_centExtrapolated(iy(k))) ) = noteHisto( i, round(Y_centExtrapolated(iy(k))) ) + 1;
            end
        end
        
    end
end
noteHisto( noteHisto == 0 ) = NaN;
figure
ax_noteHisto=axes();
f=get(ax_noteHisto, 'Parent');
MaxYY = max(noteHisto, [], 'all');
yUnit=MaxYY/15;

for i=1 : size(midiNotesSetCentsFull)
    tNoteHisto = noteHisto(i,:);
    tNoteHisto ( isnan(tNoteHisto) ) = 0;
    area= sum(  tNoteHisto );
    halfArea = area/2;
    for k = 1:size(noteHisto(i,:),2 )
        halfArea = halfArea - tNoteHisto(k);
        if halfArea < 0
            break;
        end
    end
    fprintf("median point of single note = %d\n", k);
    fprintf("area = %d:", area );
    [MaxY,MaxX]= max( noteHisto(i,:) );
    
    if area > 250  || MaxY > 40
        
        %plot( [Mx Mx], [0 My], 'Marker','.','MarkerSize',0.5,'Color', [.8 .0 .0], 'LineWidth', 3.0, 'LineStyle', '-');
        val= sprintf("%d", MaxX);
        text(MaxX ,      MaxY+yUnit*i+5      ,val,              'FontSize', 10);
        text(k    ,round(MaxY+yUnit*(i+2))+5 ,sprintf("%d", k), 'FontSize', 10, 'color', 'red');
        fprintf("---i=%d     mx=%d, k=%d      height = %d -- %d\n", i, MaxX, k, MaxY+yUnit*i+5,  round(MaxY+yUnit*(i+1))+5    );
    else
        fprintf("\n");
    end
    
    hold on
    plot( noteHisto(i,:)+yUnit*i )
    hold on
end
ylim
yyy=  ylim;
ylim ( yyy*1.1)
ylim2=yyy(1,2)
text(round(xlim1*1.004) ,round(ylim2*0.96),"red:   middle point", 'FontSize', 10, 'color', 'red');
text(round(xlim1*1.004) ,round(ylim2*0.90),"black: peak",         'FontSize', 10, 'color', 'black');

hold off
htitle=sprintf("Note histogram: %s", GusheNameSimple);
title(htitle,  'interpreter', 'none');

noteHistoName= sprintf("histo_%s.jpeg", GusheName);
xlim([xlim1 xlim2]);
%set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
set(f,'position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
print(f,strcat("printNHRaw_", noteHistoName) ,'-djpeg','-r600','-noui');



noteHistoTrim = zeros(size(midiNotesSetCentsFull,1),5000);
%new pernote histograms:
for k = 1: size(ix)
    
    for i=1 : size(midiNotesSetCentsFull)
        if ( MidiPointsCent( ix(k)) == midiNotesSetCentsFull(i) )
            if ( round(Y_centExtrapolatedTrim(iy(k))) ~= 0 )
                noteHistoTrim( i, round(Y_centExtrapolatedTrim(iy(k))) ) = noteHistoTrim( i, round(Y_centExtrapolatedTrim(iy(k))) ) + 1;
            end
        end
        
    end
end
noteHistoTrim( noteHistoTrim == 0 ) = NaN;

figure
ax_noteHisto=axes();
f=get(ax_noteHisto, 'Parent');
for i=1 : size(midiNotesSetCentsFull)
    area= sum(  noteHisto(i,:) );
    fprintf("area = %d:", area );
    [MaxY,MaxX]= max( noteHistoTrim(i,:) );
    if area > 250  || MaxY > 40
        
        %plot( [Mx Mx], [0 My], 'Marker','.','MarkerSize',0.5,'Color', [.8 .0 .0], 'LineWidth', 3.0, 'LineStyle', '-');
        val= sprintf("%d", MaxX);
        text(MaxX ,MaxY+5*i+5,val, 'FontSize', 10);
        fprintf("---mx=%d\n", MaxX);
    else
        fprintf("\n");
    end
    hold on
    plot( noteHistoTrim(i,:)+5*i )
    hold on
end
hold off
htitle=sprintf("note histogram trimmed: %s", GusheName);
title(htitle,  'interpreter', 'none');
noteHistoName= sprintf("histo_%s.jpeg", GusheName);
xlim([xlim1 xlim2]);
%set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
set(f,'position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
print(f,strcat("printNHtrim_", noteHistoName) ,'-djpeg','-r600','-noui');


end

