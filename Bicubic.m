
clc,clear;
f=imread('lena512.bmp');           %read the image to f
k=2;                       %set the times you want to enlarge
[m,n]=size(f);  

a=f(1,:);
c=f(m,:);             
b=[f(1,1),f(1,1),f(:,1)',f(m,1),f(m,1)];
d=[f(1,n),f(1,n),f(:,n)',f(m,n),f(m,n)];
a1=[a;a;f;c;c];
b1=[b;b;a1';d;d];
f=b1';
f1=double(f);
g1=zeros(k*m,k*n);        %ensure  there are 16 pixels around the dot
for i=1:k*m                 %Bicubic algoritm
  u=rem(i,k)/k;           
  i1=floor(i/k)+2;   
  A=[sw(1+u) sw(u) sw(1-u) sw(2-u)];   
  for j=1:k*n
    v=rem(j,k)/k;j1=floor(j/k)+2;  
    C=[sw(1+v);sw(v);sw(1-v);sw(2-v)];
    B=[f1(i1-1,j1-1)     f1(i1-1,j1)     f1(i1-1,j1+1)     f1(i1-1,j1+2)    
         f1(i1    ,j1-1)     f1(i1,   j1)     f1(i1,   j1+1)     f1(i1,   j1+2)
         f1(i1+1,j1-1)     f1(i1+1,j1)    f1(i1+1,j1+1)   f1(i1+1,j1+2)
         f1(i1+2,j1-1)     f1(i1+2,j1)    f1(i1+2,j1+1)   f1(i1+2,j1+2)];
    g1(i,j)=(A*B*C);
  end
end
g=uint8(g1);
figure,imshow(f);
title('origin');
figure,imshow(g);
title('2 times enlarged');