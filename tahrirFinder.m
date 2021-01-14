%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tahrirfinder finds the spikes and the the inverse spike.

function [YY,Y_tahrir, linesFound,Y_tahrir_del,doubleTahrir,tahrirIslands,maxlocsTahrir] = tahrirFinder(X,YY,Y_cent, MidiFreq, smoothFactor, w,h, saveixbegin, saveixend, saveiybegin, saveiyend,ix,iy, MidiPointsCent, Y_centExtrapolated)
global ax1;
Y_tahrir    =NaN(size(YY,1),1);
Y_tahrir_del=NaN(size(YY,1),1);
Y_smooth    = CurveSmoother(Y_cent,smoothFactor,1,size(YY,1));
[maxima,maxlocs] = findpeaks(Y_smooth,1, 'MinPeakProminence',20);
SpikeInverse=-Y_smooth;
[minimaInverse,minlocs] = findpeaks(SpikeInverse,'MinPeakProminence',20);
AudioextremaLocs=union(maxlocs, minlocs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% DoubleTahrir%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AudioSharpMax=[]; %Find Sharp Maximums of Audio
for qq=2:size(AudioextremaLocs)-2
    if (    (   AudioextremaLocs(qq) >6                             ) && ...
            (   Y_cent(AudioextremaLocs(qq))-Y_cent(AudioextremaLocs(qq)-6) >20 ) && ...
            (   Y_cent(AudioextremaLocs(qq))-Y_cent(AudioextremaLocs(qq)+6) >20 ) ...
            )
        AudioSharpMax(end+1)=AudioextremaLocs(qq);
    end
end

doubleTahrir=nan(size(Y_cent,1),1);
for qq=1:size(AudioSharpMax,2)-2
    % find the index of the Audioextremalocs which corresponds to
    % AudioSharpMax(qq)
    locsIndex = find(AudioextremaLocs==AudioSharpMax(qq));
    %RangeDouble=Y_cent(nlocs(qq):nlocs(qq+1));
    %smallRangeDouble= RangeDouble(RangeDouble>Y_cent(nlocs(qq))-50);
    
    if  (      (AudioSharpMax(qq+1)-AudioSharpMax(qq)<35) && (AudioSharpMax(qq+1)-AudioSharpMax(qq)) >20 ...
            && (  abs( Y_cent(AudioSharpMax(qq+1))    - Y_cent(AudioSharpMax(qq))          ) <120 ) ...
            && (  abs( Y_cent(AudioextremaLocs(locsIndex))- Y_cent(AudioextremaLocs(locsIndex+1))  ) >82  ) ...
            )
        %&& (numel(smallRangeDouble)<10)...
        doubleTahrir(AudioSharpMax(qq)-6:AudioSharpMax(qq+1)+6,1)=Y_cent(AudioSharpMax(qq)-6:AudioSharpMax(qq+1)+6,1);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Single Tahrir Maximum %%%%%%%%%%%%%%%%%%%%%%%%

linesFound=0;
garbagePoints=0;
for qq=1:size(AudioextremaLocs)-2
    h1 =  Y_smooth(AudioextremaLocs(qq  ))-Y_smooth(AudioextremaLocs(qq+1));
    h2 =  Y_smooth(AudioextremaLocs(qq+1))-Y_smooth(AudioextremaLocs(qq+2));
    w1= AudioextremaLocs(qq+1) - AudioextremaLocs(qq);
    w2= AudioextremaLocs(qq+2) - AudioextremaLocs(qq+1);
    step=6;
    
    tahrir_x=10; % in points.  Offsets to see if the top is wide or thin
    tahrir_y=50; % in Cents.
    Range=Y_cent(AudioextremaLocs(qq):AudioextremaLocs(qq+2));
    smallRangeMax= Range(Range>Y_cent(AudioextremaLocs(qq+1))-tahrir_y);
    
    
    limitWprime=Y_cent(AudioextremaLocs(qq+1))-170;
    [val1,idx1]=min(abs(Y_cent ( AudioextremaLocs(qq):AudioextremaLocs(qq+1) )-limitWprime));
    [val2,idx2]=min(abs(Y_cent ( AudioextremaLocs(qq+1):AudioextremaLocs(qq+2) )-limitWprime));
    
    idx1=idx1+AudioextremaLocs(qq);
    idx2=idx2+AudioextremaLocs(qq+1);    % sometimes this is [] .  need to be handled
    wPrime=idx2-idx1;
    
    %val1=Y_cent(idx1);
    %val2=Y_cent(idx2);
    
    %Normal, upward hills detection:
    if ( size(wPrime, 1) ~= 0 )
        if (    (   ((w1<w *0.7) && (w2<w *0.7)) || (wPrime<0.7*w)  ) && ...
                (-h1 > h) && (h2 > h) && ...
                abs(   Y_cent(AudioextremaLocs(qq+1)+tahrir_x) - Y_cent(AudioextremaLocs(qq+1))   )>tahrir_y &&...
                abs(   Y_cent(AudioextremaLocs(qq+1)-tahrir_x) - Y_cent(AudioextremaLocs(qq+1))   )>tahrir_y &&...
                (numel(smallRangeMax)<10)...
                )
            linesFound = linesFound + 1;
            
            % Remove extra points at the right and left of mountain
            while (abs(Y_cent(AudioextremaLocs(qq)+step)-Y_cent(AudioextremaLocs(qq))) <(abs((h1*step)/w1))) % && we are not near the peak
                Y_tahrir_del(AudioextremaLocs(qq) )= Y_cent ( AudioextremaLocs(qq) );% show removed dots ( at the left)
                AudioextremaLocs(qq)=AudioextremaLocs(qq)+1;
                garbagePoints = garbagePoints +1;%just to see how many points are thrown away.
                
            end
            while (abs(Y_cent(AudioextremaLocs(qq+2)-step)-Y_cent(AudioextremaLocs(qq+2))) <(abs((h2*step)/w2))) % && we are not near the peak
                Y_tahrir_del(AudioextremaLocs(qq+2) )= Y_cent ( AudioextremaLocs(qq+2) );% show removed dots ( at the right)
                AudioextremaLocs(qq+2)=AudioextremaLocs(qq+2)-1;
                garbagePoints = garbagePoints +1;%just to see how many points are thrown away.
            end
            
            Y_tahrir ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) ) = Y_cent ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) );
            YY       ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) ) = nan;
            
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%% Single Tahrir Minimum %%%%%%%%%%%%%%%%%%%%%%%%
    
    
    smallRangeMin= Range(Range<Y_cent(AudioextremaLocs(qq+1))+tahrir_y);
    
    
    Y_centTempW1=-Y_cent ( AudioextremaLocs(qq):AudioextremaLocs(qq+1) );
    Y_centTempW2=-Y_cent ( AudioextremaLocs(qq+1):AudioextremaLocs(qq+2) );
    limitWprimeMin=-Y_cent(AudioextremaLocs(qq+1))-170;
    [val1,idx1]=min(abs( Y_centTempW1-limitWprime));
    [val2,idx2]=min(abs( Y_centTempW1-limitWprime));
    
    idx1=idx1+AudioextremaLocs(qq);
    idx2=idx2+AudioextremaLocs(qq+1);
    wPrimeMin=idx2-idx1;
    
    if ( size(wPrimeMin, 1) ~= 0 )
        if (  (((w1<w *0.7) && (w2<w *0.7)) || (wPrimeMin<0.7*w)  )  &&...
                (h1 > h)  && (-h2 > h) && ...
                abs(   Y_cent(AudioextremaLocs(qq+1)+tahrir_x) - Y_cent(AudioextremaLocs(qq+1))   )>tahrir_y &&...
                abs(   Y_cent(AudioextremaLocs(qq+1)-tahrir_x) - Y_cent(AudioextremaLocs(qq+1))   )>tahrir_y &&...
                (numel(smallRangeMin)<10)...
                )
            
            linesFound = linesFound + 1;
            
            % Remove extra points at the right and left of mountain
            while (abs(Y_cent(AudioextremaLocs(qq)+step)-Y_cent(AudioextremaLocs(qq))) <(abs((h1*step)/w1))) % && we are not near the peak
                Y_tahrir_del(AudioextremaLocs(qq) )= Y_cent ( AudioextremaLocs(qq) );% show removed dots ( at the left)
                AudioextremaLocs(qq)=AudioextremaLocs(qq)+1;
                garbagePoints = garbagePoints +1;%just to see how many points are thrown away.
                
            end
            while (abs(Y_cent(AudioextremaLocs(qq+2)-step)-Y_cent(AudioextremaLocs(qq+2))) <(abs((h2*step)/w2))) % && we are not near the peak
                Y_tahrir_del(AudioextremaLocs(qq+2) )= Y_cent ( AudioextremaLocs(qq+2) );% show removed dots ( at the right)
                AudioextremaLocs(qq+2)=AudioextremaLocs(qq+2)-1;
                garbagePoints = garbagePoints +1;%just to see how many points are thrown away.
            end
            
            
            Y_tahrir ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) ) = Y_cent ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) );
            YY       ( AudioextremaLocs(qq):AudioextremaLocs(qq+2) ) = nan;
            
        end
    end
