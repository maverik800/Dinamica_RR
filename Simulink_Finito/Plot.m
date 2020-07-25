%% Lungo x
figure;
plot(out.x_des.Time,out.x_des.Data(:,1),'b','LineWidth',1.5); %desired
hold on
plot(out.xi_out.Time,out.xi_out.Data(:,1),'r','LineWidth',1.5); %actual
grid on
xlim([0 30])
xticks([0:2:30])
legend('xd','x')

%% Lungo y
figure;
plot(out.x_des.Time,out.x_des.Data(:,2),'b','LineWidth',1.5); %desired
hold on
plot(out.xi_out.Time,out.xi_out.Data(:,2),'r','LineWidth',1.5); %actual
grid on
xlim([0 30])
xticks([0:2:30])
legend('yd','y')


%% errors %%

% h(1) = subplot(2,2,1);
figure

hold on
plot(out.e_out.Time, out.e_out.Data(:,1));
% plot(e_out(1,:));
% hold on
plot(out.e_out.Time, out.e_out.Data(:,2));
% plot(e_out(2,:));
legend('e_1','e_2')
title('errors')
grid on
xlim([0 30])
ylim([-2 2])
xticks([0:2:30])

%% parameters %%

% h(2) = subplot(2,2,3);
figure
hold on
% plot(a1*ones(1,size(out.PI.Data,2)));
% plot(a2*ones(1,size(out.PI.Data,2)));
plot(out.PI.Time, out.PI.Data(:,1));
plot(out.PI.Time, out.PI.Data(:,2));
legend('a_{est_1}','a_{est_2}')
title('params')
grid on
xlim([0 30])
% ylim([0.5 20])
xticks([0:2:30])

%% Plot motion %%
% Getting Vectors from Sim

% e_out = out.e_out.Data.';
% q_out = out.q_out.Data.';
% x_des = out.x_des.Data.';
% PI = out.PI.Data.';
% tout = out.tout.';
% 
% a1 = pi_param(1);
% a2 = pi_param(2);
% a3 = pi_param(3);
% a4 = pi_param(4);
% 
% figure;
% 
% Ts = 0.1*(tout(2)-tout(1));
% 
% clear ('v');
% c = 0;
% 
% for i=1:1:size(q_out,2)
%     cla(figure)
%     text(2.2,2.2,['(' num2str(i) ')'])
%     plot(x_des(1,:),x_des(2,:),'r');
%     L(1)= plot_robot(q_out(:,i),[a1;a2;a3;a4],1);
%     L(2)= plot_robot(q_out(:,i),PI(:,i),0);
%     legend(L, {'real robot','estimated robot'})
%     axis equal
%     axis ([-2 2 -2 2])
%     grid on
%     title('robot motion')
%     pause(Ts)
%     v(i) = getframe(gcf); %capturing frames for recording
%     c = c +1;
%     if c == 10
%         close 1 2 3 4 5 6 7 8 9 10
%         c = 0;
%     end
%     
% end
%%

%recording
video = VideoWriter('Robot_DR.avi','Uncompressed AVI');
open(video);
writeVideo(video,v);
close(video);