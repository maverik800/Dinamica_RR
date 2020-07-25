% Parameters of the RR planar
clc;
clear all;
m1 = 1;
m2 = 1;

l1 = 1;
l2 = 1;

% Masses
m = [m1; m2];

% Center of Mass

c1 = [-l1/2;0;0]; %-l1
c2 = [-l2/2;0;0]; %-l2

c=[c1,c2];

% Inertia 

Izz1 = (1/12)*(m1*l1^2);
Izz2 = (1/12)*(m2*l2^2);

I1 = [0,0,0;0,0,0;0,0,Izz1];

I2 = [0,0,0;0,0,0;0,0,Izz2];

I = [I1;I2];


%% Li-Slotine back-SteppingRegressor RR

[Y,pi_param] = Regressor_Li_Slotine(I,m,c);

matlabFunction(Y,'File','Regressor_DRR');