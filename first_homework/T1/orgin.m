clc,clear;
vidobj_1=VideoReader("hw1_sky_1.avi");
numFrames_1=vidobj_1.NumberOfFrames;

vidobj_2=VideoReader("hw1_sky_2.avi");
numFrames_2=vidobj_2.NumberOfFrames;

for i=1:numFrames_1
    origin_1=im2double(read(vidobj_1,i));
    image_name_1=strcat('result\sky1origin_',num2str(i));
    image_name_1=strcat(image_name_1,'.jpg');
    
    origin_2=im2double(read(vidobj_2,i));
    image_name_2=strcat('result\sky2origin_',num2str(i));
    image_name_2=strcat(image_name_2,'.jpg');
    
    if(i==30)
        imwrite(origin_1,image_name_1,'jpg');
        imwrite(origin_2,image_name_2,'jpg');
        break;
    end
end