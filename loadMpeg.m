function mpeg = loadMpeg()
% Read 1.jpg through m.jpg.  
% Files are in the "yourFolder" directory.
yourFolder = 'MPEG7_PartB/pgms/';

classes = 30; 
labels = 20;

nsamples = classes * labels;
samples = struct;

sampleIndex = 1;

for i = 1:classes
    for k = 1:labels
        switch i
            case 1
                filename = sprintf('apple-%d.pgm', k);
            case 2
                filename = sprintf('bat-%d.pgm', k);
            case 3 
                filename = sprintf('beetle-%d.pgm', k);
            case 4 
                filename = sprintf('bell-%d.pgm', k);
            case 5
                filename = sprintf('bird-%d.pgm', k);
            case 6 
                filename = sprintf('Bone-%d.pgm', k);
            case 7
                filename = sprintf('bottle-%d.pgm', k);
            case 8
                filename = sprintf('brick-%d.pgm', k);
            case 9 
                filename = sprintf('butterfly-%d.pgm', k);
            case 10 
                filename = sprintf('camel-%d.pgm', k);
            case 11
                filename = sprintf('car-%d.pgm', k);
            case 12
                filename = sprintf('carriage-%d.pgm', k); 
            case 13
               filename = sprintf('cattle-%d.pgm', k);
            case 14 
                filename = sprintf('cellular_phone-%d.pgm', k);
            case 15
                filename = sprintf('chicken-%d.pgm', k);
            case 16
                filename = sprintf('children-%d.pgm', k);
            case 17
                filename = sprintf('chopper-%d.pgm', k);
            case 18
                filename = sprintf('classic-%d.pgm', k);
            case 19
                filename = sprintf('Comma-%d.pgm', k);
            case 20
                filename = sprintf('crown-%d.pgm', k);
            case 21 
                filename = sprintf('cup-%d.pgm', k);
            case 23
                filename = sprintf('deer-%d.pgm', k);
            case 22
                filename = sprintf('device0-%d.pgm', k);
            case 24
                filename = sprintf('device1-%d.pgm', k);
            case 25
                filename = sprintf('device2-%d.pgm', k);
            case 26 
                filename = sprintf('device4-%d.pgm', k);
            case 27
                filename = sprintf('elephant-%d.pgm', k);
            case 28
                filename = sprintf('fish-%d.pgm', k);
            case 29
                filename = sprintf('flatfish-%d.pgm', k);
            case 30
                filename = sprintf('fly-%d.pgm', k);
                
        end
        
%         filename = sprintf('classe%d (%d).pgm', i, k);
        fullFileName = fullfile(yourFolder, filename);
        if exist(fullFileName, 'file')
            imageData = imread(fullFileName );
        else
            warningMessage = sprintf('Warning: image file does not exist:\n%s', fullFileName);
            uiwait(warndlg(warningMessage));
        end
        % BW = imbinarize(imageData);
        % imshow(imageData);
        
        z = centroidDistanceMPEG(imageData, i, k);
        y = complexCoordinatesMPEG(imageData, i, k);
%         plot(abs(z));
        samples(sampleIndex).class = i; 
        samples(sampleIndex).label = k; 
        samples(sampleIndex).centroid = z;
        samples(sampleIndex).complex = y;
        sampleIndex = sampleIndex + 1;
    end    
end
mpeg = samples;
end