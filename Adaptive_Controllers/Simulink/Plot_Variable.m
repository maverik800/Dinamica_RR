% getting Vectors from Sim

close all;
tout = out.tout.';
% Estimated Parameters pi_hat
PI = out.PI.Data.';
%Norm of the error 
Norm = out.Norm.Data.';
%svd
svd = out.SVD.Data(6,:).';

x = 10; %error estimation (%)

%% First Link


%Real Parameters
figure
hold on

plot(tout,pi_param(1)*ones(size(tout)),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
plot(tout,pi_param(2)*ones(size(tout)),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
plot(tout,pi_param(3)*ones(size(tout)),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2


%Estimated Parameters

plot(tout,PI(1,:),'LineWidth',1.8,'color','b');%m1
plot(tout,PI(2,:),'LineWidth',1.8,'color','r');%m1*(l1-a1)
plot(tout,PI(3,:),'LineWidth',1.8,'color','m');%Izz1+m1*(l1-a1)^2

grid on
%$\hat{\pi}^{(j)}_{i}$  parametro i-esimo del j-esimo link.
l1=legend('${\pi}^{(1)}_{1}$','${\pi}^{(1)}_{2}$','${\pi}^{(1)}_{3}$','$\hat{\pi}^{(1)}_{1}$','$\hat{\pi}^{(1)}_{2}$','$\hat{\pi}^{(1)}_{3}$','Interpreter','latex');
set(l1,'FontSize',14)
title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm}of\hspace{0.7mm} the\hspace{0.7mm} 1st\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
ylim([-1 2])
yticks([-1:0.5:2])
text(500,-0.7,['Relative Error  = ', num2str(x),'%'],'FontSize',14);


% Second Link

figure
hold on

%Real Parameters

plot(tout,pi_param(4)*ones(size(tout)),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
plot(tout,pi_param(5)*ones(size(tout)),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
plot(tout,pi_param(6)*ones(size(tout)),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2


%Estimated Parameters

plot(tout,PI(4,:),'LineWidth',1.8,'color','b');%m2
plot(tout,PI(5,:),'LineWidth',1.8,'color','r');%m2*(l2-a2)
plot(tout,PI(6,:),'LineWidth',1.8,'color','m');%Izz2+m2*(l2-a2)^2

grid on
l1=legend('${\pi}^{(2)}_{1}$','${\pi}^{(2)}_{2}$','${\pi}^{(2)}_{3}$','$\hat{\pi}^{(2)}_{1}$','$\hat{\pi}^{(2)}_{2}$','$\hat{\pi}^{(2)}_{3}$','Interpreter','latex');
set(l1,'FontSize',14)
title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} 2nd\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
ylim([-1 2])
yticks([-1:0.5:2])
text(500,-0.7,['Relative Error  = ', num2str(x),'%'],'FontSize',14);


% Norm of the error
figure
plot(tout,Norm,'LineWidth',1.8,'color','r');
grid on
l3=legend('$||{\pi}-\hat{\pi}||$','Interpreter','latex');
set(l3,'FontSize',14)
title('$ Norm\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} Estimated\hspace{0.7mm} Error  $','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
ylim([-0.5 2])
yticks([-0.5:0.5:2])
text(500,0,['Relative Error  = ', num2str(x),'%'],'FontSize',14);

% SVD sigma min
figure 
plot(tout,svd,'LineWidth',1.8,'color','k');
grid on
l3=legend('${\sigma_{min}}$','Interpreter','latex');
set(l3,'FontSize',14)
title('Smallest Singular Value','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
% ylim([-0.5 2])
% yticks([-0.5:0.5:2])

%% Zoom Second Link


figure
hold on
w = 28874:1:32074; % 900s to 1000s 

%Real Parameters

plot(tout(w),pi_param(4)*ones(size(tout(w))),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
plot(tout(w),pi_param(5)*ones(size(tout(w))),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
plot(tout(w),pi_param(6)*ones(size(tout(w))),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2


%Estimated Parameters

plot(tout(w),PI(4,w),'LineWidth',1.8,'color','b');%m2
plot(tout(w),PI(5,w),'LineWidth',1.8,'color','r');%m2*(l2-a2)
plot(tout(w),PI(6,w),'LineWidth',1.8,'color','m');%Izz2+m2*(l2-a2)^2

grid on
l1=legend('${\pi}^{(2)}_{1}$','${\pi}^{(2)}_{2}$','${\pi}^{(2)}_{3}$','$\hat{\pi}^{(2)}_{1}$','$\hat{\pi}^{(2)}_{2}$','$\hat{\pi}^{(2)}_{3}$','Interpreter','latex');
set(l1,'FontSize',14)
title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} 2nd\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
ylim([-1 1.4])
yticks([-1:0.2:1.4])
xlim([tout(w(1)) tout(w(end))])
text(500,30,['Relative Error  = ', num2str(x),'%'],'FontSize',14);

% Zoom First Link

figure
hold on

%Real Parameters

plot(tout(w),pi_param(1)*ones(size(tout(w))),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
plot(tout(w),pi_param(2)*ones(size(tout(w))),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
plot(tout(w),pi_param(3)*ones(size(tout(w))),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2


%Estimated Parameters

plot(tout(w),PI(4,w),'LineWidth',1.8,'color','b');%m2
plot(tout(w),PI(5,w),'LineWidth',1.8,'color','r');%m2*(l2-a2)
plot(tout(w),PI(6,w),'LineWidth',1.8,'color','m');%Izz2+m2*(l2-a2)^2

grid on
l1=legend('${\pi}^{(2)}_{1}$','${\pi}^{(2)}_{2}$','${\pi}^{(2)}_{3}$','$\hat{\pi}^{(2)}_{1}$','$\hat{\pi}^{(2)}_{2}$','$\hat{\pi}^{(2)}_{3}$','Interpreter','latex');
set(l1,'FontSize',14)
title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} 1st\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
ylim([-1 1.4])
yticks([-1:0.2:1.4])
xlim([tout(w(1)) tout(w(end))])
text(500,30,['Relative Error  = ', num2str(x),'%'],'FontSize',14);

% % %% Zoom Optimal
% % 
% % 
% % %% Zoom Second Link
% % 
% % 
% % figure
% % hold on
% % 
% % %Real Parameters
% % 
% % plot(tout(70866:1:83222),pi_param(4)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
% % plot(tout(70866:1:83222),pi_param(5)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
% % plot(tout(70866:1:83222),pi_param(6)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2
% % 
% % 
% % %Estimated Parameters
% % 
% % plot(tout(70866:1:83222),PI(4,70866:1:83222),'LineWidth',1.8,'color','b');%m2
% % plot(tout(70866:1:83222),PI(5,70866:1:83222),'LineWidth',1.8,'color','r');%m2*(l2-a2)
% % plot(tout(70866:1:83222),PI(6,70866:1:83222),'LineWidth',1.8,'color','m');%Izz2+m2*(l2-a2)^2
% % 
% % grid on
% % l1=legend('${\pi}^{(2)}_{1}$','${\pi}^{(2)}_{2}$','${\pi}^{(2)}_{3}$','$\hat{\pi}^{(2)}_{1}$','$\hat{\pi}^{(2)}_{2}$','$\hat{\pi}^{(2)}_{3}$','Interpreter','latex');
% % set(l1,'FontSize',14)
% % title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} 2nd\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
% % xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
% % ylim([-1.2 3])
% % yticks([-1.2:0.2:3])
% % xlim([tout(70866) tout(83222)])
% % text(500,30,['Relative Error  = ', num2str(10),'%'],'FontSize',14);
% % 
% % %% Zoom First Link
% % 
% % figure
% % hold on
% % 
% % %Real Parameters
% % 
% % plot(tout(70866:1:83222),pi_param(1)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','b','LineStyle','-.');%m1
% % plot(tout(70866:1:83222),pi_param(2)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','r','LineStyle','-.');%m1*(l1-a1)
% % plot(tout(70866:1:83222),pi_param(3)*ones(size(tout(70866:1:83222))),'LineWidth',1.8,'color','m','LineStyle','-.')%Izz1+m1*(l1-a1)^2
% % 
% % 
% % %Estimated Parameters
% % 
% % plot(tout(70866:1:83222),PI(1,70866:1:83222),'LineWidth',1.8,'color','b');%m2
% % plot(tout(70866:1:83222),PI(2,70866:1:83222),'LineWidth',1.8,'color','r');%m2*(l2-a2)
% % plot(tout(70866:1:83222),PI(3,70866:1:83222),'LineWidth',1.8,'color','m');%Izz2+m2*(l2-a2)^2
% % 
% % grid on
% % l1=legend('${\pi}^{(2)}_{1}$','${\pi}^{(2)}_{2}$','${\pi}^{(2)}_{3}$','$\hat{\pi}^{(2)}_{1}$','$\hat{\pi}^{(2)}_{2}$','$\hat{\pi}^{(2)}_{3}$','Interpreter','latex');
% % set(l1,'FontSize',14)
% % title('$ Real\hspace{0.5mm} vs.\hspace{0.7mm} Estimated\hspace{0.7mm}Parameters\hspace{0.7mm} of\hspace{0.7mm} the\hspace{0.7mm} 1st\hspace{0.7mm} link $','Interpreter','latex','FontSize',14,'FontWeight','bold');
% % xlabel('$Time [s]$','Interpreter','latex','FontSize',14,'FontWeight','bold')
% % ylim([-1.2 3])
% % yticks([-1.2:0.2:3])
% % xlim([tout(70866) tout(83222)])
% % text(500,30,['Relative Error  = ', num2str(10),'%'],'FontSize',14);
% % 
% % 
