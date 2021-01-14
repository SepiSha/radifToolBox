%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [MidiData,MidiComparisonArray,midiShahed, histogram, scaleFactor] = midiFormatAudioScale(MidiData,Y_centSize)

index=1;  % change this name to : totoal_MIDI_points;
Beginning=1;
%  insert the silences as notes (pitch=0) inside the note table
j=1;
while (j<=size(MidiData,1))
    if (MidiData(j,3)~=0) % MidiData(j,3) is silences
        silenceValue=MidiData(j,3);
        MidiData(j,3)=0;
        if silenceValue > 0   % ignore negative silences... We had some from Finale Six-tuples!
            MidiData=[MidiData(1:j-1,:);[0,silenceValue,0,0,0,0,silenceValue+0.0];MidiData(j:end,:)];
        end
    end
    j=j+1;
end

for i=1:size(MidiData,1)
    MidiData(i,4)=Beginning;
    %MidiNote=MidiData(i,1);
    MidiTime=MidiData(i,2);
    Beginning=Beginning+MidiTime;
    if (i>1)
        MidiData(i-1,5)=MidiData(i,4)-1;
    end
    % Or Instead of loop:    index = index+ MidiTime
    while MidiTime>0
        MidiTime=MidiTime-1;
        index=index+1;
    end
end


if ( MidiData(end, 5) == 0)  % fix Nov 18, 2019
    MidiData(end, 5) = MidiData(end,4) + MidiData(end,2)-1;
else
    error( "midiFormatAudioScale:  zero expected");
end
scaleFactor=Y_centSize/index;

if (MidiData(:,2) == 0 )
    error("Strange");
end

%MidiData(:,2)=round(MidiData(:,7)*scaleFactor);  % so that   ceil( .3) != 0  & col7 has more accurate numbers
MidiDataCopyC=ceil (MidiData(:,7)*scaleFactor);  %
MidiDataCopyR=round(MidiData(:,7)*scaleFactor);  %
MidiDataCopyR ( MidiDataCopyR ==0 ) = MidiDataCopyC( MidiDataCopyR ==0 );
MidiData(:,2)=MidiDataCopyR;

% so that   ceil( .3) != 0  & col7 has more accurate numbers
if (MidiData(:,2) == 0 )
    error("MidiData zero after scaling");
end
MidiData(:,4)=round(MidiData(:,4)*scaleFactor);
%MidiData(:,5)=round(MidiData(:,5)*scaleFactor);
MidiData(:,5)=MidiData(:,4)+MidiData(:,2)-1; % Instead of the previous line

% during scaling, sometimes, the end of one note becomes exactly the same as
% begining of the next note. They should differ at least by
% one

% the next 5 lines might be unnecessary-Sep-Feb 21,2020
for i=1:size(MidiData,1)-1
    if (MidiData(i,2)==0)
        error("Duration Zero in scaling")
        if MidiData(i+1,4) == MidiData(i,5)
            MidiData(i+1,4) = MidiData(i+1,4) + 1;
        end
    end
    MidiData(i,2) = MidiData(i,5)-MidiData(i,4) +1;
end

if (int32(MidiData(:,2)) == 0 )
    error("MidiData zero after corrections");
end

for i=1:size(MidiData,1)
    if MidiData(i,2) < 0
        error("EROR MidiData: negative rest! corrections: i=%d\n", i)
        MidiData(i,2) = 1;
        MidiData(i,5)= MidiData(i,4)+1;
        MidiData(i+1, 4) = MidiData(i,5)+1;
    end
end

index=1;
Beginning = 1;
for i=1:size(MidiData,1)
    MidiData(i,4)=Beginning;
    MidiNote=MidiData(i,1);
    MidiTime=MidiData(i,2);
    Beginning=Beginning+MidiTime;
    if (i>1)
        MidiData(i-1,5)=MidiData(i,4)-1;
    end
    
    T_MidiTime=int32(MidiTime);
    while T_MidiTime>0
        MidiComparisonArray(index)=MidiNote; % midicomparisonArray->MidiParallelAudio
        T_MidiTime=T_MidiTime-1;
        index=index+1;
    end
end

% Cases when we don't have a clear shahed?
MidiComparisonArray = MidiComparisonArray';
[histogramSmooth, histoStart, histoEnd,histogram] = histofinder(MidiComparisonArray);
MaximumMidi=max(histogram);
midiShahedtmp=find(histogram==MaximumMidi);
midiShahed = midiShahedtmp(1,1); % in case two notes had the same number of hits, take the first one.
if size(midiShahed,1) ~=1 || size( midiShahed,2)~= 1
    error("midiFormatAudioScale: two shaheds!");
end
end