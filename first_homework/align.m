% vidobj=VideoReader("hw1_sky_1.avi");
% frame=im2double(read(vidobj,1));
% frame=rgb2gray(frame);
% [h,w,c]=size(frame);
% diff_min=10000;
% result=[];
% for dx=-1:1
%     for dy=-1:1
%         A=[1 0 0; 0 1 0;dx dy 1];
%         tform=maketform('affine',A);
%         frameTform=imtransform(frame,tform,'XData',[1 size(frame,2)],'YData',[1 size(frame,1)]);
%         diff=sumsqr(frame-frameTform);
%         if diff<diff_min
%             diff_min=diff;
%             result=frameTform;
%         end
%     end
% end
% result
% imwrite(result,'result.jpg','jpg');

vidobj=VideoReader("hw1_sky_1.avi");
numFrames=vidobj.NumberOfFrames;
f_average=[];
for i=1:numFrames
    frame=im2double(read(vidobj,i));
    frame=rgb2gray(frame);
    diff_min=10000;
    result=[];
    image_name=strcat('result\align_',num2str(i));
    image_name=strcat(image_name,'.jpg');
    if(i==1)
        f_average=frame;
    else
        f_average=(i-1)/i*f_average+makealign(frame,f_average)/i;
    end
    
    if(i==30)
        imwrite(f_average,image_name,'jpg');
    end
end