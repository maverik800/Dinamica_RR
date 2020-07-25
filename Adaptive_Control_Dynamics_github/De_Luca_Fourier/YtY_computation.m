%% Computation of Y.'Y as function

syms gy real;

% Define trajectory parametrization De Luca Dynamic Identification of the Franka Emika Panda Robot
syms t a_11 a_12 b_11 b_12 q0_1 q0_2 wf real;

l=1; %% 1st harmonic
% wf = 0.15*pi; % fundamental pulsation of the Fourier series

% q1 = (a_11/(l*wf))*sin(l*wf*t) - (b_11/(l*wf))*cos(l*wf*t) + (a_21/(2*l*wf))*sin(2*l*wf*t) - (b_21/(2*l*wf))*cos(2*l*wf*t)+(a_31/(3*l*wf))*sin(3*l*wf*t) - (b_31/(3*l*wf))*cos(3*l*wf*t) + q0_1;
% q2 = (a_12/(l*wf))*sin(l*wf*t) - (b_12/(l*wf))*cos(l*wf*t) + (a_22/(2*l*wf))*sin(2*l*wf*t) - (b_22/(2*l*wf))*cos(2*l*wf*t)+(a_32/(3*l*wf))*sin(3*l*wf*t) - (b_32/(3*l*wf))*cos(3*l*wf*t) + q0_2;
q1 = (a_11/(l*wf))*sin(l*wf*t) - (b_11/(l*wf))*cos(l*wf*t) + q0_1;
q2 = (a_12/(l*wf))*sin(l*wf*t) - (b_12/(l*wf))*cos(l*wf*t) + q0_2;

q = [q1; q2];

dq = jacobian(q,t);
dq1 = dq(1); dq2 = dq(2);

ddq = jacobian(dq,t);
ddq1 = ddq(1); ddq2 = ddq(2);

Y = simplify(RR_bs_regressor(q1,q2,dq1,dq2,dq1,dq2,ddq1,ddq2,gy,1,1));

YtY = simplify(Y.'*Y);

% Converting U and D into single MATLAB function
f =  matlabFunction(YtY , 'File', 'RR_regressor_YtY', ...
    'Outputs', {'YtY'},'Vars',[a_11 a_12 b_11 b_12 q0_1 q0_2 wf gy t]);
disp('Saved function. Done.');

% AFTER FUNCTION GENERATION REORGANIZE INPUTS like this  a_1 a_2 b_1 b_2 q0_1 q0_2, wf,t,g
