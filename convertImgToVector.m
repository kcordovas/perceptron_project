function [featureVector, type]= convertImgToVector(url, word, heightImage, widhtImage)
%% Image Process
%Read the image
% https://www.mathworks.com/help/matlab/ref/imread.html
[myImg, colorMap] = imread(url);
%Show image with function "image"
% image(myImg)

% RESIZE IMAGE
% https://www.mathworks.com/help/images/ref/imresize.html
imgResize = imresize(myImg, [heightImage widhtImage]);
% imshow(imgResize)

%Convert rbg color image in gray color image
% https://www.mathworks.com/help/matlab/ref/rgb2gray.html
imgGray= rgb2gray(imgResize);
% imshow(imgGray)

% figure
% Convert an Indexed Image To a Binary Image
% https://www.mathworks.com/help/images/ref/im2bw.html
imgBinary = im2bw(imgGray, colorMap, 0.3);
%imshow(imgBinary)

%% Create features vector
featureVector = reshape(imgBinary, [], 1);

%% Identify picture image
if(word == 'm')
    % 1 Value for women
    type = 1;
else
    % -1 Value for man
    type = -1;
end

end