clc,clear;
vidobj_1=VideoReader("hw1_sky_1.avi");
numFrames_1=vidobj_1.NumberOfFrames;

vidobj_2=VideoReader("hw1_sky_2.avi");
numFrames_2=vidobj_2.NumberOfFrames;

for i=1:numFrames_1
    frame_1=im2double(read(vidobj_1,i));
    image_name_1=strcat('result\sky1wialign_',num2str(i));
    image_name_1=strcat(image_name_1,'.jpg');
    frame_2=im2double(read(vidobj_2,i));
    image_name_2=strcat('result\sky2wialign_',num2str(i));
    image_name_2=strcat(image_name_2,'.jpg');
    if(i==1)
        f_average_1=frame_1;
        f_average_2=frame_2;
    else
        f_average_1=(i-1)/i*f_average_1+Align(frame_1,f_average_1)/i;
        f_average_2=(i-1)/i*f_average_2+Align(frame_2,f_average_2)/i;
    end
    
    if(i==30)
        wialign_1=f_average_1;
        imwrite(wialign_1,image_name_1,'jpg');
        wialign_2=f_average_2;
        imwrite(wialign_2,image_name_2,'jpg');
        break;
    end
end
