
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
    u=rem(i,k)/k;           
    i1=floor(i/k)+2;   
    for j=1:n*k
        v=rem(j,k)/k;
        j1=floor(j/k)+2;   
        F(i,j)=(1-u)*(1-v)*f1(i1,j1)+(1-u)*v*f1(i1,j1+1)+u*(1-v)*f1(i1+1,j1)+u*v*f1(i1+1,j1+1);
    end
end
          

F=uint8(F); 
figure,imshow(f);
title('orgin');
figure,imshow(F);
title('Bilinear');