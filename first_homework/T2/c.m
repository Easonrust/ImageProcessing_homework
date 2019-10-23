clc,clear;
I1=imread("hw1_dark_road_1.jpg");
I2=imread("hw1_dark_road_2.jpg");
I3=imread("hw1_dark_road_3.jpg");

I1_process=adapthisteq(I1,'NumTiles',[25 25],'ClipLimit',0.05);
I2_process=adapthisteq(I2,'NumTiles',[25 25],'ClipLimit',0.05); 
I3_process=adapthisteq(I3,'NumTiles',[25 25],'ClipLimit',0.05); 

figure('name','road1局部适应直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
imwrite(I1_process,"result/I1_local.jpg","jpg");
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist

figure('name','road2局部适应直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I2_process);         %display the process image
imwrite(I2_process,"result/I2_local.jpg","jpg");
         
subplot(2,1,2);
imhist(I2_process);         %display the process hist

figure('name','road3局部适应直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I3_process);         %display the process image
imwrite(I3_process,"result/I3_local.jpg","jpg");
         
subplot(2,1,2);
imhist(I3_process);         %display the process hist