%%
close all
clear
clc
liste=dir('*.data');
for x=1:size(liste)
    clear absolute;clear amp1;clear amp2;
    file=liste(x).name;
    X=importdata(file);
    Fs = 4000;
    N = length(X);
    dF = Fs/N;
    f = -Fs/2:dF:Fs/2-dF + (dF/2)*mod(N,2);
    X_fft = fftshift(fft(X))/N;
    absolute = abs(X_fft);
    figure;
    plot(f,absolute);
    grid on;
    title(strrep(file,'_','-'));
    xlabel('Frequency Hz');
    ylabel('Amplitude');
    M = mean(absolute);
    c = absolute > M;
    c = [0 diff(c)];
    peak_start_indexes = find(c==1);
    peak_end_indexes = find(c==-1);
    [amp1,peak_points(1)] = max(absolute(peak_start_indexes(3):peak_end_indexes(3)));
    [amp2,peak_points(2)] = max(absolute(peak_start_indexes(4):peak_end_indexes(4)));
    peak_points = peak_points + [peak_start_indexes(3) peak_start_indexes(4)] -2;
    peak_freqs = peak_points*(4000/256)-2000;
    xline(peak_freqs(1),'red');
    xline(peak_freqs(2),'red');
    text(peak_freqs(1)-5,amp1,strcat(num2str(peak_freqs(1)),' Hz','\rightarrow'),'HorizontalAlignment','right')
    text(peak_freqs(2),amp2,strcat('\leftarrow',num2str(peak_freqs(2)),' Hz'))
    saveas(gcf,strcat(file,'.png'),'png');
end