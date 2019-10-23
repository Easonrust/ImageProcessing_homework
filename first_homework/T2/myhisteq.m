function I_process = myhisteq(I)
[height,width]=size(I);  %计算图片的宽和高

r=zeros(1,256);           %用来存储之前每个灰度级处像素点的个数
for i=1:height
    for j=1:width
        r(I(i,j)+1)=r(I(i,j)+1)+1;%统计每个灰度级处像素点的个数
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

I_process=I;
for i=1:height
   for j=1:width
    I_process(i,j)=s(I(i,j)+1);   %对每点处的灰度值进行映射
   end
end
end

