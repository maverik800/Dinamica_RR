function [f] = cost_function(x,T,W)

syms t real;

% Our minimization variable is x = [a_11 a_12 b_11 b_12 q0_1 q0_2 wf].
a_11 = x(1); a_12 = x(2);  b_11 = x(3); b_12 = x(4); 
q0_1 = x(5); q0_2 = x(6); wf = x(7);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a_11,a_12,b_11,b_12,q0_1,q0_2,wf,9.81,t);
G = vpaintegral(YtY,0,T);

disp('G ='); disp(G);
disp('eig(G) ='); disp(eig(G));

% Computing weighted sum of singular values
S = svd(G);
% f = double(-S.'*W*S);
% disp('f = -S^T*W*S ='); disp(f);

% Testing the Ker of the Gramian
f = -double(S(end)); 
disp('The new weighted value '); disp(f);
ker = rank(null(G));
disp('The Ker of the Gramian is : '); disp(ker);
disp('The last two singular values are: '); disp(S(5)); disp(S(end));

end