%% Visualize Fourier Trajectory in the joints space (ref.De Luca Franka Emika Identification)
close all;
% Parameters: x =  [a_1 a_2 b_1 b_2 q0_1 q0_2 wf]


t= 0:0.01:20;
%% CASE II

% Fourier with l = 1 (1st harmonic)

%% Non optimized trajectory

l=1;

x0 = [11.3 7.2 4 2.9 0.6 0.3 0.5*pi];

a_1 = x0(1);
a_2 = x0(2);
b_1 = x0(3);
b_2 = x0(4);
q0_1 = x0(5);
q0_2 = x0(6);
wf = x0(7);

q1 = q0_1 - (b_1*cos(t*wf))/wf + (a_1*sin(t*wf))/wf;
q2 = q0_2 - (b_2*cos(t*wf))/wf + (a_2*sin(t*wf))/wf;

dq1 = a_1*cos(t*wf) + b_1*sin(t*wf);
dq2 = a_2*cos(t*wf) + b_2*sin(t*wf);

ddq1 = b_1*wf*cos(t*wf) - a_1*wf*sin(t*wf);
ddq2 = b_2*wf*cos(t*wf) - a_2*wf*sin(t*wf);



%% Joint Position

figure;
plot(t,q1,t,q2);
grid on
legend('q1','q2');

%% Joint velocity
figure;
plot(t,dq1,t,dq2);
grid on
legend('dq1','dq2');

%% Joint Acceleration
figure;
plot(t,ddq1,t,ddq2);
grid on
legend('ddq1','ddq2');


%% Optimized trajectory

l=1;

x = [11.3522 7.1170 3.9340 2.8793 0.4512 0.2933 2.0194];

a_1 = x(1);
a_2 = x(2);
b_1 = x(3);
b_2 = x(4);
q0_1 = x(5);
q0_2 = x(6);
wf = x(7);

q1 = q0_1 - (b_1*cos(t*wf))/wf + (a_1*sin(t*wf))/wf;
q2 = q0_2 - (b_2*cos(t*wf))/wf + (a_2*sin(t*wf))/wf;

dq1 = a_1*cos(t*wf) + b_1*sin(t*wf);
dq2 = a_2*cos(t*wf) + b_2*sin(t*wf);

ddq1 = b_1*wf*cos(t*wf) - a_1*wf*sin(t*wf);
ddq2 = b_2*wf*cos(t*wf) - a_2*wf*sin(t*wf);


%% Joint Position

figure;
plot(t,q1,t,q2);
grid on
legend('q1','q2');

%% Joint velocity
figure;
plot(t,dq1,t,dq2);
grid on
legend('dq1','dq2');

%% Joint Acceleration
figure;
plot(t,ddq1,t,ddq2);
grid on
legend('ddq1','ddq2');

close all;
