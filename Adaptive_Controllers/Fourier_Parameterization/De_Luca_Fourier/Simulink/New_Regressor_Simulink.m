function [Y] = New_Regressor_Simulink(in)


q1 = in(1);
q2 = in(2);
dq1 = in(3);
dq2 = in(4);
dqr1 = in(5);
dqr2 = in(6);
ddqr1 = in(7);
ddqr2 = in(8);

g = 9.81;
a1 = 1; a2 = 1;

%% Build Regressor based on slides Gabiccini (notes to be written in LaTeX)

% Elements of first row
y11 = a1.^2.*ddqr1 + a1.*g.*cos(q1);
y12 = 2.*a1.*ddqr1 + g.*cos(q1);
y13 = ddqr1;
y15 = (a1.^2 + 2.*a1.*a2.*cos(q2) + a2.^2).*ddqr1 + ...
    (a1.*a2.*cos(q2) + a2.^2)*ddqr2 - a1.*a2.*sin(q2).*dq2.*dqr1 - ...
    a1.*a2.*sin(q2).*(dq1 + dq2).*dqr2 + a1.*g.*cos(q1) + ... 
    a2.*g.*cos(q1 + q2);
y16 = (2.*a1.*cos(q2) + 2.*a2).*ddqr1 + (a1.*cos(q2) + 2.*a2).*ddqr2 - ...
    a1.*sin(q2).*dq2*dqr1 - a1.*sin(q2).*(dq1 + dq2)*dqr2 + g.*cos(q1 + q2);
y17 = ddqr1 + ddqr2;

% Elements of second row
y21 = 0;
y22 = 0;
y23 = 0;
y25 = (a1.*a2.*cos(q2) + a2.^2).*ddqr1 + a2.^2.*ddqr2 + ...
    a1.*a2.*sin(q2).*dq1*dqr1 + a2.*g.*cos(q1 + q2);
y26 = (a1.*cos(q2) + 2.*a2).*ddqr1 + 2.*a2.*ddqr2 + ...
    a1.*sin(q2).*dq1.*dqr1 + g.*cos(q1 + q2);
y27 = ddqr1 + ddqr2;

% Putting things together
Y = [y11, y12, y13, y15, y16, y17;
    y21, y22, y23, y25, y26, y27];

end