end

%{
figure;
plot(Y_smooth, 'color', 'k');            hold on
plot ( Y_tahrir, 'color', [.7,.2,.1] );  hold on

%plot(locs,locs_Y, 'color', 'R');
plot(Y_tahrir_del,'Marker','.','MarkerSize',5, 'color', 'R'); hold on
plot(Y_tahrir_del,'Marker','.','MarkerSize',5, 'color', 'cyan');

title("tahrir");
%}

%look for tahrir islands:
Y_tahrir(isnan(Y_tahrir))=0;
sig=Y_tahrir;
tsig = (abs(sig) <= eps);  % around zero
dsig = diff([1;tsig;1]);
startIndex = find(dsig < 0);
endIndex = find(dsig > 0)-1;
%durationSig = endIndex-startIndex+1; %useless
tahrirIslands=[startIndex,endIndex];

% do I need this at all?
maxlocsTahrir =zeros(size(tahrirIslands,1),1);
maxTahrir     =zeros(size(tahrirIslands,1),1);
for oo=1: size(tahrirIslands,1)
    [maxTahrir(oo),maxlocsTahrir(oo)]=max(Y_tahrir(startIndex(oo):endIndex(oo)));
    maxlocsTahrir(oo)=maxlocsTahrir(oo)+startIndex(oo);
    %maxlocsTahrir(oo)=ix(maxlocsTahrir(oo));
    
