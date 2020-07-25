clear all
clc
%% Estimation of optimal trajectory (RR planar)
digits(2)
format short
% Manipulators Parameters

l1 = 1;
l2 = 1;

syms A a delta B b 
syms t
assume(t>=0)

p = [A, a, delta, B, b].';

%% Desired trajectory
[x,y] = Lissajous(A,a,delta,B,b,t);
[q1,q2,q1_dot,q2_dot,q1_ddot,q2_ddot] = Inverse_Kinematics(x,y,l1,l2,t); %intrinsic semplification in the function

%% Kinematic Regressor RR
Y = Regressor_DRR(q1,q2,q1_dot,q2_dot,q1_dot,q2_dot,q1_ddot,q2_ddot);

%% Compute Gramian matrix
Y_t_Y = (Y.')*Y;

%% Starting the optimization of the trajectory
h = 7e13; %choosing the step size

p_old = [0;0;0;0;0];

%Initial guess:
p0 = [1; 0.5; pi/3; 1; 0.2];

c = 0; %counter of the loop
disp('Starting the optimization with Gradient Discent');

tic
while abs(norm(p0 - p_old)) > 8e-4 && c <= 150

    p_old = p0;

    A = p_old(1);
    a = p_old(2);
    delta = p_old(3);
    B = p_old(4);
    b = p_old(5);
    
    %calculating the gramian around the initial guess
    Y_only_t = vpa(subs(Y_t_Y));
    
    %Integration
    gramian = cell(4,4);
    grm1 = [];
tic  
    for j= 1:size(Y_only_t,2)
     for i = 1:size(Y_only_t,1)
         fun = matlabFunction(Y_only_t(i,j));
         gramian {i,j} = fun;
     end
    end
    
        tic
    for j= 1:size(Y_only_t,2)
     for i = 1:size(Y_only_t,1)
            grm1(i,j) = integral(cell2mat(gramian(i,j)),0,10,'RelTol',1e-3);
     end
    end
toc

    %% Calculating the smallest eigenvalue for find the eigenvector
    [eigenvector,eigenvalues] = eig(grm1);
    %Assosiating the eigenvector to vmin and do the operation vmin' Y Y' vmin
    vmin = vpa(eigenvector(:,1));

    vmin_t = vmin.';
    
    %% vmin" * Y_t_Y * vmin
    vYv = vmin_t*Y_t_Y*vmin;
    vYv = vpa(vYv);
    
    %% Calculating the jacobian
    jacGram = (jacobian(vYv,p)).';
    jacGram_Pi = subs(jacGram);
    jacGram_Pi = vpa(jacGram_Pi);

    %% Integrating again
    gramian = cell(size(jacGram_Pi,1),1);
    grm2 = [];
tic
     for i = 1:size(jacGram_Pi,1)
         fun = matlabFunction(jacGram_Pi(i));
         gramian {i} = fun;
     end
    
     for i = 1:size(jacGram_Pi,1)
            grm2(i) = integral(cell2mat(gramian(i)),0,10,'RelTol',1e-3);
     end
toc
    
    %% Iterating gradient discent
    p0 = p0 - h* (grm2.');
    
    c = c+1;
    diff_norm = abs(norm(p0 - p_old));
    disp(diff_norm);
    disp(p0);
    disp(c);
    
    clear grm1 grm2

end
toc

disp('The parameters are:   ');
disp(p0);
disp('The number of loop for finding the optimal parameters are:');
disp(c);


