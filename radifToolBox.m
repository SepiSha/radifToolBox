
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Analysis of vocal performance for radif, with alignment of audio and MIDI

clc
clear variables;
variables % the note name variables that are in the file variables.m
global flags;
global segFigure;
global SMsize;
global X;
global ax1;         %from dtw
global ax2;         %from dtw
global GusheName;   % to pass to dtw-plot
global GusheNameSimple;   % to pass to dtw-plot
global corrections  %flog for drawing the upper dtw plot and is used in dtwplot.m

segFigure=0;
SMsize=0;

DOTAHRIR=false; %  flag - when true finds and visualizes tahrirs
DOVOCALTECHNIQUES=false; % flag - when true, finds vibrato, solid notes, sentence beginning spikes
DOPITCHDRIFT=false; % flag - when true, measures pitch drift
WidthHist = 1100;

cd ~/Desktop/RadifAnalysis/AllMidis
list=ls('./*.mid*');
currentFileNameStr=split(list, './');

for i = 1:size(currentFileNameStr,1)
    if( size(char(currentFileNameStr ( i))) <5)
        continue;
    end
    str1 = regexprep(currentFileNameStr ( i),'[,;=_]', ' ');
    str2 = regexprep(str1,'[^- 0-9.(,)/]','');
    str3 = split(str2);
    numString= string(char(str3(6)));  % D8_G63_M1_A1_T1_pitch_5 for example
    pieceNums(i) = str2num(numString);
end
[pieceNums,sortIdx] = sort(pieceNums,'descend');
currentFileNameStr = currentFileNameStr(sortIdx);

numFiles=length(currentFileNameStr);

Sb=[];
NumSkippedFiles=0;
notesUsed = zeros(1,68);