end


% find the midi note number corresponding to each tahrir.
getOut=false;
tahrirMidi=NaN(numel(ix),1);
tahrirMidiVoice=NaN(numel(ix),1);
for yy=1: size(maxlocsTahrir,1)
    for ww=2:size(saveiybegin,2)
        if (maxlocsTahrir(yy)>=saveiybegin(1,ww-1) && maxlocsTahrir(yy)<saveiybegin(1,ww))
            tahrirMidi(saveixbegin(ww-1):saveixend(ww-1))=MidiPointsCent(saveixbegin(ww-1):saveixend(ww-1));
            tahrirMidiVoice(saveiybegin(ww-1):saveiyend(ww-1))=Y_centExtrapolated(saveiybegin(ww-1):saveiyend(ww-1));
            %fprintf("-----%d %d %d  %d %d\n",ww-1,yy,maxlocsTahrir(yy), MidiData(ww-1,1),ix(ww-1));
            %getOut=true;
        end
        if getOut==true
            break
        end
    end
    if getOut==true
        break
    end
end

%{
    %To plot tahrir notes on DTW plot
    axes(ax1); %ax1 is first subplot of DTW
    hold on;
    plot(1:numel(ix),tahrirMidi(ix), 'color','k','Marker','*')
    hold on;
    plot(1:numel(iy),tahrirMidiVoice(iy), 'color','magenta','Marker','*')
%}
end % of function