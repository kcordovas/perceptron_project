function [X, y]=dataTraining(data, heightImage, widthImage)
% Url
routeMain = 'images/training/';
wordMujer = 'm';
wordHombre = 'h';
format = '.jpg';
datos=data;
y=zeros(datos,1);

sizeImage=heightImage*widthImage;

X=zeros(datos,sizeImage);
contador=1;
for imageIndex=1:datos
    if imageIndex<=(datos/2)
        contador=imageIndex;
        word = wordMujer;
    else
        contador=contador+1;
        word = wordHombre;
    end
    if imageIndex==(datos/2)+1
        contador=1;
    end
    url = [routeMain, word, int2str(contador), format];
    [fvector, type]= convertImgToVector(url, word, heightImage, widthImage);
    y(imageIndex) = type;
    X(imageIndex,:)=fvector(:,1);
end
end