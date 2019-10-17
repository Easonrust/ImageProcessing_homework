clc,clear;
I1=imread("hw1_dark_road_1.jpg");
% I_2=imread("hw1_dark_road_2.jpg");
% 
% I_3=imread("hw1_dark_road_3.jpg");

[height,width]=size(I1);  %����ͼƬ�Ŀ�͸�

r=zeros(1,256);           %�����洢֮ǰÿ���Ҷȼ������ص�ĸ���
for i=1:height
    for j=1:width
        r(I1(i,j)+1)=r(I1(i,j)+1)+1;%ͳ��ÿ���Ҷȼ������ص�ĸ���
    end
end

s=zeros(1,256);
s(1)=r(1);
for i=2:256
    s(i)=s(i-1)+r(i);        %��Ӧ���Ϲ�ʽ����ֻ��������ֻ����CDF
end

for i=1:256
    s(i)=floor(255*s(i)/(height*width));        %��Ӧ���Ϲ�ʽ������L-1ȡ255
end

I1_MY_process=I1;
for i=1:height
   for j=1:width
    I1_MY_process(i,j)=s(I1(i,j)+1);   %��ÿ�㴦�ĻҶ�ֵ����ӳ��
   end
end


figure('name','ԭʼͼƬ','NumberTitle','off');
subplot(2,1,1);
imshow(I1);         %display the origin image
         
subplot(2,1,2);
imhist(I1);         %display the origin hist



I1_process=histeq(I1,256);    %display the hist after utilize histeq
figure('name','ȫ��ֱ��ͼ������ͼƬ','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist


figure('name','�Զ���ȫ��ֱ��ͼ������ͼƬ','NumberTitle','off');

subplot(2,1,1);
imshow(I1_MY_process);         %display the MY process image
         
subplot(2,1,2);
imhist(I1_MY_process);         %display the MY process hist

I1_process=adapthisteq(I1,'NumTiles',[25 25],'ClipLimit',0.05);    %display the hist after utilize histeq
figure('name','�ֲ���Ӧֱ��ͼ������ͼƬ','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist

I1_process=gama(im2double(I1),0.5);
figure('name','���ɱ任���ͼƬ','NumberTitle','off');

subplot(2,1,1);
imshow(I1_process);         %display the process image
         
subplot(2,1,2);
imhist(I1_process);         %display the process hist

% figure,imhist(I_2);
% title("I_2");
% 
% figure,imhist(I_3);
% title("I_3");