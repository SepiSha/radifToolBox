%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [yhat,fittedPeak] = GaussianPeakFit(NewRangeBegin,NewRangeEnd,i,z,histogramSmooth, rangeBegin, rangeEnd, ...
    histoSmoothmaxlocs,histoStart,derivative,peakh,histoSmoothmaxima)
global GusheName;


t=(rangeBegin:rangeEnd)'  +1;
tNew=(NewRangeBegin:NewRangeEnd)'+1;
y=[];
y=histogramSmooth(rangeBegin:rangeEnd);
yNew=histogramSmooth(NewRangeBegin:NewRangeEnd)

peakwidth=size(y(y>peakh));  % seems that you do not need this... and the argument, and....

t1=histoStart:size(histogramSmooth);
t1=t1(1:size(derivative,1));


Fig=figure;
subplot(2,1,1);
if ( size( y,1) > size (yNew, 1) )
    plot(t, y, 'color', 'red', 'marker', '.');     %, 'marker', 'o'
    hold on
    plot(tNew, yNew, 'color', 'g', 'marker', '.'); %, 'marker', '*'
else
    plot(tNew, yNew, 'color', 'g', 'marker', '.'); %, 'marker', '*'
    hold on
    plot(t, y, 'color', 'red' , 'marker', '.');    %, 'marker', 'o'
    
end
hold on
plot ( histogramSmooth, 'color', 'blue');
hold on
plot(t1,derivative, 'color','k');
strstr= sprintf("histo: <%d- %d>   %s     range:%d, - %d", z,i, GusheName, rangeBegin,  rangeEnd );
xlim([1000 4000])
title(strstr);
hold off

areaunder=sum(histogramSmooth(rangeBegin:rangeEnd));
fprintf("GaussianPeakFit: area under :%0.2f \n", areaunder)

b = [-2000 .01 300 histoSmoothmaxlocs(i) 8000]; 
modelfun = @(b,t)b(1) + b(2)*t + b(3)*exp(-(t-b(4)).^2/(b(5)));

%opts = statset('Display','iter','TolFun',1e-10, 'MaxIter', 10000);
%opts = statset('TolFun',1e-10, 'MaxIter', 10000);

opts = optimoptions('lsqcurvefit', 'MaxFunctionEvaluations', 550000, 'MaxIterations', 550000,...
    'FunctionTolerance', 1.0000e-06, 'OptimalityTolerance', 1.0000e-06,'StepTolerance', 1.0000e-06)
lb = [];
ub = [];
[x,resnorm,~,exitflag,output] = lsqcurvefit(modelfun,b,t,y, lb,ub,opts);%%% why resnorm doesnt work?
%mdl = fitnlm(t,y,modelfun,b,'Options',opts);
%b = mdl.Coefficients{:, 'Estimate'}

%     1  LSQCURVEFIT converged to a solution.
%     2  Change in X too small.
%     3  Change in RESNORM too small.
%     4  Computed search direction too small.
%     0  Too many function evaluations or iterations.
%    -1  Stopped by output/plot function.
%    -2  Bounds are inconsistent.
fprintf("GaussianPeakFit: exitflag=%d\n", exitflag);
if ( exitflag == 1 )
    fprintf("Gaussian peak fit: ****resnorm good****: %f\n", resnorm);
elseif ( exitflag == 3 )
    fprintf("Gaussian peak fit: resnorm not changing: %f\n", resnorm);
elseif ( exitflag == 2 )
    fprintf("Gaussian peak fit: Change in X too small. but going on...");
elseif ( exitflag == 0 )
    %D12_G3 was crashing here, but not any more... D12_G13
    %error("Gaussian peak fit: iterations not enough for min error: %s", GusheName);
else
    error("Gaussian peak fit: iterations?,exitflag=%d ",exitflag)
end
b=x;


yhat = b(1) + b(2)*t + ...
    b(3)*exp(-(t - b(4)).^2/(b(5)));%+b(6) * exp(-(t - b(7)).^2/b(8));

if ( size(yhat, 1) < 3 )
    error("this is strange\n");
    
end

[ahat, bhat]=findpeaks(yhat);
err=(sum((yhat-y).^2))/size(yhat,1);
err2=0;

if (err>500 || size(ahat,1)==0 || ( exitflag == 0 ))
    
    if (   (histoSmoothmaxima(i)-histogramSmooth(rangeBegin,1)>80) && ...
            (rangeEnd-rangeBegin>80))
        
        rangeBegin=rangeBegin+15;
        rangeEnd=rangeEnd-15;
        
        t=(rangeBegin:rangeEnd)'  +1;
        y=[];
        y=histogramSmooth(rangeBegin:rangeEnd);
        [x,resnorm,~,exitflag,output] = lsqcurvefit(modelfun,b,t,y, lb,ub,opts)
        %mdl = fitnlm(t,y,modelfun,b,'Options',opts);
        %b = mdl.Coefficients{:, 'Estimate'}
        b=x;
        
        
        yhat = b(1) + b(2)*t + ...
            b(3)*exp(-(t - b(4)).^2/(b(5)));
        [ahat, bhat]=findpeaks(yhat)
        
        err=(sum((yhat-y).^2))/size(yhat,1);  % divide this by number of points
        
    end
    
