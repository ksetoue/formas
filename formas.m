% importando imagem
bi = imread('216db/pgms/classe1 (1).pgm'); 
imshow(bi);

% binarizacao da imagem 
BW = imbinarize(bi);

% encontrando bordas da imagem
% B possui as coordenadas das bordas da imagem e TODOS os objetos dentro
% usar o segundo vetor de B, pois o primeiro tem as bordas da imagem
[B,L] = bwboundaries(BW,'holes');

% coordenadas das bordas do objeto
objBoundaries = B{2};

% % pode usar o codigo abaixo para testar o que acontece com as bordas dentro da imagem
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
%

% adicionando label na imagem binarizada
% labeledImage = bwlabel(BW, 8);

%extraindo propriedades ==> no caso, posicao da centroid
% blobMeasurements = regionprops(labeledImage, 'Centroid');
% numberOfBlobs = size(blobMeasurements, 1);

% % apenas para teste, mostra a posicao da centroid na imagem
% hold on;
% for k = 1 : length(blobMeasurements)
% 	x = blobMeasurements(k).Centroid(1);
% 	y = blobMeasurements(k).Centroid(2);
% 	plot(x, y, 'r+', 'MarkerSize', 30, 'LineWidth', 3);
% 	str = sprintf('The centroid of shape %d is at (%.2f, %.2f)', ...
% 		k, x, y);
% 	uiwait(helpdlg(str));
% end

% m = mean(objBoundaries); 


% coordenadas transladadas
% translad = objBoundaries - blobMeasurements.Centroid; 
% translad = objBoundaries - m;
% [lin, col] = size(objBoundaries);
% 
% % obtendo conjunto de numeros complexos 
% complexC = 1:lin;
% complexC = complexC(:);
% %Complex Coordinates: 
% for k = 1 : length(objBoundaries)
%     x = translad(k, 1);
%     y = translad(k, 2);
%     complexC(k) = complex(x,y);
% end
% 
% 
% % %Centroid Distance
% distance = 1:lin;
% distance = distance(:);
% for k = 1 : length(objBoundaries)
%     if k < length(objBoundaries)
%         x = objBoundaries(k, 1) - blobMeasurements.Centroid(1);
%         y = objBoundaries(k, 2) - blobMeasurements.Centroid(2);
%         result = sqrt(x^2-y^2);
%         distance(k) = result;
%     end
% end


% distance = objBoundaries;
% for k = 1 : length(objBoundaries)
%     if k < length(objBoundaries)
%         x = objBoundaries(k, 1) - blobMeasurements.Centroid(1);
%         y = objBoundaries(k, 2) - blobMeasurements.Centroid(2);
%         distance(k,1) = x;
%         distance(k,2) = y;
%     end
% end
% L = length(objBoundaries);             % Length of signal
% Y = fft(distance);
% 
% plot(Y);
% xlabel('Frequency (f)')

% FCentroid = fft(distance); 
% FComplex = fft(complexC); 
% 
% plot(abs(complexC));
% plot(abs(distance));