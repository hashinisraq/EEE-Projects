clc;
clear all;
close all;

[x1,fs1]=audioread('Final.wav');
nfftF=2^nextpow2(length(x1));
f1=fs1/2*linspace(0,1,nfftF/2+1);

filter1=designfilt('lowpassfir','PassbandFrequency',1970,'StopbandFrequency',2290,'PassbandRipple',1,'StopbandAttenuation',94,'SampleRate',fs1);
signalGuiter=filter(filter1,x1);
audiowrite('Guitar.wav',signalGuiter,fs1);

filter2=designfilt('bandpassfir','FilterOrder',32,'CutoffFrequency1',4600,'CutoffFrequency2',6100,'SampleRate',fs1);
signalPiano=filter(filter2,x1);
audiowrite('Piano.wav',signalPiano,fs1);

filter3=designfilt('bandpassfir','FilterOrder',24,'CutoffFrequency1',10000,'CutoffFrequency2',11000,'SampleRate',fs1);
signalTrumpet=filter(filter3,x1);
audiowrite('Trumpet.wav',signalTrumpet,fs1);

filter4=designfilt('highpassfir','PassbandFrequency',15000,'StopbandFrequency',14900,'PassbandRipple',1,'StopbandAttenuation',77,'SampleRate',fs1);
signalViolin=filter(filter4,x1);
audiowrite('Violin.wav',signalViolin,fs1);