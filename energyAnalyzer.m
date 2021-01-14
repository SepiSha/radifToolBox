%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) copyright 2021 Sepideh Shafiei (sepideh.shafiee@gmail.com), all rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [YE2,y,Y_high_mean,ELevel1,ELevel2,ELevel3,Y_low,Y_high,Y_high1,Y_high2,ax_E]=...
    energyAnalyzer(YE,Y_centOriginal,Y_centExtrapolated,Y_tmp)

Y_high=Y_centExtrapolated;
Y_high1=Y_centExtrapolated;
Y_high2=Y_centExtrapolated;
Y_low = Y_centExtrapolated;

YE1=YE;
[h1, ~, ~,~] = histofinder(int32(YE*1000));
[x,y]=max(h1);
Y_high_mean = y/1000.0;
ELevel1 = 1.1;
ELevel2 = 1.1;
ELevel3 = 0.8;

YE1(YE1<.02*Y_high_mean)=nan;

Y_high(  YE1<  ELevel1* Y_high_mean ) = nan;
Y_high1( YE1<  ELevel2* Y_high_mean ) = nan;
Y_high1( YE1>= ELevel1* Y_high_mean ) = nan;

Y_high2( YE1<  ELevel3* Y_high_mean ) = nan;
Y_high2( YE1>= ELevel2* Y_high_mean ) = nan;
Y_low (  YE1>= ELevel3* Y_high_mean ) = nan;

[histY_highSmooth, histoYhighStart, histoYhighEnd,~] = histofinder(Y_high);
[histY_high1Smooth, histoYhigh1Start, histoYhigh1End,~] = histofinder(Y_high1);
[histY_high2Smooth, histoYhigh2Start, histoYhigh2End,~] = histofinder(Y_high2);
[histY_lowSmooth, histoYlowStart, histoYlowEnd,~] = histofinder(Y_low);


figure;
plot(histY_highSmooth,'color','r');
hold on;
plot(histY_high1Smooth, 'color','g');
hold on;
plot(histY_high2Smooth, 'color','b');
hold on;
plot(histY_lowSmooth, 'color','k');
title("separate energies");


YE2=[];
YE2=YE(1:size(Y_centOriginal,1));

for i=floor(min(Y_centOriginal))+1:ceil(max(Y_centOriginal))
    k=find (int32(Y_centOriginal)==i);
    if (size(k,1)~=0)
        av(i)=mean(YE2(k));
    end
end


y=nonzeros(av);
x=find(av);

b = polyfit(x,y',1);
yhat=(polyval(b, x))';

for s=1800:size(av,2 )
    f(s) = (b(1)* s +b(2)) /(b(1)*1800 + b(2));
end
f(f==0) = 1;
f(end:5000) = f(end); % just a patch in strange cases this array is not enough and it crashes.
for u= 1: size(Y_centExtrapolated,1)
    
    if ( round(Y_centExtrapolated(u)) > 0 )
        f(round(Y_centExtrapolated(u)));
        YE2(u)= YE2(u) / f(round(Y_centExtrapolated(u)));
    end
end
Y_high =Y_centExtrapolated;
Y_high1=Y_centExtrapolated;
Y_high2=Y_centExtrapolated;
Y_low  =Y_centExtrapolated;

YE2(YE2>10) = 10;
[h1, ~, ~,~] = histofinder(int32(YE2*1000));
[xxd,yyd]=max(h1);
Y_high_mean = yyd/1000.0;
ELevel1 = 1.;
ELevel2 = .9;
ELevel3 = .8;


Y_high(  YE2<  ELevel1* Y_high_mean ) = nan;
Y_high1( YE2<  ELevel2* Y_high_mean ) = nan;
Y_high1( YE2>= ELevel1* Y_high_mean ) = nan;
Y_high2( YE2<  ELevel3* Y_high_mean ) = nan;
Y_high2( YE2>= ELevel2* Y_high_mean ) = nan;
Y_low ( YE2>=ELevel3 *  Y_high_mean ) = nan;

Efig=figure;
ax_E=axes();
scatter(x,y);
hold on;
plot(x,yhat, 'Marker','.', 'MarkerSize',12);
title("Energy vs. Frequency");
