%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [silencesFound] = SilenceFinder(X,Y_cent)

% Looking for large silences as indicator of the beginning of sentence
Zero=zeros(size(Y_cent));
LogicalY=or(Y_cent,Zero);
EndSilence=find(diff(LogicalY)==1);
BeginSilence=find(diff(LogicalY)==-1);
duration=EndSilence-BeginSilence+1;
StringIndex=(duration>=17);
BeginSilence=BeginSilence(StringIndex);
EndSilence=EndSilence(StringIndex);
silenceMatrix=[BeginSilence,EndSilence,EndSilence-BeginSilence];
silencesFound=silenceMatrix;
end
