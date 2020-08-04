%% Optimization of trajectory using FMINCON on quadratic cost on s.v. of Gramian
clear all; close all; clc;

% REMEMBER THE PARAMETRIZATION USED IN YtY_computation for the trajectory
% The opt. variable is x =  [a_11, a_12, b_11, b_12, q0_1, q0_2, wf]

% Define integration window
T = 20;

% Weight on singular values
%  W = eye(6); W(5,5) = 1e12; W(6,6) = 1e18;
 W = eye(6); W(5,5) = 1e25; W(6,6) = 1e40;

% Defining the cost function
fun = @(x)cost_function(x, T, W);

% There are no linear constraints
A = [];
b = [];
Aeq = [];
beq = [];

% Bounds on x depend on chosen parametrization and considered robot
% lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];

lb = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
ub = [pi,pi,pi,pi,pi,pi,pi];

% Initial guess for x =  [a_11 a_12  b_11 b_12 q0_1 q0_2]
% Initial guess can be more random between bounds using rand()
% x0 = [68.5109, 9.3304, 87.2706, 94.2995, 9.7498, 84.6037, 90.9486] % This
% is a good initial guess
% x0 = lb + (ub - lb).*rand([1,7]);
x0 = [1 2 3 1 2 3 1];

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

% I found x = [6.2832, 6.2832, 6.2832, 6.2832, 1.5402, 0.1000, 6.2832] 
% with f = -sigma.'*W*sigma = -1.2615e+13 
% from x0 = [5.6648, 3.5036, 2.7424, 1.0422, 1.6306, 2.8662, 3.3943]
% exit_flag = 1 and sigma_min = 1e-5

% I found x = [6.2832, 6.2832, 6.2832, 6.2832, 1.5708, 6.2832, 6.2832] 
% with f = -sigma.'*W*sigma = -1.2632e+13 
% from x0 = [2.2929, 4.8803, 5.5516, 4.6390, 2.6130, 3.8357, 4.0641]
% exit_flag = 1 and sigma_min = 1e-5

% I found x = [6.2832, 6.2832, 6.2832, 6.2832, 6.2832, 0.2157, 6.2832] 
% with f = -sigma.'*W*sigma = -1.2632e+13 
% from x0 = [0.8882, 3.1680, 2.0197, 3.6774, 5.9345, 2.7398, 0.3048]
% exit_flag = 2 and sigma_min = 1e-5