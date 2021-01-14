
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [vaziriTicks,vaziriCents] = CreateVaziriTicks(minHistoBar,maxHistoBar,midiHistoFreq2)
 vaziriTicks = zeros( maxHistoBar+40,1);
    vaziriCents = zeros( maxHistoBar+40,1);
    
    for vaziriIndex=minHistoBar:maxHistoBar
        if ( midiHistoFreq2(vaziriIndex) == 0 )
            vaziriTicks(vaziriIndex) = 1;
            vaziriCents(vaziriIndex) = vaziriCents(vaziriIndex -1)+50;
        else
            vaziriTicks(vaziriIndex) = 3;
            vaziriCents(vaziriIndex) = midiHistoFreq2(vaziriIndex);
        end
    end
    vaziriTicks(minHistoBar-1) = 1;
    vaziriCents(minHistoBar-1) = midiHistoFreq2(minHistoBar)-50;
    vaziriTicks(minHistoBar-2) = 1;
    vaziriCents(minHistoBar-2) = vaziriCents(minHistoBar)-100;
    vaziriTicks(minHistoBar-3) = 1;
    vaziriCents(minHistoBar-3) = vaziriCents(minHistoBar)-150;
    vaziriTicks(minHistoBar-4) = 1;
    vaziriCents(minHistoBar-4) = vaziriCents(minHistoBar)-200;
    
    if ( vaziriCents(minHistoBar-1) < 600)   % only for daraamad mahur... the rest 1000 is fine... Why?
        error("what");
    end
end