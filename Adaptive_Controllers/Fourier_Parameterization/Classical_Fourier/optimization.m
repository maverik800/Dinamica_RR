%% Optimization of trajectory using FMINCON

clear all; close all; clc;
addpath('../Regressor')

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory

% Define integration window
T = 20;

% Initial guess for x = [a1, a2, b1, b2, w1, w2].
x0 = [1.5 1.5 1.5 1.5 0.2 0.4];

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
lb = [1 1 1 1 0.1 0.1];
ub = [3 3 3 3 2 2];

% No nonlinear constraints (it might be possible to insert here constraints
% on inverse kinematics, not sure)
nonlcon = [];

% Optimization Options
options = optimoptions('fmincon');

% Optimization Execution
disp('Started minimization.');
tic
[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
toc
disp('Finished minimization.');

% I found x = [4.5734, 9.9722, 3.2735, 4.4680] with f = -det(G) = -1.8e9