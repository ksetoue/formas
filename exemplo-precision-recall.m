curva_media=curva_media/10;
for i = 1:15
curva_media(i,1) = 0.066666*i;
end
// ai essa matriz curva media
// a coluna 1 é o eixo X e a coluna 2 o eixo Y
recall = recall(1:10,2:160);

curva_media = zeros(15,2);

for i=1:10
    counter=1;
    for j=1:160
        if(recall(i,j))==i
        eixoPR(i,counter)= counter/j;
        curva_media(counter,2) = curva_media(counter,2) +  counter/j; 
        eixoRC(i,counter)= 0.066666*counter;
        counter = counter+1;
            
        end
         if(counter==16)
             break;
         end
    end
end
curva_media=curva_media/10;
for i = 1:15
curva_media(i,1) = 0.066666*i;
end