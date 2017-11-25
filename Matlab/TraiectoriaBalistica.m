
%Studiul numeric al miscarii balistice

%Un proiecdtil de masa m=0,8 kg este lansat cu viteza v0=800 m/s sub
%unghiul alfa. Lansarea se face de la suprafata pamantului pe un
%teren plat. Corpul intampina o forta de rezistenta la inaintare
%proportionala cu viteza, coeficientul de proportionalitate fiind
%r=(1/3)mg/v0. Sa se traseze graficele dependentei de timp ale vx, vy, v
%(modulul vitezei) precum si traiectoria proiectilului pana la cadere.

% [TEMA] Determinati valoare unghiului alpha pentru care bataia este
% maxima, pe baza aplicatiei din laborator
clc; clear all; close all

% Datele problemei:
g   = 9.81; %m/s^2
m   = 0.8;  %kg
v0  = 800;  %m/s
r   = (1/3)*m*g/v0;
tau = m/r; %s

% [Pas 1] Definim variabila discreta timp
t0      = 0;
tf      = 150; 
N       = 1601;
t       = linspace(t0,tf,N); 
Delta_t = t(2)-t(1);

% [Pas 2] 
% ---> Definim variabila unghiului alpha
a0            = 0;
af            = pi/2;
aN            = 1000;
alpha_val     = linspace(a0,af,aN);
bataia_maxima = 0; % bataia maxima
alpha         = 0; % unghiul alpha

% ---> Alocam spatiu de memorie pentru variabilele viteza si pozitie
vx = zeros(1,N);
vy = zeros(1,N);
 x = zeros(1,N);
 y = zeros(1,N);

% [Pas 3] Calculul vitezei si pozitiei la momentele t pentru intervalulul de
% valori [0,pi/2] al unghiului alpha 

for i_alpha = 1:aN
    % [Explicatie] Creez o noua traiectorie pentru fiecare valoare a
    % unghiului alpha din alpha_val
     vx_verif   = zeros(1,N);
     vy_verif   = zeros(1,N);
      x_verif   = zeros(1,N);
      y_verif   = zeros(1,N);
    v0x_verif   = v0*cos(alpha_val(i_alpha)); 
    v0y_verif   = v0*sin(alpha_val(i_alpha));
    vx_verif(1) = v0x_verif; 
    vy_verif(1) = v0y_verif;
  
    for i = 1:N-1
        % [Explicatie] Calculez traiectoria
        vx_verif(i+1) = vx_verif(i)*(1-Delta_t/tau);
        vy_verif(i+1) = vy_verif(i)*(1-Delta_t/tau) - g*Delta_t;
        x_verif(i+1)  = x_verif(i) + vx_verif(i)*Delta_t;
        y_verif(i+1)  = y_verif(i) + vy_verif(i)*Delta_t;
        
        if y_verif(i+1)<0
            % [Explicatie] Daca valorile axei y sunt negativa opresc
            % ciclu, continuarea calculelor devine irelevanta
            break;
        end
    end
    
    if x_verif(i) > bataia_maxima
        % [Explicatie] Verific daca bataia pentru valorea curenta este
        % maxima, in caz de adevar, o memorez
        bataia_maxima = x_verif(i);
        alpha         = alpha_val(i_alpha);
    end
end

% [Pas 4] Calculul vitezei si pozitiei la momentele t pentru unghiul pentru care
%bataia e maxima

v0x   = v0*cos(alpha);
v0y   = v0*sin(alpha);
vx(1) = v0x; 
vy(1) = v0y;

for k=1:N-1
    vx(k+1) = vx(k)*(1-Delta_t/tau);
    vy(k+1) = vy(k)*(1-Delta_t/tau) - g*Delta_t;
    x(k+1)  = x(k) + vx(k)*Delta_t;
    y(k+1)  = y(k) + vy(k)*Delta_t;
    if y(k+1)<0
        break
    end
end



% [Pas 5] Reprezentarea grafica a dependentei de timp a vitezelor si a traiectoriei
%proiectilului.

t  = t(1:k); 
vx = vx(1:k); 
vy = vy(1:k); 
x  = x(1:k); 
y  = y(1:k);
v  = sqrt(vx.^2 + vy.^2);

subplot(1, 2, 1)
plot(t, vx, 'r'); hold on
plot(t, vy, 'b')
plot(t, v, 'k')
legend('v_x', 'v_y', 'v', 'location', 'north')
xlabel('t(s)')
ylabel('v_x, v_y, v (m/s)')

subplot(1 , 2, 2)
x_km = x/1000;
y_km = y/1000;
plot(x_km, y_km)
xlabel('x (km)')
ylabel('y (km)')

% [Pas 6] Afisarea de date referitoare la traiectorie:

disp('Durata in secunde a miscarii proiectilului este:')
disp(t(k))
disp('Inaltimea maxima in km atinsa de proiectil este:')
disp(max(y_km))
disp('Bataia proiectilului exprimata in km este:')
disp(x_km(k))
disp('Unghiul cautat este:')
disp(alpha * 180 / pi)

