
% Studiul numeric a doi oscilatori cuplati

% A se vedea inceputul cursului 4 si 5

clc; clear all; close all

%  Scot ecuatiile de miscare din urmatoarele ecuatii
%  Obs: deplasarea o fac spra stanga -> elongatia deplasarii = x1 - x2
%  Corpul 1: F1 = Fe1 + Fe2 => m1a1 = -k1*x1 - k2*(x1-x2)
%  Corpul 2: F2 = Fe3 - Fe2 (in urma reactiunii) => m2a2 = -k3*x2 + k2*(x1-x2)
%  =>  m1a1 = -(k1 + k2)*x1 + k2*x2 => a1 = -(k1 + k2)/m1*x1 + k2/m1*x2
%      m2a2 = -(k3 + k2)*x2 + k2*x1 => a2 = -(k3 + k2)/m2*x2 + k2/m2*x1

%----------------------
m1 = 1;
m2 = 1;
k1 = 3;
k2 = 3;
k3 = 3;

alpha1 = (k1 + k2)/m1;
beta1 = k2/m1;
alpha2 = (k3 + k2)/m2;
beta2 = k3/m2;
%----------------------

Ts = 1;
% discretizarea variabilei timp

n1 = 10; % reprezentarea grafica a n1 Ts
n2 = 100; % numarul de intervale in care este discretizata Ts
N  = n1*n2 + 1; % numarul de momente de timp ale discretizarii
Delta_t = Ts/n2; % pasul de timp al discretizarii
t  = linspace(0, n1*Ts, N);

% CONDITII INITIALE 1
% cele doua corpuri sunt intial de deviate identic fata de pozitia lor de
% echilibru si au aceiasi viteza intiala.


x0 = 1; % cm -- amplitudine
v0 = 0; % cm/s

x10 = x0;
x20 = x0;

v10 = v0;
v20 = v0;

x1 = zeros(1, N);
x2 = zeros(1, N);

x1(1) = x10;
x2(1) = x20;

x1(2) = x1(1) + v10*Delta_t; 
x2(2) = x2(1) + v20*Delta_t;

for i = 2 : N-1
    x1(i+1) = 2*x1(i) - x1(i-1) - (alpha1*x1(i) - beta1*x2(i)) * (Delta_t)^2;
    x2(i+1) = 2*x2(i) - x2(i-1) - (alpha2*x2(i) - beta2*x1(i)) * (Delta_t)^2;
end

subplot(2, 1, 1);
% solutia numerica pentru x1
plot(t, x1, 'b'); hold on 


ylabel('x_1 / cm')
title('Oscilatii in faza cu pulsatia \omega_s')

subplot(2, 1, 2);
% solutia numerica a lui x2
plot(t, x2, 'r'); hold on

% solutie analitica a lui x2

title('Oscilatii in faza cu pulsatia \omega_d')

%------------------------------------------------------------------------

% CONDITII INITIALE 2
% cele doua corpuri sunt oscilatii cu elongatii opuse si viteze opuse.

x0 = 1; % cm -- amplitudine
v0 = 0; % cm/s

x10 = x0;
x20 = -x0;

v10 = v0;
v20 = -v0;

x1 = zeros(1, N);
x2 = zeros(1, N);

x1(1) = x10;
x2(1) = x20;

x1(2) = x1(1) + v10*Delta_t; 
x2(2) = x2(1) + v20*Delta_t;

for i = 2 : N-1
    x1(i+1) = 2*x1(i) - x1(i-1) - (alpha1*x1(i) - beta1*x2(i)) * (Delta_t)^2;
    x2(i+1) = 2*x2(i) - x2(i-1) - (alpha2*x2(i) - beta2*x1(i)) * (Delta_t)^2;
end

figure

subplot(2, 1, 1);
% solutia numerica pentru x1
plot(t, x1, 'b'); hold on 


ylabel('x_1 / cm')
title('Oscilatii in opozitie de faza cu pulsatia \omega_d')

subplot(2, 1, 2);
% solutia numerica a lui x2
plot(t, x2, 'r'); hold on


ylabel('x_2 / cm')
xlabel('t (s)')
title('Oscilatii in opozitie de faza cu pulsatia \omega_d')

%------------------------------------------------------------------------


% CONDITII INITIALE 3
% cele doua miscari au conditii initiale oarecare

x10 = 1; % cm
x20 = 2.5*x10;

v10 = v0; % cm/2
v20 = v0;

x1 = zeros(1, N);
x2 = zeros(1, N);

x1(1) = x10;
x2(1) = x20;

x1(2) = x1(1) + v10*Delta_t; 
x2(2) = x2(1) + v20*Delta_t;

for i = 2 : N-1
    x1(i+1) = 2*x1(i) - x1(i-1) - (alpha1*x1(i) - beta1*x2(i)) * (Delta_t)^2;
    x2(i+1) = 2*x2(i) - x2(i-1) - (alpha2*x2(i) - beta2*x1(i)) * (Delta_t)^2;
end

figure

% solutia numerica pentru x1
plot(t, x1, 'b'); hold on 
% solutia numerica a lui x2
plot(t, x2, 'r'); hold on
ylabel('x_1 , x_2 / cm')
xlabel('t (s)')
title('Suprapuneri de pulsatii \omega_s si \omega_d')
