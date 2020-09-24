function [c,ceq] = constraint(x,T)
% NONLINEAR CONSTRAINT transforming minimum lambda optimization as in paper
% EIGENVALUE AND SINGULAR VALUE OPTIMIZATION A. M. Blanco and J. A. Bandoni

syms t real;

% Our minimization variable is x = [a_11, a_12, b_11, b_12, q0_1, q0_2, wf, z].
a_11 = x(1); a_12 = x(2);  b_11 = x(3); b_12 = x(4);
q0_1 = x(5); q0_2 = x(6); wf = x(7);

z = x(8);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a_11,a_12,b_11,b_12,q0_1,q0_2,wf,9.81,t);
G = vpaintegral(YtY,0,T);

disp('G ='); disp(G);
disp('eig(G) ='); disp(eig(G));

% Get constraint on det
disp('Generating constraint - Get all Eigs above the main cost');

c = double(-(det(G-z*eye(size(G))))^2);
disp('-det(G - zI) = '); disp(c);

ceq = [];

end

