%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function visualizeDastgaahRange(notesUsed,DastgahShahed,DastgaahGusheName, WidthHist)

global GusheName;
variables

maxRange=68;%48;
colorGray = 5;
[rows,~] = size(notesUsed);
SColorMatrix=colorGray*ones(rows+3,maxRange+1);%49);  %fill the full graph with gray elements

for i=1:size(notesUsed,1)
    for j = 1:size( notesUsed, 2)
        if ( notesUsed(i,j) == 1)
            SColorMatrix(i, j+1) = mod(i,3) +2; % rotate thru 3 colors
        end
    end
     SColorMatrix( i, DastgahShahed(i)+1) = 1; % exceptions for minimally used notes...
end



nameparts=split(GusheName, " ");
numpart = nameparts(1);
dastgaahGushe = nameparts(2);
str1 = regexprep(GusheName,'[,;=_]', ' ');
str2 = regexprep(str1,'[^- 0-9.eE(,)/]','')
str3=split(str2)
pieceNum3= str3(6);  % D8_G63_M1_A1_T1_pitch_5 for example
dastgaahGushe1 = regexprep(dastgaahGushe,'[,;=_]', ' ');
Dastgaah2=strtok(dastgaahGushe1)
Gu=extractAfter(GusheName,Dastgaah2);
Gu1=extractAfter(Gu,"_")

if ( strncmp( GusheName, "D8_", 3)) %homaayun exceptions...
    %3 is gushe number and 45 is note number,  6 & 1 are colors...
    %SColorMatrix( 3, 45) = 7; % exceptions for minimally used notes...
    %SColorMatrix( 3, 49) = 8; % exceptions for minimally used notes...
    %SColorMatrix( 3, 53) = 1; % exceptions for minimally used notes...
end
   
figure   % doing multiple maqams/Gusheh in this loop
ax_segs=axes();
segmntAx2=subplot(1,1,1); %sentence segments subplot
maxRange=68;%48;
set(gca,'YDir','normal')

Sh2=imagesc(SColorMatrix(1:end, 1:maxRange+1), [0 7]);
colormap ( [1,1,1;   .9,.2,.1;   0,1,0;  0,.6,1;  1,.4,0;   .99,.99,.99;   .1,1,.9; 0.9,0.9,0]);
%             1=       2=        3=        4=       5=        6=
%             7=     8=
ax = gca;
ax.TitleFontSizeMultiplier = 1.5;
set(gca,'YDir','normal')
set(segmntAx2, 'XTick', 1:maxRange+1, 'XTickLabel', NoteNamesFigure(1:maxRange+1), ...
    'XTickLabelRotation',45,'fontsize', 7);

title({"MIDI Dastgaah Range", Dastgaah2}, 'interpreter', 'none');
[rows1,cols] = size(SColorMatrix);
[rows,~] = size(notesUsed);
gusheNames=["", "", "", "", ""];
for i = 1:rows+3
    for j = 1:maxRange+1
        if SColorMatrix(i,j) == colorGray
            textHandles(j,i) = text(j,i,"|", 'horizontalAlignment','center');
        end
    end
    if i > rows
        continue
    end
    nameparts=split(DastgaahGusheName ( i), " ");
    numpart = nameparts(1);
    firstBorlastC= regexp(DastgaahGusheName ( i),{'firstB','lastC'}, 'match');
    try
        fORl=string(firstBorlastC(1))
    catch
        fORl=string(firstBorlastC(2))
    end
    DastgaahGusheName ( i)
        
    fORl
    
    dastgaahGushe = nameparts(2);
    str1 = regexprep(DastgaahGusheName ( i),'[,;=_]', ' ');
    str2 = regexprep(str1,'[^- 0-9.eE(,)/]','')
    str3=split(str2)
    pieceNums(i)= str3(6);  % D8_G63_M1_A1_T1_pitch_5 for example
    dastgaahGushe1 = regexprep(dastgaahGushe,'[,;=_]', ' ');
    Dastgaah2=strtok(dastgaahGushe1)
    Gu=extractAfter(DastgaahGusheName ( i),Dastgaah2);
    Gu1=extractAfter(Gu,"_")
    gusheNames(i)= Gu1;
    %fprintf("i=%d, Gu1=%s    gusheNames(i)=%s\n", i, Gu1,  gusheNames(i) );
    %textHandles(j,i) = text(1,i,Gu1, 'horizontalAlignment', 'center');
end

gusheNames(end+1)=">>"; gusheNames(end+1)=">>"; gusheNames(end+1)=">>";

set(segmntAx2, 'YTick', 1:rows, 'YTickLabel', gusheNames, ...
    'fontsize', 7); %'FontWeight', 'bold',  ,  'interpreter', 'none'
%YTickLabel( gusheNames, 'FontSize', 10, 'FontWeight', 'bold');

segHistoName= sprintf("MIDI full Dastgaah_ %s---%s.jpeg", Dastgaah2, fORl);
title({"MIDI Dastgaah Range", Dastgaah2, fORl }, 'interpreter', 'none');
f=get(ax_segs, 'Parent');

cd ../DataMidi
set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
print(f,strcat("printSeg_", segHistoName) ,'-djpeg','-r600','-noui');

