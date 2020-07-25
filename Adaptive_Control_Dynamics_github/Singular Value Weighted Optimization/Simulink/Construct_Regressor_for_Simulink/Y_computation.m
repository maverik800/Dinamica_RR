%% Computation of Y function

syms q1 q2 dq1 dq2 dqr1 dqr2 ddqr1 ddqr2

Y = RR_bs_regressor(q1,q2,dq1,dq2,dqr1,dqr2,ddqr1,ddqr2);

Y=simplify(Y);


% Converting U and D into single MATLAB function
f =  matlabFunction(Y , 'File', 'RR_regressor_Y', ...
    'Outputs', {'Y'},'Vars',[q1 q2 dq1 dq2 dqr1 dqr2 ddqr1 ddqr2]);
disp('Saved function. Done.');


