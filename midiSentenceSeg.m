%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% find (midi per sentence) segments and draw them

function  notesUsed =  midiSentenceSeg(seggraph , ix, iy, MidiPointsCent, MidiComparisonArray, WidthHist)
global GusheName;
global GusheNameSimple;
variables;
dtwpoints=1;

for s=1: size(seggraph,2)
    
    cBeg  = ix(seggraph(s).curveBeg);
    cEnd  = ix(seggraph(s).curveEnd);
    t = seggraph(s).zeroEnd;
    if t == -1
        cZero = -1;
    else
        cZero = ix(seggraph(s).zeroEnd);
    end
    segTable(s,1:72)= 0;
    [seghistogramSmooth, seghistoStart, seghistoEnd,seghistogram] = histofinder(MidiPointsCent( cBeg: cEnd));
    
    
    % map the MIDI frequencies back to musical notations
    %look for the proper cent:
    for tr=100: size (seghistogram,1)
        if seghistogram( tr) ~=0
            tr2=1;
            while ( tr2 < size(MidiPointsCent,2) )
                if tr ==  MidiPointsCent(tr2)
                    break
                else
                    tr2 = tr2 + 1;
                end
            end
            midiNote = MidiComparisonArray(tr2);
            midiDrawOffset = midiNote-72-24;
            if ( midiDrawOffset < 1)
                midiDrawOffset = midiDrawOffset + 24
            end
            segTable(s, midiDrawOffset) = 1;  %or should be -72 (-24?)
            notesUsed( midiDrawOffset ) = 1; % aggregate value of all sentences....
        end
    end
end

colorGray=5;
figure   % doing multiple maqams/Gusheh in this loop
ax_segs=axes();
segmntAx2=subplot(1,1,1); %sentence segments subplot
maxRange=68;%48;
SColorMatrix=colorGray*ones(30,maxRange+1);%49);  %fill the full graph with gray elements
offset=0;

for i=1:size(segTable,1)
    for j = 1:72
        if ( segTable(i,j) == 1)
            SColorMatrix(i, j+1) = mod(i,3) +2; % rotate thru 3 colors
        end
    end
end

set(gca,'YDir','normal')

Sh=imagesc(SColorMatrix(1:end, offset+1:maxRange+offset+1), [0 7]);
colormap ( [1,1,1;   .9,.2,.1;   0,1,0;  0,.6,1;  1,.4,0;   .99,.99,.99;   .1,1,.9; 0.9,0.9,0]);
ax = gca;
ax.TitleFontSizeMultiplier = 1.5;
set(gca,'YDir','normal')
set(segmntAx2, 'XTick', 1:maxRange+offset+1, 'XTickLabel', NoteNamesFigure(offset+1:maxRange+offset+1), ...
    'XTickLabelRotation',45,'fontsize', 7);

title({"MIDI sentence segments", GusheNameSimple}, 'interpreter', 'none');
[rows,cols] = size(SColorMatrix);
for i = 1:rows
    for j = offset+1:maxRange+offset+1
        if SColorMatrix(i,j) == colorGray
            textHandles(j,i) = text(j-offset,i,"|", 'horizontalAlignment','center');
        end
    end
end

segHistoName= sprintf("segments_%s.jpeg", GusheName);
f=get(ax_segs, 'Parent');
cd ../DataMidi
set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
print(f,strcat("printSeg_", segHistoName) ,'-djpeg','-r600','-noui');
