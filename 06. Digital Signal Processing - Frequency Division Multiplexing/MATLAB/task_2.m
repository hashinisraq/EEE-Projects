clc;
clear all;
close all;

% Reading audio file
[x1,fs1]=audioread('Final.wav');

% nextpow2() calculate the next highest power of 2
nfftF=2^nextpow2(length(x1));
f1=fs1/2*linspace(0,1,nfftF/2+1);
y1=abs(fft(x1,nfftF));
figure(1);
plot(f1,y1(1:nfftF/2+1));
title('Frequncy Spectrum');