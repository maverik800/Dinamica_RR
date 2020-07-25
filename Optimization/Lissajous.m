function [x,y] = Lissajous(A,a,delta,B,b)

syms t
x = A*sin(a*t+delta);
y = B*sin(b*t);


end