
clc,clear;
f=imread('lena512.bmp');          
k=3;                       
[m,n]=size(f);  


a=f(1,:);
c=f(m,:);            
b=[f(1,1),f(1,1),f(:,1)',f(m,1),f(m,1)];
d=[f(1,n),f(1,n),f(:,n)',f(m,n),f(m,n)];
a1=[a;a;f;c;c];
b1=[b;b;a1';d;d];
f=b1';
f1=double(f);
F=zeros(k*m,k*n);

for i=1:m*k
    for j=1:n*k
        F(i,j)=f1(round(i/k+2),round(j/k+2));
    end
end

F=uint8(F); 
figure,imshow(f);
title('origin');
figure,imshow(F);
title('nearest');