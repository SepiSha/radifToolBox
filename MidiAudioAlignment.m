%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MidiAudioAlignment(x, y, ixMidi, iyAudio, dist, metric)
global X;

global ax1;
global ax2;
global GusheNameSimple;
global GusheName
global corrections;
corrections = true;

if corrections == false
    subplot('Position',[0.13 0.74 0.78 0.17]);
    plot(((1:numel(x))),x,'.-', ...
        (1:numel(y)),y,'.-')
    xticklabels(X)
    xticks('auto' )
    xtickformat('%.2f')
end


changedIndexesMidi = diff(ixMidi)~=0;


MidiIx=zeros(size(ixMidi,1),1);
MidiFreqIndex=1;
for pp=1:size(changedIndexesMidi)
    if (changedIndexesMidi(pp)==0)
        MidiIx(pp)=x(ixMidi(pp));
        MidiFreqIndex=MidiFreqIndex+1;
    end
end

MidiIx(MidiIx==0)=nan;

changedIndexesAudio = diff(iyAudio)~=0;

AudioIy=zeros(size(iyAudio,1),1);
YCentIndex=1;
for pp=1:size(changedIndexesAudio)
    if (changedIndexesAudio(pp)==0)
        AudioIy(pp)=y(iyAudio(pp));
        YCentIndex=YCentIndex+1;
    end
end


AudioIy(AudioIy==0)=nan;

title(getString(message('signal:dtw:OriginalSignals')));



if corrections == true
    hight= 0.80;
else
    hight = .49
end
ax1=subplot('Position',[0.13 0.11 0.78 hight]);
plot(1:numel(ixMidi),x(ixMidi),'.-', ...
    1:numel(iyAudio),y(iyAudio),'.-');

hold on;
axes(ax1);
plot(MidiIx, 'Color', 'y','LineWidth',2)
hold on;
plot(AudioIy, 'color', 'g','LineWidth',2)
%plot([1,1000,5000],[1,1000,1500] )


ax2=subplot('Position',[0.05 0.11 0.04 hight]); % for note names
%plot(1:numel(ix),x(ix),'.-', 1:numel(iy),y(iy),'.-');
linkaxes([ax1,ax2],'y')


titleStr = sprintf('%s ', ...
    getString(message('signal:dtw:AlignedSignals')))

axes(ax1);
title({titleStr,GusheNameSimple}, 'interpreter', 'none');
