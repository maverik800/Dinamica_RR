clear all
clc
%% Define Inertial Properties

m1 = 1; m2 = 1; %mass
a1 = 1; a2 = 1; %links lenght
l1 = 0.5; l2 = 0.5; %COM 

%% Inertia of links respect to COM and {G}

Izz1_g = (1/12)*m1*l1^2;
Izz2_g = (1/12)*m2*l2^2;

[pi_param] = RR_real_params(m1,m2,a1,a2,l1,l2,Izz1_g,Izz2_g);

%% Estimated Inertia Parameters

pi_param_hat_0 = pi_param*(1+0.10);

%% Trajectory Parameters [Fourier First Harmonic] SECOND TEST

% lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
% ub = [pi, pi, pi, pi, pi, pi, pi];
% 
% x =  [a_11, a_12, b_11, b_12, q0_1, q0_2, wf]
% x =
%     3.1416    3.1416    3.1416    3.1416    1.5962    3.1416    2.0245
% fval =
%   -8.7374e+09
% exitflag =
%      1
% output = 
%   struct with fields:
% 
%          iterations: 15
%           funcCount: 136
%     constrviolation: 0
%            stepsize: 1.6654e-08
%           algorithm: 'interior-point'
%       firstorderopt: 5.0065e+03
%        cgiterations: 5


% q0_1 = 1.5962; %UNCOMMENT FOR USE
% q0_2 = 3.1416;
% 
% a_11 = 3.1416;
% b_11 = 3.1416;
% a_12 = 3.1416;
% b_12 = 1.5962;
% 
% wf = 2.0245;

%% Initial condition of q0 ( --> Initial Condition in the integrator (Simulink) )

%Consider t=0

% qd1 = q0_1 - (b_11*cos(0*wf))/wf + (a_11*sin(0*wf))/wf; %UNCOMMENT FOR TEST 1
% qd2 = q0_2 - (b_12*cos(0*wf))/wf + (a_12*sin(0*wf))/wf;
% 
% qInitial_0=[qd1; qd2];

%% Initial casual condition 

% qInitial_0 = [1; 0.5]; %UNCOMMENT FOR TEST 2

%% Trajectory Parameters [Fourier First Harmonic] FIRST TEST

% lb = [1, 1, 1, 1, 1, 1, 1];
% ub = [2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi];
% 
% x =  [a_11, a_12, b_11, b_12, q0_1, q0_2, wf]
% x =
%     6.2832    6.2832    6.2832    6.2832    6.2832    1.0000    6.2832
% fval =
%   -9.7452e+12
% exitflag =
%      2
% output = 
%   struct with fields:
% 
%          iterations: 22
%           funcCount: 212
%     constrviolation: 0
%            stepsize: 6.1093e-10
%           algorithm: 'interior-point'
%       firstorderopt: 2.7583e+15
%        cgiterations: 44

q0_1 = 6.2832;
q0_2 = 1.0000;

a_11 = 6.2832;
b_11 = 6.2832;
a_12 = 6.2832;
b_12 = 6.2832;

wf = 6.2832;

%% Initial condition of q0 ( --> Initial Condition in the integrator (Simulink) )

%Consider t=0

qd1 = q0_1 - (b_11*cos(0*wf))/wf + (a_11*sin(0*wf))/wf;
qd2 = q0_2 - (b_12*cos(0*wf))/wf + (a_12*sin(0*wf))/wf;

qInitial_0=[qd1; qd2];

%% Initial casual condition 

% qInitial_0 = [1; 0.5];
