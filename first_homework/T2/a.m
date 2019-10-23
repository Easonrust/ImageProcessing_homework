clc,clear;
I1=imread("hw1_dark_road_1.jpg");
I2=imread("hw1_dark_road_2.jpg");
I3=imread("hw1_dark_road_3.jpg");
figure('name','histogram','NumberTitle','off');
subplot(3,1,1);
imhist(I1);         %display the origin image
title("I1");        
subplot(3,1,2);
imhist(I2);         %display the origin hist
title("I2")
subplot(3,1,3);
imhist(I3);         %display the origin hist
title("I3")

