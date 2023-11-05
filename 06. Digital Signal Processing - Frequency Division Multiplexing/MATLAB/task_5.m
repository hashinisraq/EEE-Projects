clc;
clear all;
close all;
[guitar_sound, Fs] = audioread('Guitar.wav');
[piano_sound, Fs] = audioread('Piano.wav');
[trumpet_sound, Fs] = audioread('Trumpet.wav');
[violin_sound, Fs] = audioread('Violin.wav');
% Setting the frequencies
Fcutoff_low = 0;
Fcutoff_high = 10000; 
fs = Fs; 
% calculate the low and high frequency
Wn_low = Fcutoff_low / (fs/2);
Wn_high = Fcutoff_high / (fs/2);
% Desining a low-pass filter 
[b, a] = butter(6, Wn_high, 'low');
% Generating the filters 
guitar_filtered = filter(b, a, guitar_sound);
piano_filtered = filter(b, a, piano_sound);
trumpet_filtered = filter(b, a, trumpet_sound);
violin_filtered = filter(b, a, violin_sound);
% Creating WAV files
audiowrite('Guitar_filtered.wav', guitar_filtered, Fs);
audiowrite('Piano_filtered.wav', piano_filtered, Fs);
audiowrite('Trumpet_filtered.wav', trumpet_filtered, Fs);
audiowrite('Violin_filtered.wav', violin_filtered, Fs);
