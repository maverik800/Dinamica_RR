%% Optimization of trajectory using FMINCON on Condition Number of Gramian

clear all; close all; clc;

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory
% The opt. variable is x =  [a_11, a_12, b_11, b_12, q0_1, q0_2, wf]

% Define integration window
T = 20;

% Defining the cost function
fun = @(x)cost_function(x, T);

% There are no linear constraints
A = [];
b = [];
Aeq = [];
beq = [];

% Bounds on x depend on chosen parametrization and considered robot
% lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
% ub = [2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi];
lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
ub = [2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi];

% Initial guess for x =  [a_11 a_12  b_11 b_12 q0_1 q0_2]
% Initial guess can be more random between bounds using rand()
x0 = lb + (ub - lb).*rand([1,7]);

disp('x0 = '); disp(x0);

% No nonlinear constraints (it might be possible to insert here constraints
% on inverse kinematics, not sure)
nonlcon = [];

% Optimization Options
options = optimoptions('fmincon');
% options.ObjectiveLimit = -1e50;

% Optimization Execution
disp('Started minimization.');
tic
[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
toc
disp('Finished minimization.');

% I found x = [63.3652, 27.9904, 84.0402, 42.7379, 63.0559, 83.3923, 23.7893] 
% with f = cond(G) = 5.6580e+09 
% from x0 = [63.2287, 27.8926, 83.9997, 42.7408, 63.1991, 83.3634, 27.0915]
% exit_flag = 2 and sigma_min = -4.35

% I found x = [2.7452, 3.5272, 2.8610, 0.7317, 4.6991, 0.2638, 2.6626] 
% with f = cond(G) = 4.6273e+12
% from x0 = [2.5782, 3.5271, 2.8445, 0.6589, 4.7026, 0.3017, 2.7572]
% exit_flag = 2 and sigma_min = -1e-8