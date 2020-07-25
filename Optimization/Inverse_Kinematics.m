function [q1,q2,q1_dot,q2_dot,q1_ddot,q2_ddot] = Inverse_Kinematics(x,y,l1,l2,t)

%Compute the Inverse Kinematics of an RR planar robot

cos_q2 = (x.^2+y.^2-l1^2-l2^2)/(2*l1*l2);
sin_q2 = sqrt(1-(cos_q2).^2);

q2 = atan2(sin_q2,cos_q2);

b = l2*sin_q2;
a = l1+l2*cos_q2;

q1 = atan2(y,x) - atan2(b,a);

%Computing the derivative of the q
%dot_q2 = datan2(a,b)/dt = (dot_a*b - a*dot_b) / a^2 + b^2
dot_y2 = diff(sin_q2,t);
dot_x2 = diff(cos_q2,t);

q2_dot = (dot_y2.*cos_q2 - sin_q2.*dot_x2) ./ (cos_q2.^2 + sin_q2.^2);

%dot_q1 = datan2(a,b)/dt = (dot_a*b - a*dot_b) / a^2 + b^2
% atan2(y,x)

dot_y = diff(y,t);
dot_x = diff(x,t);

q11 = (dot_y.*x - y.*dot_x) ./ (x.^2 + y.^2);

%atan2(l2*sin_q2,l1+l2*cos_q2)
dot_y1 = diff(b,t);
dot_x1 = diff(a,t);

q12 = (dot_y1.*(l1+l2*cos_q2) - (l2*sin_q2).*dot_x1) ./ ((l1+l2*cos_q2).^2 + (l2*sin_q2).^2);

q1_dot = q11 - q12;

% Computing the derivative of ddot_q

q2_ddot = simplify(diff(q2_dot,t));
q1_ddot = simplify(diff(q1_dot,t));

% den2 = (cos_q2.^2 + sin_q2.^2);
% 
% % q2_dot = (dot_y2.*cos_q2 - sin_q2.*dot_x2) / (cos_q2.^2 + sin_q2.^2);
% ddot_y2 = diff(dot_y2,t);
% ddot_x2 = diff(dot_x2,t);
% 
% q2ddt = ((ddot_y2.*cos_q2 + dot_y2.*dot_x2).*den2 - dot_y2.*cos_q2.*(2*cos_q2+2*sin_q2) - (dot_y2.*dot_x2 + sin_q2.*ddot_x2).*den2 + sin_q2.*dot_x2.*(2*sin_q2 + 2*cos_q2)) ./ den2.^2;
% q2_ddot = simplify(q2ddt);
% 
% % ddq11
% ddot_y = diff(dot_y,t);
% ddot_x = diff(dot_x,t);
% 
% den = x.^2 + y.^2;
% 
% ddq11 = ((ddot_y.*x + dot_y.*dot_x).*den - dot_y.*x.*(2*y + 2*x) - (dot_y.*dot_x + y.*ddot_x).*den + y.*dot_x.*(2.*y + 2.*x)) ./ den.^2;
% 
% % ddq21
% 
% ddot_x1 = diff(dot_y,t);
% ddot_y1 = diff(dot_x1,t);
% 
% den1 = (l1+l2*cos_q2).^2 + (l2*sin_q2).^2;
% 
% ddq12 = ((ddot_y1.*a + dot_y1.*dot_x1).*den1 - dot_y1.*a.*(2*b + 2*a) - (dot_y1.*dot_x1 + b.*ddot_x1).*den1 + b.*dot_x1.*(2*b + 2*a)) ./ den1.^2;
% 
% q1_ddot = simplify(ddq11 + ddq12);

end