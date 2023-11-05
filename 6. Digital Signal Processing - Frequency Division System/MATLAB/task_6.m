clc;
clear all;
close all;

[guitar_sound, Fs] = audioread('Guitar.wav');
[piano_sound, Fs] = audioread('Trumpet.wav');

% Defining the carrier frequencies
fc1 = 5184; 
fc2 = 12000; 

% Modulating the signal 
guitar_modulated = modulate(guitar_sound, fc1, Fs);
trumpet_modulated = modulate(piano_sound, fc2, Fs);

% Combining the modulated signals
fdm_signal = guitar_modulated + trumpet_modulated;

audiowrite('Guitar_modulated.wav', guitar_modulated, Fs);
audiowrite('Trumpet_modulated.wav', trumpet_modulated, Fs);
audiowrite('FDM_signal.wav', fdm_signal, Fs);