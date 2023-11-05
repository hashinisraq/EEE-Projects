clc;
clear all;
close all;
[signal, Fs] = audioread('NonOverlapping.wav');
fftLength = 2000;
freqResolution = Fs / fftLength;
freqRange = (0:fftLength/2-1) * freqResolution;
% Initializing the spectrum
spectrum = cell(1, 4);
instrumentNames = {'Guitar', 'Piano', 'Trumpet', 'Violin'};
% Defining start and end times
startTimes = [0, 13, 34, 49];
endTimes = [12, 33, 49, 58];
for i = 1:4 
    startTime = startTimes(i);
    endTime = endTimes(i);
    instrumentSignal = signal(round(startTime*Fs)+1:round(endTime*Fs), :);
    fftSignal = fft(instrumentSignal, fftLength);
    magSignal = abs(fftSignal) / fftLength;  
    spectrum{i} = magSignal(1:fftLength/2, :);   
    figure;
    plot(freqRange, spectrum{i});
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title(sprintf('Spectrum of %s', instrumentNames{i}));
end
