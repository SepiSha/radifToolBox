%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% returns moving average of a curve in a given interval.

function [Y_Smooth] = CurveSmoother(Y,smoothingFactor,curveBegin,curveEnd)



smAll= smoothingFactor*2+1;
Y_Smooth=zeros(size(Y,1),1);

for i =smoothingFactor:(curveEnd-curveBegin)-smoothingFactor
    NumPoints= smAll;
    for j = -smoothingFactor:smoothingFactor
        m=curveBegin+i;
        n=curveBegin+i+j;
        if ( isnan(Y(n,1))) || ( Y(n,1) == 0)
            NumPoints = NumPoints - 1;
        else
            Y_Smooth(m) = Y_Smooth(m)+Y(n,1);
        end
    end
    if ( NumPoints >0)
        Y_Smooth(m)= Y_Smooth(m)/NumPoints;
    else
        Y_Smooth(m)= NaN;
    end
end
end
