function kimia = loadKimia()
% Read 1.jpg through m.jpg.  
% Files are in the "yourFolder" directory.
yourFolder = '216db/pgms/';

classes = 18; 
lables = 12;

nsamples = classes * lables;
samples = struct;

sampleIndex = 1;

for i = 1:18
    for k = 1:12
        filename = sprintf('classe%d (%d).pgm', i, k);
        fullFileName = fullfile(yourFolder, filename);
        if exist(fullFileName, 'file')
            imageData = imread(fullFileName );
        else
            warningMessage = sprintf('Warning: image file does not exist:\n%s', fullFileName);
            uiwait(warndlg(warningMessage));
        end
        % BW = imbinarize(imageData);
        % imshow(imageData);
        
        z = centroidDistance(imageData, i, k);
        y = complexCoordinates(imageData, i, k);
%         plot(abs(z));
        samples(sampleIndex).class = i; 
        samples(sampleIndex).label = k; 
        samples(sampleIndex).centroid = z;
        samples(sampleIndex).complex = y;
        sampleIndex = sampleIndex + 1;
    end    
end
kimia = samples;
end