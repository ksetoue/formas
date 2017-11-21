% importando imagem
bi = imread('bonefishes.png'); 
imshow(bi);
% binarizacao da imagem 
% BW = imbinarize(bi);

% y = complexCoordinates(bi);
% plot(abs(y));

z = centroidDistance(bi);
plot(abs(z));