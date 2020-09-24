function [pi_param] = RR_real_params(m1,m2,a1,a2,l1,l2,Izz1,Izz2)

% pg1_x, pg1_y, pg2_x, pg2_y sono coordinate dei centri di massa di ogni
% link in terne DH
% Izz1_g, Izz2_g sono le inerzie baricentriche rispetto al polo G (centro
% di massa, e NON ancora espresse e  riportate nel polo O_i della terna DH
% locale di ciascun link)

% Ixx_g, Iyy_g, e tutti i termini "misti"  non si considerano(corrispondono 
% a tutti gli "0" nel vettore pi_param), in quanto siamo nel piano. 
% E' importante solamente Izz_g. 

pi_param1 = [m1; m1*(l1-a1); Izz1 + m1.*(l1-a1).^2];
pi_param2 = [m2; m2*(l2-a2); Izz2 + m2.*(l2-a2).^2];

pi_param = [pi_param1; pi_param2];

end