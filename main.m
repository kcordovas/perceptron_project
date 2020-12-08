clc; clear; close all;
%% Main Script
% Url
routeMain = 'images/';
wordMujer = 'm';
wordHombre = 'h';
format = '.jpg';
datos=100;

heightImage=40;
widthImage=30;
sizeImage=heightImage*widthImage; % 1200

% Create a vector named "y" to identify the person
% 1 - mujeres (woman)
% -1 - hombres (man)
y=zeros(datos,1);

% Inicializar la matrix X, de 100 filas * 1200 columnas
X=zeros(datos,sizeImage);

word='';
contador=1;
type=1;
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

%% Create a w random vector
w_ini = ones(1,(sizeImage+1));
for i=1:size(w_ini,2)
    w_ini(i)=-6 + (6+6).*rand;
end
w_ini = w_ini';

%% Train 40 pictures (20 man and 20 woman)
%dataTrainer=X(1:20,:);
%ytrainer=y(1:20,:);
[dataTrainer, ytrainer]=dataTraining(40, heightImage, widthImage);
trainedW=myPerceptron(dataTrainer, ytrainer, w_ini, 0);

%% Send 100 pictures to training
w_final=myPerceptron(X,y,trainedW,0.1);
y_hat_final=perceptronyhat(X,w_final);
y_hat_initial=perceptronyhat(X,w_ini);


%% Create a confusion map with y and y_hat_final
myConfusionMat = confusionmat(y,y_hat_final)

