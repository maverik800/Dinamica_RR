% pi_param (two links)

pi_param = [1;0.333333333333333;1;0.333333333333333];

% Initial pi_param guess

pi_hat_0 = pi_param *(1+0.1);% 10%

%initial q configuration of Robot

qInitial_0 = [1;1.2]';


%% Lissajous Parameters

A=0.9000;
a=0.0678;
delta=1.4642;
B=1.0198;
b=0.1697;