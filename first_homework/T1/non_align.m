clc,clear;
vidobj=VideoReader("hw1_sky_1.avi");
numFrames=vidobj.NumberOfFrames;
f_average=[];
for i=1:numFrames
    frame=im2double(read(vidobj,i));
    image_name=strcat('result\nonalign_',num2str(i));
    image_name=strcat(image_name,'.jpg');
    if(i==1)
        f_average=frame;
    else
        f_average=(i-1)/i*f_average+frame/i;
    end
    
    if(i==30)
        imwrite(f_average,image_name,'jpg');
        imshow(f_average);
    end
end