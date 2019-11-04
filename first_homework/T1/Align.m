function aligned = Align(f,g)
%ALIGN 此处显示有关此函数的摘要
%   此处显示详细说明
search = 10;
minMSE = Inf;
[height, width, channels] = size(f);
for dx = -search:search
    for dy = -search:search
        A=[1 0 0
           0 1 0
           dx dy 1];
        tform = maketform('affine', A);
        frameTform = zeros(size(f));

        frameTform = imtransform(f, tform,'bilinear','XData', [1 width], 'YData', [1 height], 'FillValues', zeros(channels,1));


        % Calculates the MSE
        mse = norm( reshape(frameTform, [], 1) - reshape(g, [], 1));
         
        if(mse < minMSE)
           minMSE = mse;
           aligned = frameTform;
          
        end
    end
end
end

