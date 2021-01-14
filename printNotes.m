%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [twoDot, oneDot, noDot,saveiybegin,saveiyend,saveixbegin,saveixend] = ...
                   printNotes(MidiData,ix, iy, Y_centOriginal,MidiFreq, scaleFactor, fs)
global X;
global GusheName;
NoteNamesFigure={' C1','Cs1','Db1','Dk1'....
    ' D1','Ds1','Eb1','Ek1'....
    ' E1','Fk1',....
    ' F1','Fs1','F#1','Gk1'....
    ' G1','Gs1','Ab1','Ak1'....
    ' A1','As1','Bb1','Bk1'....
    ' B1','Bs1'...
    ' C2','Cs2','Db2','Dk2'....
    ' D2','Ds2','Eb2','Ek2'....
    ' E2','Fk2',....
    ' F2','Fs2','F#2','Gk2'....
    ' G2','Gs2','Ab2','Ak2'....
    ' A2','As2','Bb2','Bk2'....
    ' B2','Bs2',...
    ' C3','Cs3','Db3','Dk3'....
    ' D3','Ds3','Eb3','Ek3'....
    ' E3','Fk3',....
    ' F3','Fs3','F#3','Gk3'....
    ' G3','Gs3','Ab3','Ak3'....
    ' A3','As3','Bb3','Bk3'....
    ' B3','Bs3',...
    ' C4','Cs4','Db4','Dk4'....
    ' D4','Ds4','Eb4','Ek4'....
    ' E4','Fk4',....
    ' F4','Fs4','F#4','Gk4'....
    ' G4','Gs4','Ab4','Ak4'....
    ' A4','As4','Bb4','Bk4'....
    ' B4','Bs4',...
    };
pwd
duration_names={'   9Gerd','   2Gerd',...
    '  Gerd..','   Gerd.','    Gerd',...
    ' sepid..','  sepid.','   sepid',...
    '  siah..','   siah.','    siah',...
    ' chang..','  chang.','   chang',...
    '2lachg..',' 2lachg.','  2lachg',...
    '3lachg..',' 3lachg.','  3lachg',...
    '4lachg..',' 4lachg.','  4lachg',...
    '5lachg..',' 5lachg.','  5lachg',...
    '6lachg..',' 6lachg.','  6lachg',...
    '7lachg..',' 7lachg.','  7lachg',...
    '8lachg..',' 8lachg.','  8lachg'...
    '____zero'};
duration_names2={ '  9whole','  2whole',...
    ' whole..','  whole.','   whole',...
    '  half..','   half.','    half',...
    ' 1/4th..','  1/4th.','   1/4th',...
    ' 1/8th..','  1/8th.','   1/8th',...
    '1/16th..',' 1/16th.','  1/16th',...
    '1/32nd..',' 1/32nd.','  1/32nd',...
    '1/64th..',' 1/64th.','  1/64th',...
    ' 128th..','  128th.','   128th',...
    ' 256th..','  256th.','   256th',...
    ' 512nd..','  512nd.','   512nd',...
    '1024th..',' 1024th.','  1024th'...
    '____zero'};
