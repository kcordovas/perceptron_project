clc; clear; close all;
%% Create a w random vector
w_ini = ones(1,1201);
for i=1:size(w_ini,2)
    w_ini(i)=-6 + (6+6).*rand;
end
w_ini = w_ini';
[dataTrainer, ytrainer]=dataTraining();
trainedW=myPerceptron(dataTrainer, ytrainer, w_ini,0);

% Train 20 picture of man
%dataTrainer=X(51:71,:);
%ytrainer=y(51:71,:);
%trainedW2=myPerceptron(dataTrainer, ytrainer, trainedW,0);

w_final=myPerceptron(X,y,trainedW,0.1);
y_hat_final=perceptronyhat(X,w_final);
y_hat_initial=perceptronyhat(X,w_ini);

return;
%{
X=[-1,-1; 1,-1; -1,1; 1,1];
y=[-1,-1,-1,1]';
w_ini=[1,1,0.5]';
%}
X=[0,-2; 1,4; 2,-1; 4,4; 4,-3; 5,5; 6,2];
y=[1 -1 1 -1 1 -1 1]';
w_ini=[-7 2 1]';
myPerceptron(X,y,w_ini, 0.1)
return;
% Calcular y_hat para enviar al error
vector_ones=ones(1,size(X,1))';
xaum=[vector_ones X];
s=xaum*w_ini;
y_hat=zeros(1,size(s,1))';
for i=1:size(s,1)
    if s(i)>0
        y_hat(i)=1;
    else
        y_hat(i)=-1;
    end
end

myError = missclassification(y,y_hat);
w = w_ini;
filas=size(X,1);
vector_ones=ones(1,size(X,1))';
xaum=[vector_ones X];
while myError~=0
for i=1:filas
    x_i=X(i,:);
    y_hat(i)=perceptronyhat(x_i,w);
    if y_hat(i)~=y(i)
        w = w + y(i)*xaum(i,:)';
    end
    w
end
myError = missclassification(y,y_hat)
end






return;

w_ini = ones(1,1201);
for i=1:size(w_ini,2)
    w_ini(i)=rand*5;
end

%% Test
routeMain = 'images/';
wordMujer = 'm';
wordHombre = 'h';
type = '.jpg';
i=4;
% Create structure of Url
urlArray = [routeMain, wordMujer, int2str(i), type];
%return;

%% Image Process
%Read the image
% https://www.mathworks.com/help/matlab/ref/imread.html
[myImg, colorMap] = imread(urlArray);
%Show image with function "image"
% image(myImg)

% RESIZE IMAGE
% https://www.mathworks.com/help/images/ref/imresize.html
imgResize = imresize(myImg, [40 30]);
% imshow(imgResize)

%Convert rbg color image in gray color image
% https://www.mathworks.com/help/matlab/ref/rgb2gray.html
imgGray= rgb2gray(imgResize);
imshow(imgGray)

figure
% Convert an Indexed Image To a Binary Image
% https://www.mathworks.com/help/images/ref/im2bw.html
imgBinary = im2bw(imgGray, colorMap, 0.3);
imshow(imgBinary)

%% Create features vector
featureVector = reshape(imgBinary, [], 1);


return;

%% Join the features vectors (it'll to be transposed)in a X matrix 
X=zeros(100,1200);

% Create a vector named "y" to identify the person
% 1 - mujeres (woman)
% -1 - hombres (man)
y=zeros(100,1);

% Get size of X matrix, only columns
% https://www.mathworks.com/help/matlab/ref/size.html
sizeX = size(X,1);
for i=1:sizeX
    for j=1:size(featureVector, 1)
        X(i,j) = featureVector(j);
    end
    % Condition to verify if it's a woman o man
    if rem(i,2)==0
        % The picture is a woman (1)
        y(i)=1;
    else
        % The picture is a man (-1)
        y(i)=-1;
    end
end
