clc,clear;
I1=imread("hw1_dark_road_1.jpg");
I2=imread("hw1_dark_road_2.jpg");
I3=imread("hw1_dark_road_3.jpg");

I1_process=gama(im2double(I1),0.4);
figure('name','幂律变换后的图片','NumberTitle','off');
imshow(I1_process);         %display the process image
imwrite(I1_process,"result/I1_gama.jpg","jpg");

I2_process=gama(im2double(I1),0.4);
figure('name','幂律变换后的图片','NumberTitle','off');
imshow(I2_process);         %display the process image
imwrite(I2_process,"result/I2_gama.jpg","jpg");

I3_process=gama(im2double(I1),0.4);
figure('name','幂律变换后的图片','NumberTitle','off');
imshow(I3_process);         %display the process image
imwrite(I3_process,"result/I3_gama.jpg","jpg");