end

if (err>500 || size(ahat,1)==0)
    %{
        b = [0.5 2000 1];
        modelfun = @(b,t)b(1) *(t.^2+(b(2)/2)*t+b(3))
       
        opts = optimoptions('lsqcurvefit', 'MaxFunctionEvaluations', 5000, 'MaxIterations', 5000);
        lb = [];
        ub = [];
        [x,resnorm,~,exitflag,output] = lsqcurvefit(modelfun,b,t,y, lb,ub,opts)
        b=x;
        
        
        yhat = b(1) *(t.^2+(b(2)/2)*t+b(3));%+b(6) * exp(-(t - b(7)).^2/b(8));
        %[ahat, bhat]=findpeaks(yhat)
        
        err2=sum((yhat-y).^2);
    %}
    b = polyfit(t,y,2);
    yhat2=polyval(b, t);
    err2=(sum((yhat2-y).^2))/size(yhat2,1);  % need to divide this by number of points.
    fprintf("error2: %f \n", err2)
    yhat=yhat2;
    [ahat, bhat]=findpeaks(yhat);
    %{
        figure;
        plot( t, polyval(b, t));
        fprintf("B = %2.9f, %2.9f, %2.9f, \n", b);
        error("b")
    %}
end
standardDev=std(histogramSmooth(rangeBegin:rangeEnd));
standardDev2=std(histogramSmooth(NewRangeBegin:NewRangeEnd));
%Fig=figure;
subplot(2,1,2);
plot(t,y,'color', 'magenta');


xlength=rangeEnd-rangeBegin;
ylength=max(histogramSmooth(rangeBegin:rangeEnd))-min(histogramSmooth(rangeBegin:rangeEnd));

Slope=ylength/(2*xlength);

daspect([1.5 1 1])

xrange = [rangeBegin-60 rangeEnd+60];
yrange = [min(histogramSmooth(rangeBegin:rangeEnd))-2 max(histogramSmooth(rangeBegin:rangeEnd))+2];
xlim(xrange);
ylim(yrange);

ymax=max( [y; yNew]);
if ( size( y,1) > size (yNew, 1) )
    plot(t, y+ymax/50, 'color', 'red', 'marker', '.');     %, 'marker', 'o'
    hold on
    plot(tNew, yNew, 'color', 'g', 'marker', '.'); %, 'marker', '*'
else
    plot(tNew, yNew, 'color', 'g', 'marker', '.'); %, 'marker', '*'
    hold on
    plot(t, y+ymax/50, 'color', 'red' , 'marker', '.');    %, 'marker', 'o'
    
end

hold on
if max (yhat) > yrange(2)
    yrange(2) = max(yhat);
end
plot(t,yhat,'r','linewidth',2);
titleStr1=sprintf("fitted curve: <%d-%d>  %s  std-dev=%0.2f --%0.2f -- Slp=%0.2f: \n",z,i,  GusheName , standardDev, standardDev2, Slope);
if ( err2==0)
    titleStr2=sprintf("err=%0.2f                  exitflag=%d\n", err,  exitflag);
else
    titleStr2=sprintf("err=%0.2f    err2=%0.2f    exitflag=%d\n", err, err2, exitflag);
end
%FileName=sprintf("fitted curve,: %s   Peak:   %d\n",  GusheName ,i);
%print(f,strcat("print_", histoName) ,'-djpeg','-r600','-noui');
title({titleStr1 titleStr2},  'interpreter', 'none');
daspect([10 1 2]);
hold on
bhat+rangeBegin;
bhat+rangeBegin;
0;
ahat+2;
[bhat+rangeBegin bhat+rangeBegin];
[0 ahat+2];
yhat;

if ( size( ahat, 1) == 0 )
    
    bhat=(rangeEnd-rangeBegin)/2;
    ahat=yhat(round(bhat));
    %error("fineNoteRange:  Bad fit: no peak was found for the last curve");
end

fittedPeak = bhat+rangeBegin;

plot([(NewRangeBegin) (NewRangeBegin)],[0 histogramSmooth(round((NewRangeBegin)))],...
    'Marker','+','color', 'blue')
hold on
plot([(NewRangeEnd) (NewRangeEnd)],[0 histogramSmooth(round((NewRangeEnd)))],...
    'Marker','+','color', 'blue')
hold on
plot([(NewRangeBegin+NewRangeEnd)/2 (NewRangeBegin+NewRangeEnd)/2],[0 histogramSmooth(round((NewRangeBegin+NewRangeEnd)/2))],'Marker','o')
hold on
plot([bhat+rangeBegin bhat+rangeBegin],[0 ahat+2], 'Marker','*');
hold on
FileName=sprintf("fitted curve-%sPeak%d--%d",  GusheName ,z,i);
fprintf("FileNameFittedCurve= %s\n", FileName)
daspect([10 1 2]);
if Slope >.7
    xrange= xrange + [-50 +50];
end
xlim(xrange);
ylim(yrange);

print(Fig,strcat("Peak_", FileName) ,'-djpeg','-r600','-noui');
histoSmoothmaxlocs(i)=bhat+rangeBegin;

close gcf