%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% this function finds the range of each mountain in histogram, and then pass the range of the mountain to
% a function to fit a Gaussian to that mountain and finds the peak of the
% gaussian as the audio pitch estimate of each note.

function [audioShahed,audioShahedSpare,histoSmoothmaxlocs] = findNoteRange(histogramSmooth, z,derivative, histoSmoothmaxima, histoSmoothmaxlocs,histoStart)
global GusheName;

%{
ymed = medfilt1(histogramSmooth,60);
figure;
plot (ymed, 'color','k');
hold on;
plot(histogramSmooth);
title("findNoteRange: initial histogramSmooth+medfit (not used)");
%}


for i=1:size(histoSmoothmaxlocs,1)
    %first we move from the points on top of the peak to the left by 20, to
    % get rid of the noises on top
    if histoSmoothmaxlocs(i)<histoStart
        error("findNoteRange: error1 histoSmoothmaxlocs(i)=%d  <  %d ", histoSmoothmaxlocs(i), histoStart);
        continue;
    end
    j=histoSmoothmaxlocs(i)-histoStart-20 ;
    if ( j <1)
        j = 1;
    end
    % Takes the 20% around the peak from the left side
    peakh=0.8*histoSmoothmaxima(i);
    j;
    while ( histogramSmooth(j+histoStart+7) > 0.8*histoSmoothmaxima(i))
        if (histogramSmooth(j+histoStart)<histogramSmooth(j+histoStart-40)) % 40 was 7, but it ruined things when the peak itself was wide and zigzag
            break
        end
        j = j -1;
        if j <2
            break;
        end
    end
    if j <1   % why is this a possible... this should not happen!
        j=1;
    end
    while ((derivative(j))>1.9)
        if j>1
            j=j-1;
        else
            break;
        end
    end
    rangeBegin(i)=j+histoStart+7;
    % Now looking at the rhs of the range
    k=histoSmoothmaxlocs(i)-histoStart+20;
    %{
    while (abs(derivative(k))<1.5)
        if ( k == size(derivative,1))  %sh added
            break;
        end
        k=k+1
    end
    %}
    
    if ( k>size(derivative,1) )
        k = size(derivative, 1);
    end
    
    while ( histogramSmooth(k+histoStart+7) > 0.8*histoSmoothmaxima(i))
        if  k == size(derivative,1)
            break;
        end
        k = k + 1;
    end
    
    while (derivative(k)<-1.5)
        if ( k == size(derivative,1))  %sh added
            fprintf("findNoteRange7:,K, SIZE derivative %d %d \n", k+histoStart, size(derivative,1))
            break;
        end
        k=k+1;
    end
    
    if (histogramSmooth(k+histoStart+7)<histogramSmooth(k+histoStart))
        rangeEnd(i)=k+histoStart+7;
    else
        rangeEnd(i)=k+histoStart;
    end
    
    if( -histogramSmooth( rangeEnd(i)) + histogramSmooth(rangeBegin(i)) > .4 )
        while ( histogramSmooth(rangeBegin(i)) - histogramSmooth(rangeBegin(i)-15) > .2)
            rangeBegin(i) = rangeBegin(i) - 15;
        end
    else
        fprintf("findNoteRangeA: No need to make it longer L\n");
    end
    
    if( histogramSmooth( rangeEnd(i)) - histogramSmooth(rangeBegin(i)) > .4 )
        while ( histogramSmooth(rangeEnd(i)) - histogramSmooth(rangeEnd(i)+15) > .2)
            if rangeEnd(i) > size(histogramSmooth, 1)
                break;
            end
            rangeEnd(i) = rangeEnd(i) + 15;
        end
    else
        fprintf("findNoteRangeD: No need to make it longer  R\n");
    end
    
    
    %make the left and right side 'almost' equal
    while( (histogramSmooth( rangeEnd(i)) - histogramSmooth(rangeBegin(i))) > .4 )
        rangeBegin(i) = rangeBegin(i) + 1;
    end
    
    %shorten right side
    while( -histogramSmooth( rangeEnd(i)) + histogramSmooth(rangeBegin(i)) > .4 )
        rangeEnd(i) = rangeEnd(i) - 1;
    end
    
    
    % one more time, let's try to find a nice curve!
    % cut the flat ends from the sides:
    for p=1:5
        if ( rangeEnd(i) - rangeBegin(i) < 90)
            break;
        end
        if (histogramSmooth (rangeBegin(i)+7) -histogramSmooth (rangeBegin(i)) ) <  1.5
            rangeBegin(i) = rangeBegin(i) + 7;
        end
        if (histogramSmooth (rangeEnd(i)-7) -histogramSmooth (rangeEnd(i)) ) <  .9   %1.5 sha
            rangeEnd(i) = rangeEnd(i) - 7;
        end
    end
    
    
    
    %if the curve is tall enough, sometime the Begin and end cause fitting
    %problem, here we reduce that chance:
    
    if (   (histoSmoothmaxima(i)-histogramSmooth(rangeBegin(i),1)>80) && ...
            (rangeEnd(i)-rangeBegin(i)>80))
        rangeBegin(i)=rangeBegin(i)+15;
        rangeEnd(i)=rangeEnd(i)-15;
    end
    
    
    if ( rangeEnd(i) - rangeBegin(i) ) < 3
        continue;
        %error( " short range");
    end
    
    if ( i < size(histoSmoothmaxlocs, 1) )  % need to do the same for endrange being higher than histoSmoothmaxlocs( i)
        if ( rangeEnd(i) > histoSmoothmaxlocs( i+1) )
            [yyyy,x] = min(  histogramSmooth( histoSmoothmaxlocs( i):histoSmoothmaxlocs( i+1))   )
            rangeEnd(i) = x + histoSmoothmaxlocs( i);
        end
    end
    
    locpeakNEW=   histoSmoothmaxlocs(i);
    NewRangeEnd=rangeEnd(i);
    for mm1=locpeakNEW:locpeakNEW+100
        if (histogramSmooth(mm1)<histogramSmooth(locpeakNEW)/2)
            NewRangeEnd=mm1;
            break
        end
        
    end
    if ( z == 12)
        fprintf("aha");
    end
    NewRangeBegin=rangeBegin(i);
    for mm2=locpeakNEW:-1:locpeakNEW-100
        if (histogramSmooth(mm2)<histogramSmooth(locpeakNEW)/2)
            NewRangeBegin=mm2;
            break
        end
        
    end
    
    
    
    [yhat,histoSmoothmaxlocs(i) ]=GaussianPeakFit(NewRangeBegin,NewRangeEnd,i,z,histogramSmooth, rangeBegin(i), rangeEnd(i),...
        histoSmoothmaxlocs,histoStart, derivative,peakh,histoSmoothmaxima);
    
    
    
    %{
figure;

plot ([mm1, mm1],[0 histogramSmooth(locpeakNEW)], 'color','k');
hold on;
plot ([mm2, mm2],[0 histogramSmooth(locpeakNEW)], 'color','k');
hold on;
plot(histogramSmooth);
titlestr= sprintf("findNoteRange: histogramSmooth %d -- %d    mm1,2=%d & %d", z, i, mm1, mm2);
title(titlestr);
        %}
        
        
        
        %find the middle area of the peak and see how that looks in compare to
        %the curve fitting
        %{
    area = sum( histogramSmooth(rangeBegin(i):rangeEnd(i)) );
    half=0;
    for w= rangeBegin(i):rangeEnd(i)
        half= half+ histogramSmooth( w);
        if half> area/2
            fprintf("middle point = %d\n", w);
            break;
        end
        
    end
    plot([w w],[0 ahat+2], 'Marker','+', 'color', 'k');
    hold off
        %}
end

for i=1:size(histoSmoothmaxlocs,1)
    histoArea(i) = sum( histogramSmooth(rangeBegin(i):rangeEnd(i)) ); %removed histoStart 
end

[maxArea,I]=max(histoArea);
audioShahed=histoSmoothmaxlocs(I);

for i=1:size(histoSmoothmaxlocs,1)
    histoArea(i) = sum( histogramSmooth(histoSmoothmaxlocs(i)-55:histoSmoothmaxlocs(i)+55) );
end

[maxArea,I]=max(histoArea);
audioShahedSpare=histoSmoothmaxlocs(I);