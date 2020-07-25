%% Optimization of trajectory using FMINCON

clear all; close all; clc;
addpath('../Regressor')

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory

% Define integration window
T = 20;

% Initial guess for x = [a1, a2, w1,w2]
x0 = [2 1 1.5 0.5];

% Defining the cost function
fun = @(x)cost_function(x,T);

% Bounds on x = [a1, a2, w1,w2] - depend on chosen parametrization and
% considered robot
lb = [0.5 0.5 0.5 0.5];
ub = [1.5*pi 1.5*pi 1.5*pi 1.5*pi];

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

%First Trial
% x0 = [2 5 1.5 0.5];
% lb = [0.5 0.5 0.5 0.5];
% ub = [1.5*pi 1.5*pi 1.5*pi 1.5*pi];
