%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function modifyDtwPlot(ix,histoSmoothmaxlocs,audioShahed,midiShahed,NoteNamesFigure,...
    MidiComparisonArray,midiHistoFreq,resid,NoteNamesFigure2,centsMidi)

global ax1
global ax2

fprintf("modifyDtwPlot: MIDIShahed = %d\n", midiShahed);
for mm=1:size(histoSmoothmaxlocs)
    axes(ax1);
    plot([0 size(ix,1)],[histoSmoothmaxlocs(mm);histoSmoothmaxlocs(mm)], 'Marker','.','Color', 'red');
    fromShahed = histoSmoothmaxlocs(mm) - audioShahed;
    quarterTones =int32(fromShahed/50);
    tableoffset = mod ((quarterTones + midiShahed), 24)+1;
    namestr= NoteNamesFigure(tableoffset);
    axes(ax2);
    %text(0,histoSmoothmaxlocs(mm),namestr,'Color','red','FontSize',12);
    hold on
end

% not used at this time
allMidiNotes = unique(MidiComparisonArray);
allMidiNotes = allMidiNotes ( allMidiNotes ~=0);
%centsMidi = (((allMidiNotes-midiShahed)*50)+audioShahed) ;


ndx=1;
for iiii= 1: size(midiHistoFreq,1)
    if ( midiHistoFreq(iiii) ~=0 )
        midiIndx(ndx) = iiii;
        ndx = ndx + 1;
    end
end
%centsMidi = centsMidi( centsMidi >1000);
%beginings = beginings -170;
%beginings = [10];%just one set of names
%ybeginings = beginings;
for nn= 1:size( centsMidi)
    yNoteLocation = centsMidi(nn);
    %centsMidi = (allMidiNotes(nn)-midiShahed)*50+audioShahed
    temp=mod(midiIndx(nn), 96)+1;
    if (temp == 0)
        temp = 96;
    end
    namestr= NoteNamesFigure(temp  );
    axes(ax1);
    if (ismember(char(namestr), NoteNamesFigure2))
        fprintf("Thesis: main note MIDI labels: %s\n", char(namestr));
        plot([0 size(ix,1)],[centsMidi(nn);centsMidi(nn)], 'Marker','.','Color', [0 0 1]);
    else
        plot([0 size(ix,1)],[centsMidi(nn);centsMidi(nn)], 'Marker','.','Color', [.2 1 1]);
    end
    plot([0 size(ix,1)],[(audioShahed);(audioShahed)], 'Marker','.','Color', [.4 .4 .2], 'LineWidth', 0.5, 'LineStyle', '--');
    
    axes(ax2);
    %beginings = beginings -beginings +.5;
    text(0.5,yNoteLocation,namestr,'Color','B','FontSize',10);
    %text([100 1500 3500],[centsMidi(nn);centsMidi(nn);centsMidi(nn)],namestr,'Color','B','FontSize',12)
    hold on;
end
hold off
%{
    hold on % draw lines of gamme
    for mm=1:size(histoSmoothmaxlocs)
        size(X,2)
        plot([0 size(ix,1)],[histoSmoothmaxlocs(mm);histoSmoothmaxlocs(mm)], 'Marker','.','Color', 'k');
        hold on
    end
    hold off
%}


%{
    if ( MidiData(Midi_index, 4) == 0 ) % patch for bad midiData!
        MidiData(Midi_index, 4) = 1;
    end
%}