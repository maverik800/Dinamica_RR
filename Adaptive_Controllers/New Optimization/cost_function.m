function [f] = cost_function(x,T)

syms t real;
% syms t a_1 a_2 w_1 w_2 real;

% Our minimization variable is x = [a1, a2, w1,w2].
a1 = x(1); a2 = x(2); w1 = x(3); w2 = x(4);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a1,a2,w1,w2,t,9.81);
G = vpaintegral(YtY,0,T);

% Get the determinant (or any cost from the Gramian)
disp('Getting determinant of Gramian.');
disp(G);
D = det(G);

% Return cost
f = -double(D);     % negative sign is fro maximization
disp(f);

end