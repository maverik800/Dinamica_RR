%Construct Regressor

clear all;
clc;
close all;

syms a1 a2
syms gy % y-component of gravity
syms q1 q2 qd1 qd2 qrd1 qrd2 qrdd1 qrdd2 


[Y_full,pi_param_full,Y_2_6,pi_param_2_6] = Regressor_RR(q1,q2,qd1,qd2,qrd1,qrd2,qrdd1,qrdd2,gy);



%% OSSERVAZIONI

% 1) Se calcoli il regressore con gy = 0 ( ovvero il nostro caso di
% manipolatore planare in assenza di gravità), noterai che Y_full e Y_2_6
% NON DIPENDONO più da q1. Questo perchè gy moltiplica tutti i termini che
% hanno una qualche dipendenza da q1



% Può sembrare strano...allora ho confrontato il risultato con la funzione
% di Palleschi, ed effettivamente il suo regressore ha termini tipo
% "cos^2(q1) + sin^2(q1)", questi sono tutti 1! Ma se non applichi un
% "simplify" al Regressore, continua a portarseli dietro come se niente
% fosse.


% Praticamente la parte di ottimizzazione di Gradient Descent l'abbiamo
% fatta con un una variabile "dummy", che a prescindere dal valore che
% assume, non inciderà MAI all'interno di Y e dell'ottimizzazione,

% Potrebbe essere che la stima dinamica dei parametri non venisse per colpa
% dell'assenza di gravita?!