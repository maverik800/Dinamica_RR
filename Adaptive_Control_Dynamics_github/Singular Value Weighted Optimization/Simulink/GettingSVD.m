% getting Vectors from Sim

close all;
tout = out.tout.';

SV=out.SVD.';

figure
hold on


%% Singular Values

figure;
set(gcf,'color','w');

sgtitle('$ Singular\hspace{0.7mm} Values$','Interpreter','latex','FontSize',14,'FontWeight','bold');
subplot(2,3,1)
plot(tout,SV.Data(1,:),'LineWidth',1.6,'color','r');
grid on;
l1=legend('${\sigma}_1$','Interpreter','latex');
set(l1,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')


subplot(2,3,2)
plot(tout,SV.Data(2,:),'LineWidth',1.6,'color','r');
grid on;
l2=legend('${\sigma}_2$','Interpreter','latex');
set(l2,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')




subplot(2,3,3)
plot(tout,SV.Data(3,:),'LineWidth',1.6,'color','r');
grid on;
l3=legend('${\sigma}_3$','Interpreter','latex');
set(l3,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')


subplot(2,3,4)
plot(tout,SV.Data(4,:),'LineWidth',1.6,'color','r');
grid on;
l4=legend('${\sigma}_4$','Interpreter','latex');
set(l4,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')



subplot(2,3,5)
plot(tout,SV.Data(5,:),'LineWidth',1.6,'color','r');
grid on;
l5=legend('${\sigma}_5$','Interpreter','latex');
set(l5,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')


subplot(2,3,6)
plot(tout,SV.Data(6,:),'LineWidth',1.6,'color','r');
grid on;
l6=legend('${\sigma}_6$','Interpreter','latex');
set(l6,'FontSize',14)
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')


