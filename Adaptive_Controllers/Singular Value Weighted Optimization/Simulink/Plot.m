%% PLOTS

f = figure;
f.WindowState = 'maximized';
pause(0.1)

% Getting Vectors from Sim
e_out = out.err.Data.';
q_out = out.q_out.Data.';
x_des = out.x_des.Data.';
PI = out.PI.Data.';
% svd = out.SVD.Data.';
norm = out.Norm.Data.';
tout = out.tout.';


% errors

h(1) = subplot(2,2,1);
hold on
plot(e_out(1,:),'LineWidth',1.8);
hold on
plot(e_out(2,:),'LineWidth',1.8);
legend('e_1','e_2')
title('Error (qd - q)','Interpreter','latex','FontSize',14,'FontWeight','bold')
grid on
xlim([0 1000])
% ylim([-2 2])
xticks([0:100:1000])

% norm
h(2) = subplot(2,2,2);
plot(norm(1,:),'LineWidth',1.8);
grid on
title('Norm of the Error','Interpreter','latex','FontSize',14,'FontWeight','bold')
xlim([0 1000])
ylim([0 7])
xticks([0:100:1000])

% svd
% h(3) = subplot(3,3,3);
% plot(svd);

% parameters link 1
h(4) = subplot(2,2,3);
a = pi_param_hat_0;
hold on
plot(a(1)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8,'color','b','LineStyle','-.');
plot(a(2)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8,'color','m','LineStyle','-.');
plot(a(3)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8,'color','r','LineStyle','-.');
plot(out.PI.Time, out.PI.Data(:,1),'LineWidth',1.8,'color','b');
plot(out.PI.Time, out.PI.Data(:,2),'LineWidth',1.8,'color','m');
plot(out.PI.Time, out.PI.Data(:,3),'LineWidth',1.8,'color','r');
legend('m1_{i_1}','mom1_{i_2}','mom2_{i_3}','m1','mom1','mom2')
title('Estimated paramters vs Real Parameters of Link 1','Interpreter','latex','FontSize',14,'FontWeight','bold')
grid on
xlim([0 1000])
% ylim([0.5 6])
xticks([0:100:1000])
% parameters link 2
h(4) = subplot(2,2,4);
hold on
plot(a(4)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8);
plot(a(5)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8);
plot(a(6)*ones(1,size(out.PI.Data,1)),'LineWidth',1.8);
plot(out.PI.Time, out.PI.Data(:,4),'LineWidth',1.8);
plot(out.PI.Time, out.PI.Data(:,5),'LineWidth',1.8);
plot(out.PI.Time, out.PI.Data(:,6),'LineWidth',1.8);
legend('m2_{i_4}','mom1_{i_5}','mom2_{i_6}','m2','mom1','mom2')
title('Estimated Parameters vs Real Paramters Link 2','Interpreter','latex','FontSize',14,'FontWeight','bold')
grid on
xlim([0 1000])
% ylim([0.5 6])
xticks([0:100:1000])

sgtitle('Simulation with 40% of the Estimation Error','Interpreter','latex','FontSize',14,'FontWeight','bold')

