

classes = 18; 
lables = 12;

s = loadKimia(); 

% para acessar campo: 
% s(1).centroid

distancias = struct; 

[lin, col] = size(s); 
for j = 1:col
%     dista = (1:col);
%     dista = dista(:);
    dista = struct;
    G = abs(s(j).centroid);
%     G = abs(s(j).complex); 
    for k = 1:col
%         v = abs(s(k).complex);
        v = abs(s(k).centroid);
        dista(k).value = norm(G-v);         
        dista(k).class = s(k).class; 
        dista(k).label = s(k).label;
    end
    distancias(j).class = s(j).class;
    distancias(j).label = s(j).label;
    distancias(j).dista = dista;
end


for j = 1: col    
    a = distancias(j).dista;
    Afields = fieldnames(a);
    Acell = struct2cell(a);
    sz = size(Acell);
    Acell = reshape(Acell, sz(1), []);
    Acell = Acell';
    Acell = sortrows(Acell, 1);
    Acell = reshape(Acell', sz);
    Asorted = cell2struct(Acell, Afields, 1);
    distancias(j).dista = Asorted;
end

precRecall = struct; 

for recall = 1:12
    precision=0;
    for i=1:216
        b = struct;
        b.class = distancias(i).class;
        b.label = distancias(i).label;
        b.dista = distancias(i).dista;
        
        numRelRet = 0; 
        numRet = 0; 
        index = 1;
        while numRelRet < recall
           
           if b.dista(index).class == b.class
              numRelRet = numRelRet + 1;  
           end
           numRet = numRet + 1; 
           
           index = index + 1; 
        end
        precision = precision + numRelRet/numRet;
    end
    precision = precision/216.0; 
    
    precRecall(recall).precision = precision; 
    precRecall(recall).recall = recall/12.0; 
end

p = (1:12);
p = p(:);

r = (1:12);
r = r(:);

for i = 1:12
    p(i,1) = precRecall(i).precision; 
    r(i,1) = precRecall(i).recall; 
end

plot(r,p);
title('Precision x Recall - Centroid Distance');
% title('Precision x Recall - Complex Coordinates');
ylabel('precision'); 
xlabel('recall');
% 
% curva = zeros(18,51); 
% valor = struct; 
% 
% for i = 1:18
%     max = -1; 
%     if distancias(i).label == 1 
%         d = distancias(i).dista; 
%         for aux=1:216
%             valor(aux).class = d(aux).class;
%             valor(aux).label = d(aux).label;
%             valor(aux).value = d(aux).value;
%         end
%     end
%     
%     indice = 1; 
%     for j = 1:12 
%        d = distancias(indice); 
%        if d.label == j && d.class == i
%           vetor = abs(d.dista);
%           for aux1 = 1:216
%              if vetor(aux1).value > max
%                 max = vetor(aux1).value; 
%              end
%           end
%           
%        end
%        indice = indice + 1;
%     end
%     
%     for aux=1:216
%         valor(aux).value = valor(aux).value/max;
%     end
%     
%     x=0;
%     aux2=0;
%     auxZero=0;
%     
%     while x <= 1
%         auxZero=0;
%         for aux1 = 1:216
%             if aux1>=(i*12) && aux1<=(i*12+11)
%                 % PERTENCE A CLASSE EM ANALISE
%                 
%             else 
%                 if valor(aux1).value <= x 
%                     curva(i,aux2)=curva(i,aux2)+1;
%                     auxZero = auxZero + 1;
%                 end
%             end                   
%         end
%         curva(i,aux2) = 1 - (curva(i,aux2)/204);
%         aux2 = aux2 + 1;
%         x = (aux2*2)/100;
%     end       
%     
% end
%    
% plotContent = struct; 
% 
% for j = 1:51
%     soma=0;
%     for i= 1:18     
%       soma = soma + curva(i,j)/18.0;     
%     end
%     plotContent(j) = soma;
% end

