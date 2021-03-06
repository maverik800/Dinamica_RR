function [f] = cost_function(x,T)

syms t real;
% syms t a_1 a_2 w_1 w_2 real;

% Our minimization variable is x = [a_1 a_2 b_1 b_2 q0_1 q0_2 wf].
a1 = x(1); a2 = x(2); b1 = x(3); b2 = x(4); q0_1 = x(5); q0_2 = x(6); wf = x(7);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a1,a2,b1,b2,q0_1,q0_2,wf,9.81,t);
G = vpaintegral(YtY,0,T);

%    YTY = RR_REGRESSOR_YTY(A_1,A_2,B_1,B_2,GY,T,W_1,W_2)

% Get the determinant (or any cost from the Gramian)
disp('Getting determinant of Gramian.');
disp(G);
D = det(G);
disp(D);

disp('Getting smallest eigenvalue of Gramian.');
eigen = min(eig(G));

% Return cost
f = -double(D);     % negative sign is for maximization
disp(f);

end