# radifToolBox
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


This ToolBox is desinged for the Analysis of the radif of Iranian Classical Music
- It provides functions for Alignment of Audio and MIDI for Iranian Music
- Finds the Intervals used in each piece of vocal performance
- Detects vibrato, tahrir, and other vocal techniques
- Does Automatic Segmentation based on sentence-level
- Finds the notes used in each sentence (Range)
- Finds Pitch drift with sentence by sentence detail
- Finds histograms of Audio and MIDI
- Detects the peaks of histograms

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
List of Dependencies:
Matlab Midi Toolbox of Ken Schutte
https://kenschutte.com/midi

Here is the list of Midi functions that are used: matrix2midi.m, getTempoChanges.m, midiInfor.m, readmidi.m, writemidi.m
Some of these functions are modified so that they can accomodate Iranian music scale with neutal tones (intervals). For more infor see IranianMusicImprovisor repository

The following function in MusicImprovisor repository:
midiProcess.m
myNotesProperties.m
printableTable.m
processAllNotes.m

