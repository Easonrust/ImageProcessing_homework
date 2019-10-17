vidobj=VideoReader("hw1_sky_1.avi");
numFrames=vidobj.NumberOfFrames;

for i=1:numFrames
    frame=im2double(read(vidobj,i));
    image_name=strcat('result\origin_',num2str(i));
    image_name=strcat(image_name,'.jpg');
    
    if(i==30)
        imwrite(frame,image_name,'jpg');
    end
end