clc,clear;
I1=imread("hw1_dark_road_1.jpg");
% I_2=imread("hw1_dark_road_2.jpg");
% 
% I_3=imread("hw1_dark_road_3.jpg");

[height,width]=size(I1);  %计算图片的宽和高

r=zeros(1,256);           %用来存储之前每个灰度级处像素点的个数
for i=1:height
    for j=1:width
        r(I1(i,j)+1)=r(I1(i,j)+1)+1;%统计每个灰度级处像素点的个数
    end
end

s=zeros(1,256);
s(1)=r(1);
for i=2:256
    s(i)=s(i-1)+r(i);        %对应书上公式计算只不过这里只算了CDF
end

for i=1:256
    s(i)=floor(255*s(i)/(height*width));        %对应书上公式，这里L-1取255
end

I1_MY_process=I1;
for i=1:height
   for j=1:width
    I1_MY_process(i,j)=s(I1(i,j)+1);   %对每点处的灰度值进行映射
   end
end


figure('name','原始图片','NumberTitle','off');
subplot(2,1,1);
imshow(I1);         %display the origin image
         
subplot(2,1,2);
imhist(I1);         %display the origin hist



I1_process=histeq(I1,256);    %display the hist after utilize histeq
figure('name','全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist


figure('name','自定义全局直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_MY_process);         %display the MY process image
         
subplot(2,1,2);
imhist(I1_MY_process);         %display the MY process hist

I1_process=adapthisteq(I1,'NumTiles',[25 25],'ClipLimit',0.05);    %display the hist after utilize histeq
figure('name','局部适应直方图均衡后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist

I1_process=gama(im2double(I1),0.5);
figure('name','幂律变换后的图片','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist

% figure,imhist(I_2);
% title("I_2");
% 
% figure,imhist(I_3);
% title("I_3");