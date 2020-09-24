function [f] = cost_function(x,T)

syms t real;
% syms t a_1 a_2 w_1 w_2 real;

% Our minimization variable is x = [a1, a2, b1, b2, w1, w2].
a1 = x(1); a2 = x(2); b1 = x(3); b2 = x(4); w1 = x(5); w2 = x(6);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a1,a2,b1,b2,w1,w2,9.81,t);
G = vpaintegral(YtY,0,T);

%    YTY = RR_REGRESSOR_YTY(A_1,A_2,B_1,B_2,GY,T,W_1,W_2)

% Get the determinant (or any cost from the Gramian)
disp('Getting determinant of Gramian.');
disp(G);
D = det(G);

% Return cost
f = -double(D);     % negative sign is for maximization
disp(f);

end