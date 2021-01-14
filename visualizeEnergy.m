%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This function visualizes energy in the audio-MIDI aligned plot
function visualizeEnergy(ix,iy,YE,YE2,yy,Y_high_mean,ELevel1,ELevel2,ELevel3,Y_low,Y_high,Y_high1,Y_high2)
global GusheName;

 Eshift=500;
    %M4 is Davami
    startIndex = regexp(GusheName,"_M4_");
    if ~isempty(startIndex)
        Eshift=700;
    end
    maxYE=max(YE);
    
    plot(1:numel(iy),YE2(iy)*1200+Eshift, 'LineStyle', 'none', 'Marker','.','color',[0.0 0.9 0.0]);
    hold on
    plot(1:numel(iy),YE(iy)*1200+Eshift, 'LineStyle', 'none', 'Marker','.','color',[0.9 0.01 0.01]);
    hold on
    plot([0 size(ix,1)],[Eshift ;Eshift], 'Marker','.', 'LineWidth',2,'Color', [0.4 0.6 0.1]);
    hold on
    plot([0 size(ix,1)],[1200*Y_high_mean*ELevel1+Eshift ;1200*Y_high_mean*ELevel1+Eshift], 'Marker','+', 'LineWidth',.5,'Color', 'r');
    hold on
    plot([0 size(ix,1)],[1200*Y_high_mean*ELevel2+Eshift ;1200*Y_high_mean*ELevel2+Eshift], 'Marker','+', 'LineWidth',.5,'Color', 'r');
    hold on
    plot([0 size(ix,1)],[1200*Y_high_mean*ELevel3+Eshift ;1200*Y_high_mean*ELevel3+Eshift], 'Marker','+', 'LineWidth',.5,'Color', 'r');
    %hold on  Sh May 2
    %plot([0 size(ix,1)],[1200*maxYE+Eshift;1200*maxYE+Eshift], 'Marker','.', 'LineWidth',2,'Color', [0.4 0.6 0.1]); 
    hold on
    %show energy levels
    plot(1:numel(iy),Y_low(iy), 'LineStyle', '-', 'Marker','.','color','k');
    hold on
    plot(1:numel(iy),Y_high(iy), 'LineStyle', 'none', 'Marker','.','color','r');
    hold on
    plot(1:numel(iy),Y_high1(iy), 'LineStyle', '-', 'Marker','.','color','r');
    hold on   %[.7,.2,.5]
    plot(1:numel(iy),Y_high2(iy), 'LineStyle', '-', 'Marker','.','color','r');