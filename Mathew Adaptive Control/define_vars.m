%% Define variables
clear all
close all
clc

% real parameters
a1 = 1;
a2 = 1;

% initial percentage error on params
int_a_err = 5;

% initialize jointstate
q_0 = [1.3 ; 4];

% control gains (suggested sim time = 500)
Ke = 8;
Kk = 2*[1 0; 0 1];

% trial traj
traj_pars = [0.2, 0.2, 0.2, 0.2, 1, 0.2, 0.2, 0.2, 0.2, 2];

%% Path params
x0 = 1; y0 = 1; R = 0.4; ni = 2; v = 0.1;

K = 1*[1 0; 0 1];