%{
durations=[" gerd..","  gerd.","  gerd",...
          "sefid.."," sefid.","  sefid",...
          "siaah.."," siaah."," siaah",...
          "chang.."," chang.","  chang",...
          "  2la..","   2la.","    2la",...
          "  3la..","   3la.","    3la",...
          "  4la..","   4la.","    4la",...
          "  5la..","   5la.","    5la",...
          "  6la..","   6la.","    6la",...
          "  7la..","   7la.","    7la"]
   
durationFactor=[...
  % 7568,6144,4096
    3784,3072,2048,...
    1792,1536,1024,...
    896,768,512,...
    448,384,256,...
    224,192,128,...
    112,96,64,...
    56,48,32,...
    28,24,16,...
    14,12,8,...
    7,6,4]
    %}
    twoDot=0;
    oneDot=0;
    noDot=0;
    tstr="";
    
    durations=zeros(size(duration_names));
    durations(1) = (9*8*160* scaleFactor);
    durations(2) = (8*160  * scaleFactor);
    durations(3) = (7*160  * scaleFactor);
    durations(4) = (6*160  * scaleFactor);
    for i=5:size(durations,2)
        durations(i)= (durations(i-3)/2);  % before used floor
    end
    durations = round(durations);
    durations(size(durations,2)) = 0;
    
    DoRefileName= strcat('DoReMi', strcat(GusheName,'.txt'));
    fileID = fopen(DoRefileName,'w');
    if fileID == -1
        error("Bad file name=%s", DoRefileName);
    end
    fprintf(fileID, "\tvoice Midi Diff\t\t\t\t\t\t\t\tpresent\t\t Best\t\tSec\n\n");
   
    %find the timing of midi from audio (obtained from dtw)
  
    Midi_index=1;
    saveiybegin=[];
    saveiyend=[];
    saveixbegin=[];
    saveixend=[];
    for i=1 :  size(ix,1)
        if ( ix(i) ==  MidiData(Midi_index, 4)  )
            saveiybegin(1,Midi_index) = iy(i);
            saveixbegin(1,Midi_index) = ix(i);
            
            Midi_index=Midi_index + 1;
            if Midi_index > size(MidiData(:, 4),1 )
                break;
            end
        end
    end
    Midi_index=1;
    for i=1 :  size( ix,2)*size(ix,1)
        if ( ix(i) ==  MidiData(Midi_index, 5)  )
            while (( i<size(ix,1)) && ix(i) == ix(i+1) )
                i = i + 1;  % convert to while loop
            end
            saveiyend(Midi_index) = iy(i);
            saveixend(Midi_index) = ix(i);
            
            Midi_index=Midi_index + 1;
            if (Midi_index > size(MidiData(:, 5) ))
                break;
            end
        end
    end
    % fix dtw problem at the end of the curve:
    if ( size( saveiybegin,2) > size( saveiyend,2) )
        saveiyend(Midi_index) = iy(i);
        saveixend(Midi_index) = ix(i); % is this ok?
        fprintf("printNotes: dtw problem\n"); % could be an error 
    end
    if ( size( saveiybegin,2) > size( saveiyend,2) )
       error("printNotes: dtw problem beg=%d  end=%d\n", size( saveiybegin,2) , size( saveiyend,2)); % could be an error 
    end
   
    metro= 60* (saveiyend(end)/(160*scaleFactor)) /X(saveiyend(end));
    
    total_time=0;
    for ii = 1:size(saveiyend,2)
        if MidiData(ii,1) == 0
            fprintf(fileID,"\n\nsilence\n");
            %continue;
        end
        voiceTime= (saveiyend(ii) - saveiybegin(ii)) + 1;
        tc= Y_centOriginal(saveiybegin(ii):saveiyend(ii) );
        tc = tc(~isnan(tc));
        voiceFreq= mean( tc );  % correct? iy is voice time...
        
        mf= MidiFreq(saveixbegin(ii):saveixend(ii) );
        mf = mf(~isnan(mf));
        midiFreqAvg= mean( mf );  % correct? iy is voice time...
        
        if ( voiceTime==0)
            %error("dure == 0!  i=%d, saveiyend=%d", ii, saveiyend(ii));
        end
        total_time=total_time + voiceTime;  %this perhaps is not used at all... delete???
        
        j=size(durations,2);
        while (voiceTime >durations(j))
            j = j -1;
            if j == 1
                break;
            end
        end
        
         
        if ( voiceTime == 0) || (j== 31) || (j<1)
            note_dure=size(durations,2);

        elseif  (durations(j) - voiceTime < voiceTime - durations(j+1))
            j= j;
        else
            j = j+1;
        end
        % if note is small push it to upper valule  (rather than closer value)
        if ( (durations(j) < voiceTime) && (voiceTime > durations(j+1)) ) && (voiceTime < durations(20))
            j= j-1;
        end
        
        if ( size(regexp(duration_names2(j),'..', 'match'))~=0 ) % change .. to one or no dot  if same dist.
            if ( abs(durations(j+1) -voiceTime) == abs(durations(j) -voiceTime) )
                j= j+1;
            elseif ( abs(durations(j-1) -voiceTime) == abs(durations(j) -voiceTime) )
                j= j -1;
            end
        elseif ( size(regexp(duration_names2(j),'.', 'match'))~=0 ) &&...  %remove . if same distance
               ( abs(durations(j+1) -voiceTime) == abs(durations(j) -voiceTime) )
            j = j+1;
        end
        if ( j>26)   % we do not accept smaller than 128th
            j=26;
        end
        
        note_dure=j;
        
        if ( mod(note_dure, 3) == 0 ) %two dots
            twoDot= twoDot + 1;
            %fprintf("Two dots .  note dureation = %d . %s\n", note_dure, char(duration_names2(note_dure)) );
        elseif ( mod(note_dure, 3) == 1 ) %one dots
            oneDot= oneDot+1;
            %fprintf("one dot:  note dureation = %d . %s\n", note_dure, char(duration_names2(note_dure)) );
        elseif ( mod(note_dure, 3) == 2 ) %no dot
            noDot= noDot+1;
        end
       
        t= mod(MidiData(ii,1), 96);
        t = t+1;
        oldtstr= tstr;
        tstr= char(NoteNamesFigure(t) );
        if ( MidiData(ii,1) == 0)
            tstr="Slc";
        end
        midiTime= MidiData(ii, 5) - MidiData(ii, 4)+1; %+1??
        diff1 = voiceTime-midiTime;
        diff2 = voiceTime- round(durations(note_dure));
        pctCurrent= 100*diff1/voiceTime;
        pctNew     =100*diff2/voiceTime;
   
        remain=(durations(note_dure) - voiceTime)/ durations(20);
        if (remain>0)
            remain= -floor(remain); 
        else
            remain= -ceil(remain);
        end
        if ( remain ~=0) && (voiceTime==42) % debugging?
            %error("printNotes: crash");
        end

        if remain==0
            remStr =       "<      >";
        else
            remStr=sprintf("<%d*sela>", remain);
        end
        fprintf(fileID, "printNotes: i= %2.0d-<%4.0f %4.0f %3.0d>,  \t%s -- %s(%3.0d) %s \tV%3.0d - M%3.0d\t=%+3.0d  %%%+0.0f  \tq=%+3.0d  %%%+0.0f  \t %0.3f(%0.0f)",...
            ii,voiceFreq,midiFreqAvg,round((voiceFreq-midiFreqAvg))  ,tstr, char(duration_names2(note_dure)),round(durations(note_dure)),remStr, voiceTime, ...
            midiTime, diff1,pctCurrent,diff2,pctNew, ( X(saveiyend(ii)) - X(saveiybegin(ii)) ),metro);
        if ( strcmp(oldtstr, tstr) )
                fprintf(fileID, "<-- same note");
        end;
        if (    (    (voiceTime>16) && (abs(pctCurrent) >8)         ) &&...
                (    3+abs(pctNew) < abs(pctCurrent)                 ) &&...
                (    abs( midiTime- round(durations(note_dure)) )>1  )   ...
           ) ||...
           (    (     (voiceTime<17) && (abs(pctCurrent) >15)        ) &&...
                (     10+abs(pctNew) < abs(pctCurrent)               ) &&...
                (     abs( midiTime- round(durations(note_dure))) > 1)   ...
           )||...
           (          (pctNew<0) && (pctCurrent>0) && ( abs(pctNew - pctCurrent) < 4)...
           )
            fprintf(fileID, "<-----%%%0.0f   %%%0.0f", (abs(pctCurrent)),(abs(pctNew)));
            
            if ( voiceTime <17)
                fprintf(fileID, " <<\n\n");
            else
                fprintf(fileID, "\n\n");
            end
        else
            fprintf(fileID, "\n");
        end
        
    end
    %scaleFactor= .7371; % neeed to bring this in from functions
    metro= 60* (saveiyend(end)/(160*scaleFactor)) /X(saveiyend(end));
    fprintf(fileID, "\n\n metronome= %0.2f  saveiyend(end)/(160*scaleFactor))= %0.2f  X(saveiyend(end))=%0.2f  second per dot=%0.5f\n", ...
        metro,  (saveiyend(end)/(160*scaleFactor)) ,X(saveiyend(end)), X(saveiyend(end))/saveiyend(end));
    fprintf(fileID, "siaah == %d  scaleFactor=%0.2f   fs=%d \n\n\n", round(160*scaleFactor), scaleFactor,fs);
    
    
    for i=1:size(durations,2)
        fprintf(fileID, "%s,    %d\n",char(duration_names2(i)),round(durations(i)));
    end
    

    fclose(fileID);

    % the rest of this file may be unused for now

    Mean=[];
    Variance=[];   
    for i=1 :  size( saveiybegin,2)
        MMean(i)= round(mean(Y_centOriginal(saveiybegin(i):saveiyend(i),1)));
        Variance(i)=std(Y_centOriginal(saveiybegin(i):saveiyend(i),1));
    end
    
    sumAudioDuration=0;
    for i=1: size(saveiybegin,2)
        sumAudioDuration=sumAudioDuration+X(saveiyend(i))-X(saveiybegin(i));
    end
    
    sum(MidiData(:,2));
    AudioDurations=[]
    for i=1: size(saveiybegin,2)
        AudioDurations(i)=X(saveiyend(i))-X(saveiybegin(i));
        Constant(i)=(X(saveiyend(i))-X(saveiybegin(i)))/(MidiData(i,2)*(sumAudioDuration/ sum(MidiData(:,2))));       
    end
    %histogram (AudioDurations        the following two lines not used now?
    [AudiohistogramSmooth, AudiohistoStart, AudiohistoEnd,Audiohistogram] = histofinder(AudioDurations*10+1);
    [MidihistogramSmooth, MidihistoStart, MidihistoEnd,Midihistogram]     = histofinder(MidiData(:,2));
    
    %Need to get rid of 120 or 152 ( offset for midi notes) and make it
    %work for every Shahed. Just changed the 120 to midiShahed and still
    %doesn't make sense. Need further work!
    
    % debug: these two need to be of the same size. but they are not. 
    sz = size( saveiybegin,2);
    sz2= size(MidiData(:,1),1)
    
    PrintableMeanTable=[];
    PrintableMeanTable=int32(zeros(sz,7));
    PrintableMeanTable(:,1)=MidiData(1:sz,1); %sometimes off by 1
    %    PrintableMeanTable(:,2)=(MidiData(1:sz,1)-midiShahed)*50+audioShahed;
    %    PrintableMeanTable(PrintableMeanTable(:,2)< -1000,2)= 0;
    PrintableMeanTable(:,3)=MMean';
    PrintableMeanTable(:,4)=Variance';
    %    PrintableMeanTable(:,5)=(MidiData(1:sz,1)-midiShahed)*50+audioShahed-Mean';
    %    PrintableMeanTable(PrintableMeanTable(:,5)< -1000,5)= 0;
    PrintableMeanTable(:,6)=saveiyend-saveiybegin+1;
    PrintableMeanTable(:,7)=MidiData(1:sz,2);
    
    %%%% building matrix M so that we can play it
    M=zeros(size(MidiData,1),6);
    for i=1:size(MidiData,1)-1  %-1 is a patch(bug). saveiybegin should be the same size
        M(i,3)=MidiData(i);
        M(i, 4 ) = 60;
        M(i, 5 ) = saveiybegin(i)/250;   %why 250?
        M(i, 6 ) =saveiyend(i)/250;
    end
    
    cd ..
    cd GeneratedMidis
    midiGenerated=matrix2midi(M);
    writemidi(midiGenerated,strcat(GusheName,"_generated.midi"),0);
    
    
end

