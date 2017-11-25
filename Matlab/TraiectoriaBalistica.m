
% TEMA 1
% Pe baza programului din clasa laborator 2, construiti un program Matlab
% care sa determine unghiul de lansare pentru care bataia proiectilului
% este maxima

% Mod de rezolvare:
    % Caut unghiul in intervalul [1,89] incercand sa aflu valoare bataii
    % apoi aleg unghiul pentru care valoarea este maxima 
    % analog pentru calculul amplitudinei
    % elimin graficul vitezelor, find inutil pentru cerinta data

%Studiul numeric al miscarii balistice
%Un proiecdtil de masa m=0,8 kg este lansat cu viteza v0=800 m/s sub
%unghiul alfa0=pi/3. Lansarea se face de la suprafata pamantului pe un
%teren plat. Corpul intampina o forta de rezistenta la inaintare
%proportionala cu viteza, coeficientul de proportionalitate fiind
%r=(1/3)mg/v0. Sa se traseze graficele dependentei de timp ale vx, vy, v
%(modulul vitezei) precum si traiectoria proiectilului pana la cadere.

clc; clear all; close all

%Datele problemei:
g=9.81; %m/s^2
m=2; %kg
v0=1000; %m/s
r=(1/3)*m*g/v0;


tau=m/r; %s

%Definim variabila discreta timp
t0=0;
tf=200; %s
N=1601;
t=linspace(t0,tf,N); Delta_t=t(2)-t(1);

%Alocam spatiu de memorie pentru variabilele viteza si pozitie
vx=zeros(1,N);
vy=zeros(1,N);
x=zeros(1,N);
y=zeros(1,N);

% copie
vxc=zeros(1,N);
vyc=zeros(1,N);
xc=zeros(1,N);
yc=zeros(1,N);

% copie pt amplitudine
vxa=zeros(1,N);
vya=zeros(1,N);
xa=zeros(1,N);
ya=zeros(1,N);

b_max = 0; % bataia maxima
alpha_max = 0;

a_max = 0;
teta = 0;
%Scriem conditiile initiale. Pentru variabilele x si y conditiile initiale
%sunt deja luate.
% vx(1)=v0x; vy(1)=v0y;

%calculul vitezei si pozitiei la momentele t pentru intervalul de ungiuri
%[1,89]
for beta = 1:89
    vxc=zeros(1,N);
    vyc=zeros(1,N);
    xc=zeros(1,N);
    yc=zeros(1,N);
    v0xc=v0*cos(beta*pi/180); v0yc=v0*sin(beta*pi/180);
    vxc(1)=v0xc; vyc(1)=v0yc;
    yy = 0;
    for i=1:N-1
        vxc(i+1)=vxc(i)*(1-Delta_t/tau);
        vyc(i+1)=vyc(i)*(1-Delta_t/tau)-g*Delta_t;
        xc(i+1)=xc(i)+vxc(i)*Delta_t;
        yc(i+1)=yc(i)+vyc(i)*Delta_t;
        
        if yc(i+1) > a_max
            a_max = yc(i+1);
            teta = beta;
        end
        
        if yc(i+1)<0
            yy = i;
            break;
        end
    end
    if xc(yy) > b_max
        b_max = xc(yy);
        alpha_max = beta;
    end
end

%calculul vitezei si pozitiei la momentele t pentru unghiul pentru care
%bataia e maxima
v0x=v0*cos(alpha_max*pi/180); v0y=v0*sin(alpha_max*pi/180);
vx(1)=v0x; vy(1)=v0y;

%calculul vitezei si pozitiei la momentele t

for k=1:N-1
    vx(k+1)=vx(k)*(1-Delta_t/tau);
    vy(k+1)=vy(k)*(1-Delta_t/tau)-g*Delta_t;
    x(k+1)=x(k)+vx(k)*Delta_t;
    y(k+1)=y(k)+vy(k)*Delta_t;
    if y(k+1)<0
        break
    end
end

v0x=v0*cos(teta*pi/180); v0y=v0*sin(teta*pi/180);
vxa(1)=v0x; vya(1)=v0y;

for q=1:N-1
    vxa(q+1)=vxa(q)*(1-Delta_t/tau);
    vya(q+1)=vya(q)*(1-Delta_t/tau)-g*Delta_t;
    xa(q+1)=xa(q)+vxa(q)*Delta_t;
    ya(q+1)=ya(q)+vya(q)*Delta_t;
    if ya(q+1)<0
        break
    end
end

% t=t(1:k); 
vx=vx(1:k); 
vy=vy(1:k); 
x=x(1:k); 
y=y(1:k);
v=sqrt(vx.^2+vy.^2);

xa=xa(1:q); 
ya=ya(1:q);

%Reprezentarea grafica a dependentei de timp a vitezelor si a traiectoriei
%proiectilului.
% subplot(1,2,1)
% plot(t,vx,'r'); hold on
% plot(t,vy,'b')
% plot(t,v,'k')
% legend('v_x','v_y','v','location','north')
% xlabel('t(s)')
% ylabel('v_x, v_y, v (m/s)')
% 
% subplot(1,2,2)
x_km=x/1000;
y_km=y/1000;

xa_km=xa/1000;
ya_km=ya/1000;

plot(x_km, y_km, 'r');hold on
plot(xa_km, ya_km, 'g')
legend('bataie_m','amplitudine_m')
xlabel('x (km)')
ylabel('y (km)')

%afisarea de date referitoare la traiectorie:
disp('Bataie maxima # Durata in secunde a miscarii proiectilului este:')
disp(t(k))
disp('Bataie maxima # Inaltimea maxima in km atinsa de proiectil este:')
disp(max(y_km))
disp('Bataie maxima # Bataia proiectilului exprimata in km este:')
disp(x_km(k))
disp('Bataie maxima # Unghiul cautat este:')
disp(alpha_max)

disp('Amplitudine maxima # Durata in secunde a miscarii proiectilului este:')
disp(t(q))
disp('Amplitudine maxima # Inaltimea maxima in km atinsa de proiectil este:')
disp(max(ya_km))
disp('Amplitudine maxima # Bataia proiectilului exprimata in km este:')
disp(xa_km(q))
disp('Amplitudine maxima # Unghiul cautat este:')
disp(teta)

 
