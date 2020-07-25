function [f] = cost_function(x,T,mu)

syms t real;

% Our minimization variable is x = [a_11 a_12 b_11 b_12  q0_1 q0_2 wf].
a_11 = x(1); a_12 = x(2);  b_11 = x(3); b_12 = x(4);  q0_1 = x(5); q0_2 = x(6); wf = x(7);

% Integrate regressor
disp('Computing Gramian by integrating.');
YtY = RR_regressor_YtY(a_11,a_12,b_11,b_12,q0_1,q0_2,wf,9.81,t);
G = vpaintegral(YtY,0,T);

disp('G ='); disp(G);
disp('eig(G) ='); disp(eig(G));

%    YTY = RR_REGRESSOR_YTY(A_1,A_2,B_1,B_2,GY,T,W_1,W_2)

% Get the determinant (or any cost from the Gramian)
% disp('Getting determinant of Gramian.');
% disp(G);
% D = det(G);
% disp(-double(D));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ev= eig(G);
% smallest = ev(end);

%Non funziona in questo caso: A = [1 2; 4 90]; ev = [0.9 90]; ans = ev(end)
%= 90 

% Cambio il modo di prelevare l'autovalore minimo( inteso come parte reale,
% ma anche come modulo se ci fossero autovalori complessi)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Return cost (LAMBDA MIN)
disp('Cost Function - Get all Eigs above a value');

% convert G in double for command eigs(G,1,'SM');
% G= double(G);
% ev = eigs(G,1,'SM'); % 'SM' or 'smallestabs'
% f = -double(ev);     % negative sign is for maximization
% disp(f);

D = det(G+mu*eye(size(G)));
f = -double(D);
disp(f);

end