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
F=zeros(times*m,times*n);

for i=1:m*times
    u=rem(i,times)/times;           
    i1=floor(i/times)+2;   
    for j=1:n*times
        v=rem(j,times)/times;
        j1=floor(j/times)+2;   
        F(i,j)=(1-u)*(1-v)*f1(i1,j1)+(1-u)*v*f1(i1,j1+1)+u*(1-v)*f1(i1+1,j1)+u*v*f1(i1+1,j1+1);
    end
end
          

F=uint8(F); 
end



