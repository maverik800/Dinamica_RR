function [Y_full,pi_param_full,Y_2_6,pi_param_2_6] = Regressor_RR(q1,q2,qd1,qd2,qrd1,qrd2,qrdd1,qrdd2,gy)


%% Construct Regressor RR pag.11/15 Article ""Explicit Lagrangian Formulation of the Dynamic Regressors for Serial Manipulators""

%link's length

a1 = 1;
a2 = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Construct Regressor block related to the 1-st link: 

%Y_r_(1) = [Y_0r_(1) Y_1r_(1) Y_2r_(1)]

%Y_0r_(1)

X_dot_0r_1 = [a1.^2.*qrdd1; 0];

W_0r_1 = zeros(2,1);

Z_0_1 = [a1.*cos(q1).*gy; 0];

Y_0r_1 = X_dot_0r_1 - W_0r_1 + Z_0_1;



%Y_1r_(1)

X_dot_1r_1 = [2*a1.*qrdd1 0 0; 0 0 0 ];

W_1r_1 = zeros(2,3);

Z_1_1 = [cos(q1).*gy -gy.*sin(q1) 0; 0 0 0];

Y_1r_1 = X_dot_1r_1 - W_1r_1 + Z_1_1;




%Y_2r_(1)

X_dot_2r_1 = [0 0 0 0 0 qrdd1; 0 0 0 0 0 0];

W_2r_1 = zeros(2,6);

Y_2r_1 = X_dot_2r_1 - W_2r_1;


Y_r_1 = [Y_0r_1 Y_1r_1 Y_2r_1];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Construct Regressor block related to the 2-nd link: 


b1 = qrd2.*qd1 + qrd1.*qd2;
b2 = qrd2.*qd1 + (qrd1 + qrd2).*qd2;
b3 = 2*qrdd1 + qrdd2;
b4 = qrdd1 + qrdd2;
b5 = b3.*qd1 + qrdd1.*qd2;
b6 = a1.*a2.*sin(q2);
b7 = qrd2.*qd1 + qrd1.*qd2;
b8 = a1.*a2.*cos(q2);
b9 = a1.*cos(q2);
b10 = a1.*sin(q2);



%Y_r_(2) = [Y_0r_(2) Y_1r_(2) Y_2r_(2)]


%Y_0r_(2)

X_dot_0r_2 = [-b6.*b7 - b6.*qrd2.*qd2 + a2.^2.*b4 + a1^2.*qrdd1 + b4.*b8; -0.5.*b6.*b7 + b8.*qrdd1 + a2.^2.*b4]; 

W_0r_2 = [0; -0.5*a1.*a2.*sin(q2).*b5];

Z_0_2 = [(a1.*cos(q1) + a2.*cos(q1+q2)).*gy; a2.*cos(q1+q2).*gy];

Y_0r_2 = X_dot_0r_2 - W_0r_2 + Z_0_2;




%Y_1r_(2)

X_dot_1r_2 = [2.*a2.*b4 + b9.*b3 - b10.*b2, -b9.*b2 - b10.*b3, 0; b9.*qrdd1 - 0.5.*b10.*b1 + 2.*a2.*b4, -0.5.*b9.*b1 - b10.*qrdd1, 0];

W_1r_2 = [0,0,0; -0.5.*a1.*sin(q2).*b5, -0.5.*a1.*cos(q2).*b5, 0];

Z_1_2 = [cos(q1+q2).*gy, -gy.*sin(q1+q2), 0; cos(q1+q2).*gy, -gy.*sin(q1+q2), 0];

Y_1r_2 = X_dot_1r_2 - W_1r_2 + Z_1_2;


%Y_2r_(2)

X_dot_2r_2 = [0,0,0,0,0, b4; 0,0,0,0,0,b4];

W_2r_2 = zeros(2,6);

Y_2r_2 = X_dot_2r_2 - W_2r_2;


Y_r_2 = [Y_0r_2 Y_1r_2 Y_2r_2];


%% Regressor RR Complete Y_r(q1,q2,qd1,qd2,qrd1,qrd2,qrdd1,qrdd2) = [Y_r_1 Y_r_2];

Y_full = [Y_r_1 Y_r_2];



%%Dynamic Parameters

m1 = 1; 
m2 = 1;

pg1_x = -a1/2; % Le coordinate dei centri di massa vengono espresse in terna locale DH ( vedi immagine DH)
pg1_y = 0;

pg2_x = -a2/2;
pg2_y = 0;


%Inertia (queste sono le inerzie baricentriche rispetto al polo G (centro
%di massa, e NON ancora espresse e  riportate nel polo O_i della terna DH
%locale di ciascun link)

% Ixx_g, Iyy_g, e tutti i termini "misti"  non si considerano(corrispondono a tutti gli "0" nel vettore pi_param), in quanto siamo nel piano. E' importante
% solamente Izz_g. 

%pi_param_1st link

Izz1_g = (1/12).*m1.*a1.^2; %% Valore che abbiamo considerato
Izz2_g = (1/12).*m2.*a1.^2;
pi_param1 = [m1; m1*pg1_x; m1*pg1_y; 0;0;0;0;0;0;Izz1_g + m1.*(a1-a1/2).^2];

pi_param2 = [m2; m2*pg2_x; m1*pg2_y; 0;0;0;0;0;0;Izz2_g + m1.*(a2-a2/2).^2];

pi_param_full= [pi_param1; pi_param2];

%% Regressor 2 X 6

% controllando il Regressore completo, solamente la prima, seconda, e
% decima colonna del Regressore relative al primo link sono colonne NON
% nulle e associati a termini NON nulli, quindi vanno considerati. per il
% secondo link è analogo: solamente l'undicesima, dodicesima e ventesima
% colonna sono associate a parametri non nulli.


Y_2_6 = [Y_full(:,1) Y_full(:,2) Y_full(:,10), Y_full(:,11) Y_full(:,12) Y_full(:,20)];
pi_param_2_6 = [pi_param1(1); pi_param1(2);pi_param1(10); pi_param2(1);pi_param2(2);pi_param2(10)];


end






