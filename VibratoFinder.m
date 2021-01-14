%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [Y_cent1,Y_vibrato,Y_vibratoAverage,Y_vibratoReduced] = VibratoFinder(X,Y_cent1, hop,reduceEffect)

%%%%%%% Looking for vibratos %%%%%%%

Y_vibrato=zeros(size(Y_cent1,1),1);
Y_vibratoAverage=zeros(size(Y_cent1,1),1);
TempVibrato=zeros(size(Y_cent1,1),1);

for hopstep=5*hop:-1:hop
    j=1;
    while j< size(Y_cent1,1)-hopstep  %1800
        Max=int32(max(Y_cent1(j:j+hopstep,1)));
        Min=int32(min(Y_cent1(j:j+hopstep,1)));
        intDiff = uint16 (Max - Min);
        if ( sum(isnan(Y_cent1(j:j+hopstep,1))) >3)
            j= j+1;
            continue;
        end
        
        if ((30<(intDiff)) && ((intDiff)<150))
            
            vibratoBegin = j;
            vibratoEnd = j+hopstep;
            M1= int32(mean(Y_cent1(vibratoBegin:vibratoEnd,1)));
            S1=std(Y_cent1(vibratoBegin:vibratoEnd,1));
            
            items=0;
            M=0;
            for p=vibratoBegin:vibratoEnd
                if (  ~isnan(Y_cent1(p)))
                    items = items + 1;
                    M= M +Y_cent1(p);
                end
            end
            M = M/items;
            
            items2=0;
            S=0;
            for p=vibratoBegin:vibratoEnd
                if (  ~isnan(Y_cent1(p)))
                    items2 = items2 + 1;
                    S= S +((Y_cent1(p)-M))^2;
                end
            end
            
            S=sqrt(S/(items2-1));
            
            while ( abs(Y_cent1(vibratoBegin)-M) > 2*S)
                vibratoBegin = vibratoBegin +1;
            end
            while ( abs(Y_cent1(vibratoEnd)-M) > 2*S)
                vibratoEnd = vibratoEnd -1;
            end
            M= int32(mean(Y_cent1(vibratoBegin:vibratoEnd,1)));
            items=0;
            M=0;
            for p=vibratoBegin:vibratoEnd
                if (  ~isnan(Y_cent1(p)))
                    items = items + 1;
                    M= M +Y_cent1(p);
                end
            end
            M = int32(M/items);
            
            
            %S=std(Y_cent1(vibratoBegin:vibratoEnd,1));
            
            
            TempVibrato(vibratoBegin:vibratoEnd,1)=Y_cent1(vibratoBegin:vibratoEnd,1);
            
            
            
            [Y_vibratoSmooth] = CurveSmoother(TempVibrato,3,vibratoBegin,vibratoEnd);
            [maxima,maxlocs] = findpeaks(Y_vibratoSmooth(vibratoBegin:vibratoEnd,1));
            maximaDiff=diff(maxima);
            absmaxDiff=abs(max(maximaDiff));
            
            AbsMax=max(maxima);
            VibratoInverse=-Y_vibratoSmooth;
            [minimaInverse,minlocs] = findpeaks(VibratoInverse(vibratoBegin:vibratoEnd,1));
            minima=-minimaInverse;
            minimaDiff=diff(minima);
            AbsMin=min(minima);
            absminDiff=abs(max(minimaDiff));
            
            
            for l=1:size(maxlocs,1)-1
                %fprintf("wave length %d \n",maxlocs(l+1)-maxlocs(l));
                %fprintf("Real wave length (ms) %.3f \n", (X(vibratoBegin+maxlocs(l+1))-X(vibratoBegin+maxlocs(l))))
            end
            
            vibratoLength=X(vibratoEnd)-X(vibratoBegin);
            vibratoLengthDots=vibratoEnd-vibratoBegin;
            %vibrato average length is not accurate because it includes
            %partial periods.
            vibratoAveWaveLength=(vibratoLength*2)/(size(maxlocs,1)+size(minlocs,1));
            vibratoAveWaveLengthDots=(vibratoLengthDots*2)/(size(maxlocs,1)+size(minlocs,1));
            %fprintf("Vibrato Length= %.2f Ave. wave length= %.2f Hz= %.2f \n", vibratoLength, vibratoAveWaveLength, 1/vibratoAveWaveLength)
            
            
            sumofDifference=0;
            for i=1:min(size(maxima,1),size(minima,1))
                %fprintf("maxima-minima(i) %.4f \n", abs(maxima(i)-minima(i)));
                sumofDifference=sumofDifference+abs(maxima(i)-minima(i));
            end
            sumofDifference=sumofDifference/(min(size(maxima,1),size(minima,1)));
            
            if sumofDifference>20
                
                Y_vibrato(vibratoBegin:vibratoEnd,1)=TempVibrato(vibratoBegin:vibratoEnd,1);
                
                %{
                %%%%Test
                t = (vibratoBegin:vibratoEnd)' ;% -vibratoBegin+1
                yhat2=zeros(size(t,1));
                size(t)
                fo = fitoptions('Method','NonlinearLeastSquares',...
                    'Normalize', 'on',...
                    'DiffMinChange',  0,...
                    'TolFun', 0, ...
                    'TolX', 0,...
                    'Display', 'iter',...
                    'MaxFunEvals', 60000,...
                    'MaxIter', 4000,'StartPoint',[1000, .3 ,30, .3]);
                
                
                ft = fittype('a+b*sin(c*x)+d*cos(c*x)','options',fo); %,'problem','n','options',fo);
                sf=fit(t,Y_vibrato(       vibratoBegin:vibratoEnd,1),ft); %, 'cubicinterp')
                
                fprintf("sizes= %d, %d, %d\n", size(sf,2), size(t,1), size(Y_vibrato,1) );
                sf
                plot(sf,t,Y_vibrato(       vibratoBegin:vibratoEnd,1) )%, t, Y_vibrato(       vibratoBegin:vibratoEnd,1));
                title("our fitted curve");
                error("Teeeeeeeeest")
                %}
                
                % y =  Y_vibrato(       vibratoBegin:vibratoEnd,1);
                yhat=[];
                y = Y_vibrato( vibratoBegin:vibratoEnd,1)-double(M);
                y = y(:);
                t = (vibratoBegin:vibratoEnd)'  -vibratoBegin+1;
                
                %beta = XX\y
                %beta=regress(y,XX)
                b = [0.2 -10.1 -.2 25];
                modelfun = @(b,t)b(1) + b(2)*cos(double(((2*pi*t)/b(4)))) + ...
                    b(3)*sin(double(((2*pi*t)/b(4))));%+b(4)*cos(double(t.^2))+b(5)*sin(double(t.^2))+...
                %modelfun = @(b,t)b(1) + b(2)*cos(double(((2*pi*t)/vibratoAveWaveLengthDots))) + ...
                %b(3)*sin(double(((2*pi*t)/vibratoAveWaveLengthDots)));%+b(4)*cos(double(t.^2))+b(5)*sin(double(t.^2))+...
                %b(6)*cos(double(t.^3))+b(7)*sin(double(t.^3))
                %b(1) + b(2)*cos(double((2*pi*t)/(2*vibratoAveWaveLength))) + ...
                %b(3)*sin(double((2*pi*t)/(2*vibratoAveWaveLength)))
                opts = statset('Display','iter','TolFun',1e-6,'TolX',1e-6, 'MaxIter', 30000);
                %opts = statset( 'MaxIter', 7000);
                mdl = fitnlm(t,y,modelfun,b, 'Options',opts);
                b = mdl.Coefficients{:, 'Estimate'};
                r1= mdl.RMSE;
                r2= mdl.Rsquared.Ordinary;
                r3= mdl.Rsquared.Adjusted;
                r4= mdl.MSE;
                r5= mdl.SSE/vibratoLengthDots;
                
                errstr=sprintf("%.2f +++++ %.2f +++++ %.2f +++ %.2f \n", b(1), b(2) , b(3),b(4));
                
                yhat2=[];
                t1=[];
                t2=[];
                yhat1=[];
                twopart ="One part";
                if (r3<0.4)
                    middle=vibratoBegin+round((vibratoEnd-vibratoBegin)/2);
                    t1 = (vibratoBegin:middle)' -vibratoBegin+1;
                    y1 =  Y_vibrato( vibratoBegin:middle,1)-double(M);
                    y1 = y1(:);
                    
                    b1 = [.7 -10.1 -.2 25];
                    modelfuna = @(b1,t1)b1(1) + b1(2)*cos(double(((2*pi*t1)/b1(4)))) + ...
                        b1(3)*sin(double(((2*pi*t1)/b1(4))));
                    %fprintf("size t1, y1 %d  %d \n", size(t1,1), size(y1,1) );
                    %opts = statset('Display','iter','TolFun',1e-10);
                    %opts = statset('Display','iter','TolFun',1e-10, 'MaxIter', 5000);
                    
                    mdl = fitnlm(t1,y1,modelfuna,b1, 'Options',opts);
                    %error("Tesssssssst")
                    
                    b1 = mdl.Coefficients{:, 'Estimate'};
                    
                    r1a= mdl.RMSE;
                    r2a= mdl.Rsquared.Ordinary;
                    r3a= mdl.Rsquared.Adjusted;
                    r4a= mdl.MSE;
                    r5a= mdl.SSE/vibratoLengthDots;
                    
                    %errstr=sprintf("%.2f +++++ %.2f +++++ %.2f +++ %.2f --- %.2f\n", r1a, r2a , r3a, r4a,r5a);
                    
                    yhat1 = b1(1)+...
                        b1(2)*cos( double(((2*pi*t1)/b1(4))))+...
                        b1(3)*sin( double(((2*pi*t1)/b1(4))));
                    
                    
                    t2 = (middle+1:vibratoEnd)' -vibratoBegin+1;
                    y2 =  Y_vibrato(middle+1:vibratoEnd,1)-double(M);
                    y2 = y2(:);
                    
                    b2 = [0.7 -10.1 -.2 25];
                    modelfunb = @(b2,t2)b2(1) + b2(2)*cos(double(((2*pi*t2)/b2(4)))) + ...
                        b2(3)*sin(double(((2*pi*t2)/b2(4))));
                    
                    
                    %opts = statset('Display','iter','TolFun',1e-10, 'MaxIter', 4000);
                    
                    mdl = fitnlm(t2,y2,modelfunb,b2, 'Options',opts);
                    mdl.Iterative.IterOpts;
                    mdl.ObservationInfo;
                    b2 = mdl.Coefficients{:, 'Estimate'};
                    
                    r1b= mdl.RMSE;
                    r2b= mdl.Rsquared.Ordinary;
                    r3b= mdl.Rsquared.Adjusted;
                    r4b= mdl.MSE;
                    r5b= mdl.SSE/vibratoLengthDots;
                    
                    
                    yhat2 = b2(1)+...
                        b2(2)*cos( double(((2*pi*t2)/b2(4))))+...
                        b2(3)*sin( double(((2*pi*t2)/b2(4))));
                    
                    if (r3a>0.4) && (r3b>0.4)
                        twopart=sprintf("twoPartOK,  %.2f - %.2f freq  %.2f - %.2f", r3a, r3b,b1(4), b2(4));
                    else
                        twopart=sprintf("twoPartBAD, %.2f - %.2f freq  %.2f - %.2f", r3a, r3b,b1(4), b2(4));
                        
                    end
                    
                    
                end
                
                yhat = b(1)+...
                    b(2)*cos( double(((2*pi*t)/b(4))))+...
                    b(3)*sin( double(((2*pi*t)/b(4))));%+b(4)*cos(double(t.^2))+b(5)*sin(double(t.^2))+...
                %     b(2)*cos( double(((2*pi*t)/vibratoAveWaveLengthDots)))+...
                %     b(3)*sin( double(((2*pi*t)/vibratoAveWaveLengthDots)));%+b(4)*cos(double(t.^2))+b(5)*sin(double(t.^2))+...
                %b(6)*cos(double(t.^3))+b(7)*sin(double(t.^3));
                
                
                figure;
                plot(t,y,'b');
                hold on
                plot(t,yhat,'r','linewidth',2);
                hold on
                plot(t1,yhat1,'cyan','linewidth',2);
                hold on
                plot(t2,yhat2,'color',[0.8500, 0.3250, 0.1980],'linewidth',2);
                title("Vibrato Estimation")
                %str = sprintf("waveLen= %.2f    %.2f --%s @@ %s", vibratoAveWaveLength, vibratoAveWaveLengthDots, errstr,twopart);
                %title(str);
                
                %{
                {New Test
                yu = max(y);
                yl = min(y);
                yr = (yu-yl);                               % Range of ?y?
                yz = y-yu+(yr/2);
                %zx = XX(yz .* circshift(yz,[0 1]) <= 0);     % Find zero-crossings
                
                
                
                %per = 2*mean(diff(zx));                     % Estimate period
                ym = mean(y);                               % Estimate offset
                fit = @(b,XX)  b(1).*(sin(2*pi*t./b(2) + 2*pi/b(3))) + b(4);    % Function to fit
                fcn = @(b) sum((fit(b,t) - y).^2);                              % Least-Squares cost function
                s = fminsearch(fcn, [yr;  vibratoAveWaveLength;  -1;  ym])                       % Minimise Least-Squares
                xp = linspace(min(t),max(t));
                figure(1)
                plot(t,y,'b',  xp,fit(s,xp), 'r')
                grid
                %%End New Test
                %}
                Y_vibratoAverage(vibratoBegin:vibratoEnd,1)= int32(M);
                if ( Y_vibratoAverage(vibratoEnd,1) ~= M) || (M==0)
                    error("VibratoFinder:.......................vibrato ERRoR M");
                end
                
                
                Y_cent1(vibratoBegin:vibratoEnd,1)= nan;
                
            else
                j=j+1;
                continue
            end
            
            j=j+int32(hopstep)-1;
        end
        j = j+1;
    end
end
Y_vibratoReduced=Y_vibrato;
if (reduceEffect==true)
    Y_vibratoReduced(Y_vibratoReduced ~= 0) = int32((Y_vibratoReduced(Y_vibratoReduced ~= 0)...
        +3*Y_vibratoAverage(Y_vibratoReduced ~= 0))/4);
end


figure;
plot(Y_vibrato)
hold on
plot(Y_vibratoReduced, 'color','red')
title("Vibrato")
end