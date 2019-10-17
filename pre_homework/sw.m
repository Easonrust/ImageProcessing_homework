function A=sw(w1)
w=abs(w1);
a=-0.5;
if w<1&&w>=0
  A=1-(a+3)*w^2+(a+2)*w^3;
else if w>=1&&w<2
  A=a*w^3-5*a*w^2+(8*a)*w-4*a;
else
  A=0;
    end
end


