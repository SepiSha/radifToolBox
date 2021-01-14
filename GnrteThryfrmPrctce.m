%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function saves the extracted theories from practice in a MATLAB data
% file
function GnrteThryfrmPrctce(MidiData,midiShahed, audioShahed,midiHisto)
global GusheName;
EndSegments=[];
MidiSegs=[];
indexSeg=1;
Beg=1;
Segrange=zeros(15,10);
segnumber=1;
for i=1:size(MidiData,1)
    if ((MidiData(i,2)>120 && MidiData(i,1)==0) || (i==size(MidiData,1)))
        EndSegIndex=i;
        seg=MidiData(Beg:i,1:2);
        segtet=sort(unique(MidiData(Beg:i,1)));
        segtet=segtet(segtet~=0);
        Segrange(1:size(segtet,1),segnumber)=segtet;
        Beg=i+1;
        segnumber=segnumber+1;
    end
    indexSeg=indexSeg+1;
end
cd ..
cd DataTheoreticalTable
PracticeFileName=strcat(strcat('practiceData', GusheName),'.mat');
if (exist(PracticeFileName,"file"))
    delete (PracticeFileName)
end
m = matfile(PracticeFileName,'Writable',true);
m.midiShahed = midiShahed;
m.audioShahed=audioShahed;
m.Segrange=Segrange;
m.Histo=midiHisto;
end
