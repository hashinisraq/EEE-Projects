clc;
clear all;
close all;


[y, Fs] = audioread('Final.wav');

y= resample(y, 2*Fs, Fs);

% Interpolating additional data points to add an octave
melodious_signal = interp(y, 2);

% Normalizing the resulting signal
melodious_signal = melodious_signal / max(abs(melodious_signal));

% creating wav file
audiowrite('melodious.wav', melodious_signal, 2*Fs);