clear all;
clc;
%%
robot = rigidBodyTree('DataFormat','column','MaxNumBodies',3);

L1 = 1;
L2 = 1;

body = rigidBody('link1');
joint = rigidBodyJoint('joint1', 'revolute');
setFixedTransform(joint,trvec2tform([0 0 0]));
joint.JointAxis = [0 0 1];
body.Joint = joint;
addBody(robot, body, 'base');


body = rigidBody('link2');
joint = rigidBodyJoint('joint2','revolute');
setFixedTransform(joint, trvec2tform([L1,0,0]));
joint.JointAxis = [0 0 1];
body.Joint = joint;
addBody(robot, body, 'link1');


body = rigidBody('tool');
joint = rigidBodyJoint('fix1','fixed');
setFixedTransform(joint, trvec2tform([L2, 0, 0]));
body.Joint = joint;
addBody(robot, body, 'link2');

showdetails(robot)
%% Define the trajectory
%First optimization p0 = [1; 0.5; pi/3; 1; 0.2];
A = 0.9972;
a = 0.4881; 
delta = 1.0436; 
B = 1.0044;
b = 0.223;

%Second optimization p0 = [0.7; 1.8; pi/4; 0.95; 1.5]
% A = 0.8221;
% a = 1.9014; 
% delta = 0.8496; 
% B = 1.023;
% b = 1.475;


t = (0:0.5:20)'; % Time
count = length(t);
x = A*sin(a*t+delta);
y = B*sin(b*t);
z = 0*t;


% %% Inverse Kinematic Solver

q0 = homeConfiguration(robot);
ndof = length(q0);
qs = zeros(count, ndof);


ik = inverseKinematics('RigidBodyTree', robot);
weights = [0, 0, 0, 1, 1, 0];
endEffector = 'tool';


% Starting from the Initial Position of Desired Twist 
x_0 = A*sin(delta);
y_0 = 0;
z_0 = 0;

qInitial = q0;
qInitial_0 = ik(endEffector,trvec2tform([x_0; y_0; z_0]'), weights, qInitial);


% %% Inverse Kinematics

qInitial = qInitial_0;
for i = 1:count
    % Solve for the configuration satisfying the desired end effector
    % position
    point = [x(i) y(i) z(i)];
    qSol = ik(endEffector,trvec2tform(point), weights, qInitial);
    % Store the configuration
    qs(i,:) = qSol;
    % Start from prior solution
    qInitial = qSol;
end
%% Animate the solution %%

% figure 
% show(robot,qs(1,:)');
% view(2)
% ax = gca;
% ax.Projection = 'orthographic';
% hold on
% plot(x,y,'k')
% 
% framesPerSecond = 6;
% r = rateControl(framesPerSecond);
% for i = 1:count
%     show(robot,qs(i,:)','PreservePlot',false);
%     drawnow
%     waitfor(r);
% end

%% Dynamic Parameters %%

%link1

l1 = 1;
l2 = 1;

% % Masses
% m1 = 0.5;
% m2 = 0.5;
% 
% a1 = l1/2;
% a2 = l2/2;
% 
% % Moment First Order
% 
% pi_1_1 = m1*l1*(l1-a1); %pi_primoordine_numero del link
% pi_1_2 = m2*l2*(l2-a2);
% 
% % Moment Second Order
% 
% pi_2_1 = (m1*l1^2)/12;
% pi_2_2 = (m2*l2^2)/12;


% pi_param (two links)

pi_param = [0.5000; 0.1667; 0.5000; 0.1667];

% pi_param = [0.5000;0.2500;0.1667;0.5000;0.2500;0.1667]; %l1 & l2 positive

% Initial pi_param guess

pi_hat_0 = pi_param*(1+0.01);

%% Lissajous Trajectory Parameters
 
fext = zeros(6,3);

