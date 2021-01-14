%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Y1_solidAverage, Y2_solidnotesOriginal,pitch_cents] = solidNotes(pitch_cents, hop)

% Looking for solid notes
Y1_solidAverage=zeros(size(pitch_cents,1),1);
Y2_solidnotesOriginal=zeros(size(pitch_cents,1),1);
for hopstep=32*hop:-3:hop %why 32?
    j=1;
    while j< size(pitch_cents,1)-hopstep
        M= mean(pitch_cents(j:j+hopstep,1));
        S=std(pitch_cents(j:j+hopstep,1)); %std is standard deviation
        Max=int32(max(pitch_cents(j:j+hopstep,1)));
        Min=int32(min(pitch_cents(j:j+hopstep,1)));
        if ((S<15) && ( M~=0) && ((Max-Min)<30) )
            solidBegin = j;
            solidEnd = j+hopstep;
            %fprintf("Variance and M for solid lines %.2f     %.2f \n", S, M)
            while ( abs(pitch_cents(solidBegin)-M) > 3*S)
                solidBegin = solidBegin +1;
            end
            
            while ( abs(pitch_cents(solidEnd)-M) >3*S)
                solidEnd = solidEnd -1;
            end
            
            if ((M==0) && (j>1000))
                error("j= %d %d Solid Note error!",j,hopstep);
            end
            Y1_solidAverage(solidBegin:solidEnd,1)=M;
            Y2_solidnotesOriginal(solidBegin:solidEnd,1)=pitch_cents(solidBegin:solidEnd,1);
            pitch_cents(solidBegin:solidEnd,1)=nan;
            j=j+int32(hopstep)-1;
        end
        j = j+1;
    end
end