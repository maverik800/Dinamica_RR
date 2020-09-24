%% Computation of Y.'Y as function

syms gy real;

% Define trajectory parametrization
syms t a_1 a_2 b_1 b_2 w_1 w_2 real;

q1 = a_1*sin(w_1*t) + b_1*cos(w_1*t);
q2 = a_2*sin(w_2*t) + b_2*cos(w_2*t);
q = [q1; q2];
dq = jacobian(q,t);
dq1 = dq(1); dq2 = dq(2);
ddq = jacobian(dq,t);
ddq1 = ddq(1); ddq2 = ddq(2);

Y = simplify(RR_bs_regressor(q1,q2,dq1,dq2,dq1,dq2,ddq1,ddq2,gy,1,1));

YtY = simplify(Y.'*Y);

% Converting U and D into single MATLAB function
f =  matlabFunction(YtY , 'File', 'RR_regressor_YtY', ...
    'Outputs', {'YtY'},'Vars',[a_1 a_2 b_1 b_2 w_1 w_2 gy t]);
disp('Saved function. Done.');

% AFTER FUNCTION GENERATION REORGANIZE INPUTS like this a_1,a_2,w_1,w_2,t,g
