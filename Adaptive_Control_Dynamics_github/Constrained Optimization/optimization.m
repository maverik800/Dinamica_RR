%% Optimization of trajectory using FMINCON of all singular values of Gramian
% OPTIMIZATION transforming minimum lambda optimization as in paper
% EIGENVALUE AND SINGULAR VALUE OPTIMIZATION A. M. Blanco and J. A. Bandoni

clear all; close all; clc;

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory
% The opt. variable is x =  [a_11, a_12, b_11, b_12, q0_1, q0_2, wf, z]

% Define integration window
T = 20;

% Defining the cost function
fun = @(x)cost_function(x);

% There are no linear constraints
A = [];
b = [];
Aeq = [];
beq = [];

% Bounds on x depend on chosen parametrization and considered robot
lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1];
ub = [2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 2*pi, 1e3];

% Initial guess for x =  [a_11 a_12  b_11 b_12 q0_1 q0_2 wf]
% x0 = [15, 15, 15, 15, 0.9, 5, 0.5*pi, 10].*rand([1,8]);

% Initial guess can be more random between bounds using rand()
x0 = lb + (ub - lb).*rand([1,8]);

disp('x0 = '); disp(x0);

% No nonlinear constraints (it might be possible to insert here constraints
% on inverse kinematics, not sure)
nonlcon = @(x)constraint(x,T);

% Optimization Options
options = optimoptions('fmincon');
options.ObjectiveLimit = -1e100;            % Push minimization
options.SpecifyObjectiveGradient = true;    % Specify grad. for fast opt.

% Optimization Execution
disp('Started minimization.');
tic
[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
toc
disp('Finished minimization.');

% I found x = [30.0, 30.0, 30.0, 30.0, 0.1, 6.18, 6.28] 
% with f = -det(G+1e5*I) = -5.2e36 from x0 = [15 15 15 15 0.9 5 0.5*pi]

% I found x = 1e3*[0.004, 0.005, 0.006, 0.004, 0.005, 0.004, 0.005, 1.0] 
% with f = -det(G+1e5*I)^2 = -3.48e47 
% from x0 = [5.55, 1.85, 3.80, 0.26, 1.06, 5.26, 1.30, 829.96]