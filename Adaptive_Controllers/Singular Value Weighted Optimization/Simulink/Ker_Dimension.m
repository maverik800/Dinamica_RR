%% Getting Ker Dimension

close all;
tout = out.tout.';
dim1=out.dimKerYtY.';
dim2=out.dimKerIntYtY.';

% Check on Ker(Integral(Y_t_Y))

figure;
set(gcf,'color','w');
plot(tout,dim1.Data,'LineWidth',1.5,'color','r');
yticks([-1:1:5]);
ylim([-1 5])
grid on;
title('$$dim(\ker(Y^{T}Y))$$','Interpreter','latex','FontSize',14,'FontWeight','bold')
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')

% Check on Ker((Y_t_Y))
figure;
set(gcf,'color','w');
plot(tout,dim2.Data,'LineWidth',1.5,'color','r');
yticks([-1:1:5]);
ylim([-1 5])
grid on;
title('$$dim(\ker(\int_{T}^{T+\Delta} Y^{T}Y))$$','Interpreter','latex','FontSize',14,'FontWeight','bold')
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')


