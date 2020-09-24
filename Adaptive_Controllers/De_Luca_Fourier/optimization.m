%% Optimization of trajectory using FMINCON

clear all; close all; clc;

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory

% Define integration window and loading param for det(G)
T = 20;
mu = 1e5;

% Defining the cost function
fun = @(x)cost_function(x,T,mu);

% There are no linear constraints
A = [];
b = [];
Aeq = [];
beq = [];

% Bounds on x depend on chosen parametrization and considered robot
lb = [0.1 0.1 0.1 0.1 0.1 0.1 0.1*pi];
ub = [30 30 30 30 20 20 2*pi];

% Initial guess for x =  [a_11 a_12  b_11 b_12 q0_1 q0_2 wf]
x0 = [15 15 15 15 0.9 5 0.5*pi].*rand([1,7]); % Initial guess can be more random using rand()

disp('x0 = '); disp(x0);

% No nonlinear constraints (it might be possible to insert here constraints
% on inverse kinematics, not sure)
nonlcon = [];

% Optimization Options
options = optimoptions('fmincon');
options.ObjectiveLimit = -1e100;

% Optimization Execution
disp('Started minimization.');
tic
[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
toc
disp('Finished minimization.');

% I found x = [30.0, 30.0, 30.0, 30.0, 0.1, 6.18, 6.28] with f =
% -det(G+1e5*I) = -5.2e36 from x0 = [15 15 15 15 0.9 5 0.5*pi]