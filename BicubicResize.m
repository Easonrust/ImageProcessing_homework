function F = BilinearResize(f,times)
[m,n]=size(f);  

a=f(1,:);
c=f(m,:);             
b=[f(1,1),f(1,1),f(:,1)',f(m,1),f(m,1)];
d=[f(1,n),f(1,n),f(:,n)',f(m,n),f(m,n)];
a1=[a;a;f;c;c];
b1=[b;b;a1';d;d];
f=b1';
f1=double(f);
g1=zeros(times*m,times*n);        %ensure  there are 16 pixels around the dot
for i=1:times*m                 %Bicubic algoritm
  u=rem(i,times)/times;           
  i1=floor(i/times)+2;   
  A=[sw(1+u) sw(u) sw(1-u) sw(2-u)];   
  for j=1:times*n
    v=rem(j,times)/times;j1=floor(j/times)+2;  
    C=[sw(1+v);sw(v);sw(1-v);sw(2-v)];
    B=[f1(i1-1,j1-1)     f1(i1-1,j1)     f1(i1-1,j1+1)     f1(i1-1,j1+2)    
         f1(i1    ,j1-1)     f1(i1,   j1)     f1(i1,   j1+1)     f1(i1,   j1+2)
         f1(i1+1,j1-1)     f1(i1+1,j1)    f1(i1+1,j1+1)   f1(i1+1,j1+2)
         f1(i1+2,j1-1)     f1(i1+2,j1)    f1(i1+2,j1+1)   f1(i1+2,j1+2)];
    g1(i,j)=(A*B*C);
  end
end
F=uint8(g1);
end

