function aligned = Align(f,g)
%ALIGN 此处显示有关此函数的摘要
%   此处显示详细说明
search = 20;
minMSE = Inf;
for dx = -search:search
    for dy = -search:search
        frameTform = zeros(size(f));
        frameTform = imtranslate(f, [dx,dy], 'FillValues', zeros(3,1));


        % Calculates the MSE
        mse = norm( reshape(frameTform, [], 1) - reshape(g, [], 1));
         
        if(mse < minMSE)
           minMSE = mse;
           aligned = frameTform;
          
        end
    end
end
end

