clear all;
clc;
%% RR for Robotic Toolbox %%

%link

l1 = 1;
l2 = 1;
% % Masses
m1 = 1;
m2 = 1;

c1 = l1/2;
c2 = l2/2;

% % Moment First Order

pi_1_1 = m1*l1*(l1-c1); %pi_primoordine_numero del link
pi_1_2 = m2*l2*(l2-c2);

% % Moment Second Order

I1_zz = (m1*l1^2)/12;
I2_zz = (m2*l2^2)/12;

%Creating the DH classical form
dhparams = [l1 0 0 0;
    l2 0 0 0
    0 0 0 0];

%RR rigid body tree
rr = rigidBodyTree('MaxNumBodies',size(dhparams,1),'DataFormat','column');

%Defining the number of bodies
body1 = rigidBody('b1');
body2 = rigidBody('b2');
body3 = rigidBody('tool');

%Creating the revolute joints 
jnt1 = rigidBodyJoint('jnt1','revolute');
jnt2 = rigidBodyJoint('jnt2','revolute');
jnt3 = rigidBodyJoint('fix1','fixed');

%Attaching the robot to DH params
setFixedTransform(jnt1,dhparams(1,:),'dh');
setFixedTransform(jnt2,dhparams(2,:),'dh');
setFixedTransform(jnt3,dhparams(3,:),'dh');

%Specifyng link with joints 
body1.Joint = jnt1;
body2.Joint = jnt2;
body3.Joint = jnt3;

%Specifying the Dynamic Properties
body1.Mass = m1;
body1.CenterOfMass = [-c1, 0, 0]';
body1.Inertia = [0; 0; I1_zz; 0; 0; 0]';

body2.Mass = m2;
body2.CenterOfMass = [-c1-c2, 0, 0]';
body2.Inertia = [0; 0; I2_zz; 0; 0; 0]';


%Adding the rigid bodies to the tree
basename = rr.BaseName;
addBody(rr,body1,basename);
addBody(rr,body2,'b1');
addBody(rr,body3,'b2');

%%Calculating the center of mass of the robot
% comPos = centerOfMass(franka);

%%Configuring home configuration
q_home = homeConfiguration(rr);

%%Random configuration of the robot
configuration = randomConfiguration(rr);

showdetails(rr);

% %% Define the trajectory
A  = 0.5;
a  = 0.4;
delta = 0.5236;
B = 1;
b = 0.8;

t = (0:0.2:20)'; % Time
count = length(t);
x = A*sin(a*t+delta);
y = B*sin(b*t);
z = 0*t;


% %% Inverse Kinematic Solver

q0 = homeConfiguration(rr);
ndof = length(q0);
qs = zeros(count, ndof);


ik = inverseKinematics('RigidBodyTree', rr);
weights = [0, 0, 0, 1, 1, 0];
endEffector = 'tool';


% Starting from the Initial Position of Desired Twist 
x_0 = A*sin(delta);
y_0 = 0;
z_0 = 0;

qInitial = q0;
qInitial_0 = ik(endEffector,trvec2tform([x_0; y_0; z_0]'),weights,qInitial);


% %% Inverse Kinematics

qInitial = qInitial_0;
for i = 1:count
    % Solve for the configuration satisfying the desired end effector
    % position
    point = [x(i) y(i) z(i)];
    qSol = ik(endEffector,trvec2tform(point),weights,qInitial);
    % Store the configuration
    qs(i,:) = qSol;
    % Start from prior solution
    qInitial = qSol;
end
% %% Animate the solution %%

% figure 
% show(rr,qs(1,:)');
% view(2)
% ax = gca;
% ax.Projection = 'orthographic';
% hold on
% plot(x,y,'k')
% 
% framesPerSecond = 6;
% r = rateControl(framesPerSecond);
% for i = 1:count
%     show(rr,qs(i,:)','PreservePlot',false);
%     drawnow
%     waitfor(r);
% end

%%% Dynamic Parameters %%

% pi_param (two links)

pi_param = [1.0000;-0.5000;0.3333;1.0000;-0.5000;0.3333]; 

% Initial pi_param guess

pi_hat_0 = pi_param*(1+0.02);

fext = zeros(6,3);
