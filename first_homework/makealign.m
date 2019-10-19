function result = makealign(frame,average)
diff_min=10000;
result=[];
for dx=-1:1
    for dy=-1:1
        A=[1 0 0; 0 1 0;dx dy 1];
        tform=maketform('affine',A);
        frameTform=imtransform(frame,tform,'XData',[1 size(frame,2)],'YData',[1 size(frame,1)]);
        diff=sumsqr(frameTform-average);
        if diff<diff_min
            diff_min=diff;
            result=frameTform;
        end
    end
end
end

