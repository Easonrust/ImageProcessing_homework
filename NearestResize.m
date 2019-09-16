function F = NearestResize(f,times)
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
    for j=1:n*times
        F(i,j)=f1(round(i/times+2),round(j/times+2));
    end
end

F=uint8(F); 
end

