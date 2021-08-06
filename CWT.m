function y = wavelet_continuu (t,A,fs)
    for i=1:A-1
        if t(i,1) == 1
            figure(i),
            cwt(t(i,[2:301]),fs);
            folder = 'C:\Users\ASUS\Desktop\Folder Nou\FA';
            baseFileName = sprintf('Figure %d.24.jpg', i);
            fullFileName = fullfile(folder, baseFileName);
            saveas(figure(i),fullFileName);
        else
            figure(i),
            cwt(t(i,[2:301]),fs);
            folder = 'C:\Users\ASUS\Desktop\Folder nou\N';
            baseFileName = sprintf('Figure %d.23.jpg', i);
            fullFileName = fullfile(folder, baseFileName);
            saveas(figure(i),fullFileName);
        end
        close all;
    end
end