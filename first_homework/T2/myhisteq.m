function I_process = myhisteq(I)
[height,width]=size(I);  %����ͼƬ�Ŀ�͸�

r=zeros(1,256);           %�����洢֮ǰÿ���Ҷȼ������ص�ĸ���
for i=1:height
    for j=1:width
        r(I(i,j)+1)=r(I(i,j)+1)+1;%ͳ��ÿ���Ҷȼ������ص�ĸ���
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

I_process=I;
for i=1:height
   for j=1:width
    I_process(i,j)=s(I(i,j)+1);   %��ÿ�㴦�ĻҶ�ֵ����ӳ��
   end
end
end

