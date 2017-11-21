function desc = centroidDistance(im, i, k)
    % binarizacao da imagem 
    BW = imbinarize(im);

    % encontrando bordas da imagem
    % B possui as coordenadas das bordas da imagem e TODOS os objetos dentro
    % usar o segundo vetor de B, pois o primeiro tem as bordas da imagem
    [B,L] = bwboundaries(BW,'holes');
    
    if (i == 1 && k == 8) || (i == 8 && k == 11)
        objBoundaries = B{3};
    else
        objBoundaries = B{2};
    end   
    [lin, col] = size(objBoundaries);
    
    points = [1,2];
    
    for p = 1:250
        r = 1 + rand(1,1)*(lin-1);
        r = round(r); 
        points(p,1) = objBoundaries(r,1);
        points(p,2) = objBoundaries(r,2);
    end

    % adicionando label na imagem binarizada
    labeledImage = bwlabel(BW, 8);
    
    %extraindo propriedades ==> no caso, posicao da centroid
    m = mean(points); 

    % coordenadas transladadas
    translad = points - m;     
    [plin, pcol] = size(points);
    % %Centroid Distance
    distance = 1:plin;
    distance = distance(:);
    for k = 1 : length(points)        
        x = translad(k, 1);
        y = translad(k, 2);
        result = (x^2-y^2)^1/2;
        distance(k) = result;
    end

    FCentroid = fft(distance); 
    desc = FCentroid;
end