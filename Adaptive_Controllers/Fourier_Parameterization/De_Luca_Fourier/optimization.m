%% Optimization of trajectory using FMINCON

clear all; close all; clc;
addpath('../Regressor')

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory

% Define integration window
T = 20;


% No nonlinear constraints (it might be possible to insert here constraints
% on inverse kinematics, not sure)% Initial guess for x =  [a_1 a_2 b_1 b_2 q0_1 q0_2 wf]
x0 = [11.3 7.2 4 2.9 0.6 0.3 0.5*pi];

% Defining the cost function
fun = @(x)cost_function(x,T);

% There are no linear constraints
A = [];
b = [];
Aeq = [];
beq = [];

% Bounds on x = [a1, a2, w1,w2] - depend on chosen parametrization and
% considered robot
% lb = [0.1 0.1 0.1 0.1 0.1 0.1];
lb = [0.1 0.1 0.1 0.1  0     0      0.1*pi];
ub = [30  30  30  30   6.28  6.28   2*pi];

nonlcon = [];

% Optimization Options
% options = optimoptions('fmincon','OptimalityTolerance',1e-6);
options = optimoptions('fmincon');

% Optimization Execution
disp('Started minimization.');
tic
[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
toc
disp('Finished minimization.');

% I found x = [4.5734, 9.9722, 3.2735, 4.4680] with f = -det(G) = -1.8e9