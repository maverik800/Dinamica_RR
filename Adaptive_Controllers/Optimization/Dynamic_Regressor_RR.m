function Y_reg = Dynamic_Regressor_RR(q,qd,qdd)

l1= 1;
l2 =1;

a1 = l1/2;
a2 = l2/2;

y11 = a1^2 .* qdd(1);
y12 = 2*a1 .* qdd(1);
y13 = qdd(1);
y15 = (a1^2 + 2*a1*a2 .* cos(q(2))+ a2^2).*qdd(1) + (a1*a2 .* cos(q(2)) + a2^2) .* qdd(2) - 2*a1*a2 .* sin(q(2)) .* qd(1) .* qd(2) - a1*a2 .* sin(q(2)) .* qd(2).^2;
y16 = (2*a1 .* cos(q(2)) + 2*a2).*qdd(1) + (a1.*cos(q(2)) + 2*a2).*qdd(2) - 2*a1.*sin(q(2)) .* qd(1) .* qd(2) - a1.*sin(q(2)).*qd(2).^2;
y17 = qdd(1)+qdd(2);
y21 = 0;
y22 = 0;
y23 = 0;
y25 = (a1*a2.*cos(q(2))+a2^2).*qdd(1) + a2^2.*qdd(2)+a1*a2.*sin(q(2)).*qd(1).^2;
y26 = (a1.*cos(q(2))+2*a2).*qdd(1) + 2*a2.*qdd(2) + a1.*sin(q(2)).*qd(1).^2;
y27 = qdd(1)+qdd(2);

Y_reg = [y11, y12, y13, y15, y16, y17;
         y21, y22, y23, y25, y26, y27];

end