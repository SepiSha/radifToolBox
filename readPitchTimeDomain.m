%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X,Y_cent] = readPitchTimeDomain(data)
global GusheName;   % to pass to dtw-plot

X=data(:,1);
Y_cent=data(:,2);
Y_cent=1200*log(Y_cent/55+0.000000000000001)/log(2);

ff=zeros(size(X,1)-1,1);
duplicate = 0;   % somehow pyin is generating a duplicate point towards the end of file
for bb=1:size(X)-1
    ff(bb)=(X(bb+1)-X(bb));
    if (ff(bb)==0)
        if duplicate ~=0
            error("stop:read pitch domain.---- multiple duplicates")
        end
        duplicate = bb;
    end
end

if duplicate ~= 0
    X      = [X(1:duplicate)     ;   X(duplicate+2:end)     ];
    ff     = [ff(1:duplicate-1)  ;   ff(duplicate+1:end)    ];
    Y_cent = [Y_cent(1:duplicate); Y_cent(duplicate+2:end)  ];
end

% fill out the missing time in the time sequence
Ts= min (ff);               % Sampling Time
tt = transpose(X);       % Create Time Series With Gaps
f = Y_cent;                      % Create Matching Data
tn = round(tt/Ts);                      % Create Indices With Gaps
dt = diff([0 tn]); % Create Vector Of Differences
tg = find(dt > 1);                      % Find Indices Of Gaps
gaps = dt(tg)-1;                        % Find Lengths Of Gaps

fprintf("readPitchDomain: LinSpace %d %d \n", max(tt),max(tn));
ti = linspace(0,max(tt),max(tn)+1);   % Create Continuous Time Vector
fi = interp1(tt,f,ti);                   % Create Matching Data Vector
offset=0;
for k1 = 1:length(tg)                   % Loop Filling Gaps In ?f? With NaN
    
    q = [tg(k1):tg(k1)+gaps(k1)-1];
    fi(offset+tg(k1):offset+tg(k1)+gaps(k1)-1) = nan(1,gaps(k1));
    offset=offset+gaps(k1);
    
end

X=ti;   % New X, including the 0s (equidistance time vector)
fi(isnan(fi))=0;
Y_cent=transpose(fi);

% here we want to clear up the silence of the beginning of the audio, so that when we do the dtw
% we don't have extra silences... we do the same to X so that X and Y-cent remain the same corresponding
% vectors
BeginingSilence=1;
while Y_cent(BeginingSilence) == 0  %% change this to frequencies that include the introduction to the pieces by the singer if you can
    BeginingSilence = BeginingSilence + 1;
end

Y_cent = Y_cent(BeginingSilence:end);
X = X (BeginingSilence:end);
X = X - X(1);
end

