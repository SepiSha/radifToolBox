%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function finds the histogram of datapoints and also find the smoothed
% histogram using the moving average.

function [histogramSmooth, histoStart, histoEnd,histogram] = histofinder(z)

histogram=zeros(10000,1);
histogramSmooth=zeros(8000,1);

for i=1:size(z,1)*size(z,2)
    if ( z(i)>0  )
        histogram(int32(z(i)))=histogram(int32(z(i)))+1;
    end
end

smoothingFactor=22; %The parameter for moving average

for i=smoothingFactor:size(histogramSmooth,1)-smoothingFactor
    for j=1:smoothingFactor/2
        histogramSmooth(i)=histogramSmooth(i)+histogram(i+j)+histogram(i-j);
    end
    histogramSmooth(i)=(histogramSmooth(i)+histogram(i))/(smoothingFactor+1);
end


for i=1:size(histogramSmooth,1)*size(histogramSmooth,2)
    histoStart =i;
    if histogramSmooth(histoStart) >0 % Can change 0 to 2 or 3 to handle noisy data
        break;
    end
end
for i=1:size(histogramSmooth,1)*size(histogramSmooth,2)
    histoEnd =size(histogramSmooth,1)-i+1;
    if histogramSmooth(histoEnd) > 0
        break;
    end
end

end