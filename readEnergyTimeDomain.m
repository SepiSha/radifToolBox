%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [XE,YE] = readEnergyTimeDomain(data)

XE=data(:,1);
YE=data(:,2);

ff=zeros(size(XE,1)-1,1);
for bb=1:size(XE)-1
    ff(bb)=(XE(bb+1)-XE(bb));
    if (ff(bb)==0)
        
        fprintf("readEnergyTimeDomain: readEnergyDomain %d %f %d \n", bb, XE(bb-3),size(XE,1));
        fprintf("readEnergyTimeDomain: readEnergyDomain %d %f \n", bb, XE(bb-2));
        fprintf("readEnergyTimeDomain %d %f \n", bb, XE(bb-1));
        fprintf("readEnergyTimeDomain %d %f \n", bb, XE(bb));
        fprintf("readEnergyTimeDomain %d %f \n", bb, XE(bb+1));
        fprintf("readEnergyTimeDomain %d %f \n", bb, XE(bb+2));
        error("readEnergyTimeDomain:   stop:read energy domain")
    end
end

% fill out the missing time in the time sequence
Ts= min (ff);               % Sampling Time
tt = transpose(XE);       % Create Time Series With Gaps
f = YE;                      % Create Matching Data
tn = round(tt/Ts);                      % Create Indices With Gaps
dt = diff([0 tn]); % Create Vector Of Differences
tg = find(dt > 1);                      % Find Indices Of Gaps
gaps = dt(tg)-1;                        % Find Lengths Of Gaps

fprintf("readEnergyTimeDomain:  readEnergyDomainLinSpace %d %d \n", max(tt),max(tn));
fprintf("readEnergyTimeDomain:  readEnergyDomainLinSpace %d %d \n", max(tt),max(tn));
fprintf("readEnergyTimeDomain:  readEnergyDomainLinSpace %d %d \n", max(tt),max(tn));
ti = linspace(0,max(tt),max(tn)+1);   % Create Continuous Time Vector
fi = interp1(tt,f,ti);                   % Create Matching Data Vector
offset=0;
for k1 = 1:length(tg)                   % Loop Filling Gaps In ?f? With NaN
    
    q = [tg(k1):tg(k1)+gaps(k1)-1];
    fi(offset+tg(k1):offset+tg(k1)+gaps(k1)-1) = nan(1,gaps(k1));
    offset=offset+gaps(k1);
    
end


XE=ti;   %New X, including the 0s (equidistance time vector)
fi(isnan(fi))=0;
YE=transpose(fi);


% here we clear the silence of the beginning of the audio, so that when we do the dtw
% we don't have extra silences... we do the same to X so that X and Y-cent remain the same corresponding
% vectors
BeginingSilence=1;
while YE(BeginingSilence) == 0  %% change this to frequencies that include the introduction to the pieces by the singer if you can
    BeginingSilence = BeginingSilence + 1;
end

YE = YE(BeginingSilence:end);
XE = XE (BeginingSilence:end);
XE = XE - XE(1);

% Here we smooth the energy
%YE=[YE(20:end,1);YE(1:19,1)];  % we need to vberify this... energy and ycent have a lag?
Temp=YE;
for i=3:size(YE,1)-3
    Temp(i)=(YE(i-2)+YE(i-1)+YE(i)+YE(i+1)+YE(i+2))/5;
end
YE=Temp;
end



