%% Optimization of trajectory using FMINCON

clear all; close all; clc;
addpath('../Regressor')

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory

% Define integration window
T = 20;

% Initial guess for x = [a1, a2, w1,w2]
x0 = [5 5 5 5];

% Defining the cost function
fun = @(x)cost_function(x,T);

% Bounds on x = [a1, a2, w1,w2] - depend on chosen parametrization and
% considered robot
lb = [0.1 0.1 0.1 0.1];
ub = [10 10 10 10];

% Global Optimization Creation
rng default % For reproducibility
gs = GlobalSearch;
problem = createOptimProblem('fmincon','x0',x0,'objective',fun,'lb',lb,'ub',ub);

% Optimization Execution
disp('Started minimization.');
tic
x = run(gs,problem)
toc
disp('Finished minimization.');

% I fouund x = ... ?