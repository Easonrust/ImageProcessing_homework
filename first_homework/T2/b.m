clc,clear;
I1=imread("hw1_dark_road_1.jpg");
I2=imread("hw1_dark_road_2.jpg");
I3=imread("hw1_dark_road_3.jpg");
I1_process=myhisteq(I1);
I2_process=myhisteq(I2);
I3_process=myhisteq(I3)
I1_process_2=histeq(I1,256);
I2_process_2=histeq(I2,256);
I3_process_2=histeq(I3,256);

figure('name','road1自定义全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the MY process image
imwrite(I1_process,"result/I1_myglobal.jpg","jpg");
         
subplot(2,1,2);
imhist(I1_process);         %display the MY process hist

figure('name','road2自定义全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I2_process);         %display the MY process image
imwrite(I2_process,"result/I2_myglobal.jpg","jpg");
         
subplot(2,1,2);
imhist(I2_process);         %display the MY process hist

figure('name','road3自定义全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I3_process);         %display the MY process image
imwrite(I3_process,"result/I3_myglobal.jpg","jpg");
         
subplot(2,1,2);
imhist(I3_process);         %display the MY process hist

figure('name','road1全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process_2);         %display the process image
imwrite(I1_process_2,"result/I1_global.jpg","jpg");
         
subplot(2,1,2);
imhist(I1_process_2);         %display the process hist

figure('name','road2全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I2_process_2);         %display the process image
imwrite(I2_process_2,"result/I2_global.jpg","jpg");
         
subplot(2,1,2);
imhist(I2_process_2);         %display the process hist

figure('name','road3全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I3_process_2);         %display the process image
imwrite(I3_process_2,"result/I3_global.jpg","jpg");
         
subplot(2,1,2);
imhist(I3_process_2);         %display the process hist
