% pi_param (two links)

m1 = 1;
m2 = 1;

Izz1 = (1/12)*m1*l1^2;

pi_param1 = [m1; m1*(l1-a1); Izz1 + m1.*(l1-a1).^2];
pi_param2 = [m2; m2*(l2-a2); Izz2 + m2.*(l2-a2).^2];

pi_param = [pi_param1; pi_param2];

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