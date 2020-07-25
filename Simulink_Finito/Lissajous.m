function [x,y] = Lissajous(A,a,delta,B,b,t)

syms t
x = A*sin(a*t+delta);
y = B*sin(b*t);


end