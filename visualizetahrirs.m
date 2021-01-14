%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function visualizetahrirs(Y_tahrir,iy,doubleTahrir,Y_tahrir_del)

Y_tahrir(Y_tahrir==0)=nan;
plot(1:numel(iy),Y_tahrir(iy), 'color','cyan' ,'LineWidth',1, 'MarkerSize',10);%[.7,.4,.1]
hold on
plot(1:numel(iy),doubleTahrir(iy), 'color',[0.3 0.3 0.9] ,'LineWidth',1, 'MarkerSize',10);%[.7,.4,.1]
hold on
plot(1:numel(iy),Y_tahrir_del(iy), 'color', 'k','LineWidth',2)
%hold on

title("tahrir", 'interpreter', 'none')