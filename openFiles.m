%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [data, energydata,MidiData,fs,PitchFileName]=...
    openFiles(currentFileNameStr,FileNumber)
global GusheName;
global GusheNameSimple;

strLen=length(char(currentFileNameStr(FileNumber)));
t=extractBetween(currentFileNameStr(FileNumber),1,strLen-1); % get rid of extra tab at the end of name
% should look for .csv and split it there...
TAB=sprintf("\t");
t=char(strip(t, 'right', char(10)));
t=strip(t, 'right', "'");
t=strip(t, 'right', TAB);
strLen=length(t);


MidiFileName(FileNumber) = convertCharsToStrings(t);
MidiName (FileNumber)     =MidiFileName(FileNumber);
MidiFileName(FileNumber)  = midiProcess(MidiName(FileNumber));

tname = MidiFileName(FileNumber) ;
tname = strrep(tname, "midi_", "");
tname = strrep(tname,"firstB_","");
tname = strrep(tname,"lastC_","");
tname = strrep(tname,"csv","mp3");
tname = sprintf("../mp3s/%s",tname)
% the following lines find the fs for this piece:
%[y,fs] = audioread(tname,[1 2]) ; % only fs, and a couple of bytes of data, dummy read
info = audioinfo(tname);  % Takes less time than reading audio
fs = info.SampleRate;

MidiName=MidiName (FileNumber);
startIndex = regexp(t,"firstB");

if isempty(startIndex)
    AudioName= strrep(MidiName,  "lastC","pitch");
else
    AudioName= strrep(MidiName,  "firstB","pitch");
end

AudioName=strrep(AudioName,  "midi","csv");
PitchFileName=AudioName;
energyFileName(FileNumber)=strrep(PitchFileName, "pitch", "energy");
energyFileName=strrep(PitchFileName, "pitch", "energy");

GusheName = extractBefore(MidiFileName(FileNumber), ".csv");
GusheName = extractAfter(GusheName, "midi_");
t = extractAfter( GusheName, "firstB");

if ( ismissing(t) )
    t = extractAfter( GusheName, "lastC");
end

GusheNameSimple=extractBefore( GusheName, t);

% Future: we have done it for Karimi, using long silences
SegFileName=strcat("seg_",PitchFileName);

cd ../DataAudioPitch
data       = load(char(PitchFileName));
energydata = load(char(energyFileName));
cd ../DataMidi

MidiData=[]; % get rid of left over from last Gushe.
MidiData=load(MidiFileName(FileNumber));
