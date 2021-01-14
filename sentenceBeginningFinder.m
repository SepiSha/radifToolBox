%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Y_cent1,sentenceBeginning,SentenceBeginningStats] = sentenceBeginningFinder(Y_cent,Y_cent1,hop,X)
global GusheName
myIndex=1;
sentenceBeginning=zeros(size(Y_cent1,1),1);
SentenceBeginningStats=[]

for hopstep=4*hop:-3:hop
    j=1;   
    while j< size(Y_cent1,1)-hopstep
        if (((Y_cent1(j+hopstep)-Y_cent1(j))/hopstep) >8)
            if ( sum(isnan(Y_cent1(j:j+hopstep,1))) >3)
                %error("too many nan")
                j= j+1;
                continue;
            end
      
            newbegin =0;
            if (Y_cent1(j)< 1600)%((4/5)*mean( nonzeros(Y_cent) )))%(mean(Y_cent1)))
                BeginBegin = j;
                BeginEnd = j+hopstep;
                
                for rr=BeginBegin:BeginEnd-4
                    if (Y_cent1(rr+4)<Y_cent1(rr))
                        if ( rr <10 )
                            newbegin = rr;
                        else
                            break
                        end
                    end
                end
                
                BeginEnd=rr+2;

                if (newbegin~=0)
                    BeginBegin=newbegin;
                end
                
                while isnan(Y_cent1(BeginBegin))
                    BeginBegin=BeginBegin+1;
                end
                
                while isnan(Y_cent1(BeginEnd))
                    BeginEnd=BeginEnd-1;
                end

                ll=(Y_cent1(j+hopstep)-Y_cent1(j))/hopstep;
                ppLEN=BeginEnd-BeginBegin;
                sentenceBeginning(BeginBegin:BeginEnd,1)=Y_cent1(BeginBegin:BeginEnd,1);
                
                if (BeginEnd-BeginBegin>20)
                    SentenceBeginningStats(myIndex,:)=[round(Y_cent1(BeginBegin)),round(Y_cent1(BeginEnd)),BeginBegin,BeginEnd,...
                        BeginEnd-BeginBegin,round(Y_cent1(BeginBegin)-Y_cent1(BeginEnd)),...
                        round((Y_cent1(BeginBegin)-Y_cent1(BeginEnd))/(BeginEnd-BeginBegin))];
                    myIndex=myIndex+1;
                end
                
                Y_cent1(BeginBegin:BeginEnd,1)=nan;
                j=j+int32(hopstep)-1;
            end
        end
        j = j+1;
    end
end

% It saves the sentence beginning stats in a file
SbName= strcat(GusheName,'sentences.txt');
fileID = fopen(SbName,'w');
if fileID == -1
    error("Bad file name=%s", SbName);
end
fprintf(fileID, "y1, y2, x1, x2, deltaX, deltaY, m\n");
for qq=1: size(SentenceBeginningStats,1)
    fprintf(fileID, "%d, %d, %d, %d, %d, %d, %d\n", SentenceBeginningStats(qq, :));
end
fprintf(fileID, "%d, %d, %d, %d, %d, %d, %d\n", 0,0,0,0,0,0,0);
fclose(fileID);