for FileNumber = 1: numFiles
 
    if (length(char(currentFileNameStr(FileNumber)))<2)
        fprintf("Skipping FileNumber %d \n", FileNumber);
        NumSkippedFiles = NumSkippedFiles +1;
        continue
    end
    close all
    
    PitchFileName(1) = ["placeHolder"];
    [data, energydata,MidiData,fs,PF]=openFiles(currentFileNameStr, FileNumber);
    PitchFileName(FileNumber) =PF;
    
    % energy of the sound wave:to plot the energy level of the voice
    [XE,YE] = readEnergyTimeDomain(energydata);
    
    % read and process frequency of the audio wave
    [X,Y_centOriginal] = readPitchTimeDomain(data);
    
    if (size( Y_centOriginal(Y_centOriginal <0 ),1)>20)
        error("too many negative frequencies");
    end
    
    Y_centOriginal(Y_centOriginal <0 ) = 0;  % In case smoothed pitch track gives negative cents- below 55 hz!
    [Y_centExtrapolated] = extrapolateZeros( Y_centOriginal);
    
    Y_tmp= Y_centExtrapolated;
    [Y_centExtrapolated] = octaveCorrections(Y_centExtrapolated,PitchFileName(FileNumber));% octave corrections, special cases
    % sometimes, extrapolate zeros does not connect two parts because their
    % Y_Cent are far a part but after octave corrections they become
    % similar. So, another extrapolateZero might help in some cases.
    
    %[Y_centExtrapolated] = extrapolateZeros( Y_centExtrapolated);
    
    % Plays the synthesized music
    %playsound(fs,X,Y_centOriginal);
    
    [YE2,yy,Y_high_mean,ELevel1,ELevel2,ELevel3,Y_low,Y_high,Y_high1,Y_high2,ax_E]=...
        energyAnalyzer(YE,Y_centOriginal,Y_centExtrapolated,Y_tmp);
    
    [MidiData,MidiComparisonArray,midiShahed,midiHisto,scaleFactor] = midiFormatAudioScale(MidiData,size(Y_centOriginal,1));
    
    if size(midiShahed,1) ~=1 || size( midiShahed,2)~= 1
        size(midiShahed)
        error("Check midiShahed!");
    end
    
    lastHistoElement = find(midiHisto, 1, 'last');
    midiHisto = midiHisto(1:(lastHistoElement+3));
    
    MidiHistocomplete=midiHisto;
    total= sum(midiHisto);
    %midiHisto( midiHisto < (total/50)) = 0; %To see the notes that appear at least 2% of the total duration
    
    %% SEGMENTATIONS: The segmentation tests
    %[segmentBoundriesMFCC]  = SegmentationMFCC   (Y_centOriginal)%PitchFileName(FileNumber) )
    %[segmentBoundriesPitch] = SegmentationPitch(X,Y_centOriginal)
    %[segmentSilence]        = SegmentationSilence(Y_centOriginal,50); % finds the beginning and end of the silences
    
    %%  Audio histogram and intervals
    % We use histogram to find the intervals between the main notes of a
    % gushe in performance
    
    Y_centNan= Y_centOriginal;
    Y_centNan(Y_centNan ==0 ) = nan;
    [histogramSmooth, histoStart, histoEnd,Y_centHisto] = histofinder(Y_centExtrapolated);
    
    while(Y_centHisto(histoStart) <3) %get rid of noise at the begining and end
        Y_centHisto(histoStart)=0;
        histoStart=histoStart+1;
    end
    while(Y_centHisto(histoEnd) <3)
        Y_centHisto(histoEnd)=0;
        histoEnd=histoEnd-1;
    end
    
    figure; ax_histo=axes();
    plot(Y_centHisto); xlim([histoStart-10 histoEnd+10]); pbaspect([5 1 1]);  % (4) aspect ratio of the plot
    title({"histogram and upper envelope of", GusheNameSimple},  'interpreter', 'none');
    
    figure; ax_histoSmooth=axes();
    plot(histogramSmooth); xlim(ax_histoSmooth, [histoStart-10 histoEnd+10]); %pbaspect([4 1 1]);
    title({ "Smooth histogram of", GusheNameSimple}, 'interpreter', 'none');
    
    [histoUpperEnv,histoLowerEnv]=envelope(histogramSmooth,30,'peak');
    %% here we find the note name of each of the main peaks of histogram
    trimmedHistoEnv = histoUpperEnv;
    trimmedHistoEnv(1:histoStart)=0;
    trimmedHistoEnv(histoEnd:end)=0;
    axes(ax_histo);
    hold on;
    plot(ax_histo, trimmedHistoEnv, 'color', 'red'); xlim(ax_histo, [histoStart-10 histoEnd+10]);
    
    histoUpperEnv (1:histoStart ) = 0;
    [UpperEnvmaxima,UpperEnvmaxlocs] = findpeaks(histoUpperEnv);
    [histoSmoothmaxima,histoSmoothmaxlocs] = findpeaks(histogramSmooth,'minpeakProminence', 3,...
        'MinPeakDistance', 18, 'MINPEAKHEIGHT',max(  max(UpperEnvmaxima/18),3  ));%15,5
    
    if ( ~exist("histoSmoothmaxlocs") )
        error( "no max locs");
    end
    
    [histoSmoothmaxima,histoSmoothmaxlocs]=manualModifications(histoSmoothmaxima,histoSmoothmaxlocs);
    
    [Mdummy,I]=max(histoSmoothmaxima);
    % reference to Shahed should be changed?
    
    for kk=1:length(histoSmoothmaxlocs)
        indexfromShahed=midiShahed+round((histoSmoothmaxlocs(kk)-histoSmoothmaxlocs(I))/50); % every 50 cents is 1/4 tone
        indexfromShahed = mod(indexfromShahed, 24)+1;  %array index starts from one
    end
    
    derivative= -histogramSmooth(histoStart:histoEnd-15) + histogramSmooth(histoStart+15:histoEnd);
    figure;
    plot([histoStart:histoEnd], histogramSmooth(histoStart:histoEnd));
    hold on
    plot([histoStart:histoEnd],histoUpperEnv(histoStart:histoEnd));
    hold on
    plot ( [histoStart+7:histoEnd-15+7], derivative );
    hold on
    plot([histoStart+15:histoEnd], derivative-derivative );
    title({'Histogram of Y smoothed+envelop          >',PitchFileName(FileNumber)}, 'interpreter', 'none')
    
    
    % change the name for findNoteRange
    [audioShahed,audioShahedSpare,histoSmoothmaxlocs] = findNoteRange(histogramSmooth,0, derivative, ...
        histoSmoothmaxima, histoSmoothmaxlocs,histoStart); % derivative should move to findNoteRange
    
    [histoSmoothmaxima,histoSmoothmaxlocs,audioShahed,audioShahedSpare]=secondManualModifications(histoSmoothmaxima,histoSmoothmaxlocs,audioShahed,audioShahedSpare);
    
    
    Y_audioShahed=[];
    Y_audioShahed(1:size(Y_centNan,1))=audioShahed; %% Y_shahed is used to draw a line... so an array is needed!
    [Y_centNan,sentenceBeginning,SentenceBeginningStats] = sentenceBeginningFinder(Y_centOriginal,Y_centNan,38,X);
    
    Sb = [Sb ;SentenceBeginningStats];
    
    %% plot the horizontal lines corresponding to the main notes on the melody line
    % We can see the melody line in seconds, and without DTW additions
    figure; set(gca,'xticklabel',X);    xtickformat('%.1f');  xtickangle(70);
    
    for mm=1:size(histoSmoothmaxlocs)
        plot([0 X(size(X,2))],[histoSmoothmaxlocs(mm);histoSmoothmaxlocs(mm)], 'Marker','.','Color', 'r');
        hold on
    end
    plot(X,Y_centOriginal);  title(strcat('F0 Frequency & main notes-', GusheName),  'interpreter', 'none');
    fprintf(" radifToolBox-time1:---- date=%d %d %d  hr=%d min=%d  sec=%f  \n", clock);
    
    
    midiHBegin=1; % find the beginning and end of midi histogram
    midiHEnd=size(midiHisto,1);
    while midiHisto(midiHBegin) == 0
        midiHBegin = midiHBegin + 1;
    end
    while midiHisto(midiHEnd) == 0
        midiHEnd = midiHEnd - 1;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plots the bar histogram of midi in uniform x-axis with the note lables
    midiHisto(size(midiHisto,1): 300) = 0; %extend the midiHisto for uniform printing purposes
    figA=figure;
    bar (midiHisto (72+24+1:72+4*24-4))%(86+24:150+24)) % to make it more uniform:     86-150
    %title( sprintf(" begin=%d  end=%d, %s\n", midiHBegin,  midiHEnd, GusheName ),  'interpreter', 'none');
    title( sprintf("MIDI histogram: %s", GusheNameSimple ),  'interpreter', 'none');
    MhistoName= sprintf("histo_%s.jpeg", GusheName);
    set(figA,'units','points','position',      [100,100,1300,1000]);
    set(figA,'units','points','OuterPosition', [286,315, WidthHist, 300]);   % printM_
    xticks(0:68) % Do-SiB
    NoteFigureHistoMidi= NoteNamesFigure; %[NoteNamesFigure(14:end),NoteNamesFigure(1:13)];
    xticklabels(NoteFigureHistoMidi)%,'FontSize',10);
    set(gca, 'fontsize', 6)
    print(figA,strcat("printM_", MhistoName) ,'-djpeg','-r600','-noui')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [MidiPointsCent,midiHistoPracticeCent,midiHistoVaziriCent,resid, audioShahed]=CreateMidiFreq(MidiComparisonArray,midiHisto,midiShahed,audioShahed,audioShahedSpare,Y_centExtrapolated,histoSmoothmaxlocs);
    midiHistoPracticeCentFull = midiHistoPracticeCent;
    midiHistoPracticeCentFull (MidiHistocomplete ==0 ) = 0 ;
    if size( MidiHistocomplete,1) < size( midiHistoPracticeCentFull,1)
        midiHistoPracticeCentFull(size( MidiHistocomplete,1)+1: end) = 0
    end
    
    midiHistoPracticeCent(midiHisto==0) = 0;
    [vaziriTicks,vaziriCents] = CreateVaziriTicks(midiHBegin,midiHEnd,midiHistoVaziriCent);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Vocal Techniques Detection
    if DOVOCALTECHNIQUES
        tic
        [Y_centNan,Y_vibrato, Y_vibratoAverage] = VibratoFinder(X,Y_centNan, 80,false);
        toc
        [Y1_solidAverage, Y2_solidnotesOriginal,Y_centNan] = solidNotes(Y_centNan, 35);
        %Y1_solidAverage=0
        toc
        [Y_centNan,sentenceBeginning] = sentenceBeginningFinder(Y_centExtrapolated,Y_centNan,38,X);
        toc
        [Y_centNan,Y_spike,Y_spike1, linesFound,Y_smooth] = SpikeFinder(Y_centNan,Y_centExtrapolated, 5, 80, 60);
        toc
        [silencesFound] = silenceFinder(X,Y_centExtrapolated);
        toc
    end
    
    %playsound(fs,X,MidiPointsCent');
    %audiowrite("sinusSound.wav",MidiPointsCent,round(fs/(512*4)))
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Alignment
    
    MidiPointsCent(MidiPointsCent==0) =  MidiPointsCent(MidiPointsCent==0)  +40;  % just to make it more visible in plot --do not delete
    [dist,ixMidi,iyAudio]= dtw(MidiPointsCent, Y_centExtrapolated );
    figureDTW=figure;
    %dtw(MidiPointsCent, Y_centExtrapolated ); %'euclidean', 'absolute', 'squared', or 'symmkl'
    MidiAudioAlignment(MidiPointsCent, Y_centExtrapolated, ixMidi, iyAudio, dist, 'euclidean')
    fprintf(" thesis-time2:after dtw2 ---- %d %d %d     time=%d %d %f \n", clock);
    hold on % draw lines of scale/gamme
    
    %%Draws the audio pitch for each Midi note consecutively and the histogram for each note --AdminOnly
    %pitchperMidiNote(MidiPointsCent,ix,iy,Y_centExtrapolated)
    
    % This function visualizes Energy Levels on DTW plot
    visualizeEnergy(ixMidi,iyAudio,YE,YE2,yy,Y_high_mean,ELevel1,ELevel2,ELevel3,Y_low,Y_high,Y_high1,Y_high2);
    
    midiNotesSetCents = midiHistoPracticeCent( midiHistoPracticeCent~= 0) ;
    midiNotesSetCentsFull = midiHistoPracticeCentFull( midiHistoPracticeCentFull~= 0) ;
    modifyDtwPlot(ixMidi,histoSmoothmaxlocs,audioShahed,midiShahed,NoteNamesFigure,...
        MidiComparisonArray,midiHistoPracticeCent,resid,NoteNamesFigure2,midiNotesSetCents );
    
    ndx=1;
    for iiii= 1: size(midiHistoPracticeCent,1)  %midiNotesSet is parallel to midiNotesSetCents showing midi note numbers e.g. 124
        if ( midiHistoPracticeCent(iiii) ~=0 )
            midiNotesSet(ndx) = iiii;
            ndx = ndx + 1;
        end
    end
    
    for nn= 1:size( midiNotesSetCents)
        temp=mod(midiNotesSet(nn), 96)+1;
        if (temp == 0)
            temp = 96;
        end
        
        namestr= NoteNamesFigure(temp  );
        axes(ax_histo);
        histomax= max(Y_centHisto);
        text(ax_histo, midiNotesSetCents(nn),(round(histomax*0.5)),namestr, 'FontSize', 10);
        axes(ax_histoSmooth);
        text(midiNotesSetCents(nn)-25,(round(histomax*0.5)),namestr, 'FontSize', 10);
        if (nn ~= size( midiNotesSetCents, 1))
            interval= round(midiNotesSetCents(nn+1) - midiNotesSetCents(nn)); %why some midiNotesSetCents are not integers?
            intrvlStr= sprintf("%d", interval);
            text(midiNotesSetCents(nn) +40 ,(round(histomax*0.4)),intrvlStr, 'FontSize', 10);
        end
        hold on;
        plot(ax_histoSmooth, [midiNotesSetCents(nn) midiNotesSetCents(nn)],[1 ;(round(histomax*0.4))],...
            'Marker','.','Color', [.4 .4 .2], 'LineWidth', 0.5, 'LineStyle', '--');
    end
    
    
    %{
      for nn= 1:size( audioHistoGood, 2)
       
        hold on;
        axes(ax_histoSmooth);
        fprintf("audioHistoGood Loop %d\n", nn);
        plot(ax_histoSmooth, [audioHistoGood(nn) audioHistoGood(nn)],[1 ;(round(histomax*0.4))],...
               'Marker','.','Color', [.4 .9 .2], 'LineWidth', 0.5, 'LineStyle', '--');
      end
    %}
    
    for nn= midiHBegin-4:midiHEnd
        hold on;
        if ( nn == midiShahed)
            plot(ax_histoSmooth, [vaziriCents(nn) vaziriCents(nn)], [0 vaziriTicks(nn)*round(histomax*0.02)], 'Marker','.','MarkerSize',0.5,'Color', [.8 .0 .0], 'LineWidth', 3.0, 'LineStyle', '-');
        else
            plot(ax_histoSmooth, [vaziriCents(nn) vaziriCents(nn)], [0 vaziriTicks(nn)*round(histomax*0.02)], 'Marker','.','MarkerSize',0.5,'Color', [.8 .0 .0], 'LineWidth', 1.0, 'LineStyle', '-');
        end
    end
    axes(ax1); %ax1 is first subplot of DTW
    set(figureDTW,'units','points','position',[100,100,1300,1000]);
    seggraph=splitPlot(Y_centExtrapolated, MidiPointsCent, iyAudio,ixMidi, figureDTW, GusheName); %ix, iy mixed up, need cleaning
    hold off
    
    axes(ax_E);
    for i=1:size(midiNotesSetCents)
        plot(ax_E, [midiNotesSetCents(i),midiNotesSetCents(i)], [0 .35], 'Marker','.','Color', 'k');
        hold on
    end
    histoName= sprintf("histo_%s.jpeg", GusheName);
    f=get(ax_histoSmooth, 'Parent');
    set(f,'units','points','position',[100,100,1300,1000],'OuterPosition', [286,315, WidthHist, 300]);
    print(f,strcat("print_", histoName) ,'-djpeg','-r600','-noui');
    
    [twoDot,oneDot,noDot,saveiybegin,saveiyend,saveixbegin,saveixend]= printNotes(MidiData, ixMidi, iyAudio,Y_centOriginal,MidiPointsCent, scaleFactor, fs); % generates DoReMi files
    
    cd ../DataMidi
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Pitch Drift
    if DOPITCHDRIFT
        pitchDrift(Y_centExtrapolated,  GusheName, WidthHist, histoStart-10, histoEnd+10,seggraph, ixMidi, iyAudio,midiNotesSetCents,midiNotesSet,Y_centHisto); %ix, iy mixed up, need cleaning
    end
    
    
    % take the audio sentences and make a table of corresponding MIDI
    % segments and print them.
    nt = midiSentenceSeg(seggraph, ixMidi, iyAudio,MidiPointsCent, MidiComparisonArray, WidthHist);
    
    notesUsed(FileNumber -NumSkippedFiles, 1:size(nt,2)) = nt;
    DastgahShahed(FileNumber -NumSkippedFiles) = midiShahed-72-24;
    DastgahIst(FileNumber -NumSkippedFiles) = MidiData(end,1)-72-24;
    
    DastgaahGusheName ( FileNumber -NumSkippedFiles) = GusheName;
    printSingleNoteHisto(Y_centExtrapolated, MidiPointsCent, midiNotesSetCentsFull,ixMidi, iyAudio, WidthHist , histoStart-10, histoEnd+10 );
    

    % This function visualizes tahrirs on DTW plot
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% PVisualize Tahrir and Other Vocal Techniques
    if DOTAHRIR
        [Y_centNan,Y_tahrir, linesFound,Y_tahrir_del,doubleTahrir,tahrirIslands,maxlocsTahrir] = ...
            tahrirFinder(X,Y_centNan,Y_centExtrapolated,MidiPointsCent, 3, 50, 110, saveixbegin, saveixend, saveiybegin, saveiyend, ixMidi,iyAudio, MidiPointsCent,Y_centExtrapolated);
        visualizetahrirs(Y_tahrir,iyAudio,doubleTahrir,Y_tahrir_del);
    end
    %%Add error checking:
    for tt=1:size(MidiComparisonArray,2)
        if (MidiComparisonArray(tt)~=0)
            MidiPointsCent(tt)=(MidiComparisonArray(tt)-midiShahed)*50+audioShahed;
            if ( MidiPointsCent(tt) <1 ) || (MidiPointsCent(tt) >4200)
                error("thesis: bad MidiFreq %d", MidiPointsCent(tt));
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    MeanatEnd=mean(Y_centOriginal);
    MeanatEnd2=mean(Y_centExtrapolated);
    GnrteThryfrmPrctce(MidiData,midiShahed,audioShahed,MidiHistocomplete)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (DOVOCALTECHNIQUES && DOTAHRIR)
        plotGenerator(Y_tahrir,Y_centExtrapolated,X,Y_audioShahed,...
            Y1_solidAverage,Y_vibrato,...
            Y_smooth,Y_spike,Y_spike1, PitchFileName(FileNumber))
    end
end  % end of the loop of all gushes!

%This function visualizes the ranges of all gushes in a dastgah and marks
%the shahed of each
visualizeDastgaahRange(notesUsed,DastgahShahed,DastgaahGusheName, WidthHist)
