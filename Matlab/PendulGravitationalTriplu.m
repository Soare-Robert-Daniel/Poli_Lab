% Tema 4
% Soare Robert-Daniel
% Gr. 1314
% F.S.A

function pendul

    %-------------------------Date initiale----------------------------
    clc;
    close all;
    clear all;
    g  = 9.81 * 100; %acc. gravitationala cm/s
    l1 = 20; l2 = 15 ; l3 = 10; % in centimetri
    m1 = 0.05 ; m2 = 0.07; m3 = 0.1% in Kg

    % Deviatiile initiale
    theta10=pi/2;
    theta20=pi/6;
    theta30=pi/2;

    %DEFINIREA VARIABILEI TIMP DISCRETE
    T=2*pi*sqrt((l1+l2)/g);
    N1=10;       tf=N1*T;
    N2=200;     dt=T/N2;
    N=N1*N2+1;
    t=linspace(0,tf,N);

    %ALOCAREA DE MEMORIE PENTRU VARIABILELE THETA 1 SI 2 SI INITIALIZAREA LOR
    theta1=zeros(1,N);    theta2=zeros(1,N); theta3=zeros(1,N);
    theta1(1)=theta10;    theta2(1)=theta20; theta3(1)=theta30;%UNGHIURILE INITIALE DE DEVIATIE
    theta1(2)=theta1(1);  theta2(2)=theta2(1); theta3(2)=theta3(1); %CONSECINTE ALE CONSIDERARII
                                                %VITEZELOR INITIALE NULE
    
    % Ecuatii folosite:
    %     Ec 1:
    % -(g*m2^2*sin(q1) + g*m2^2*sin(q1 - 2*q2) + 2*dq2^2*l2*m2^2*sin(q1 - q2) + 2*g*m1*m2*sin(q1) + g*m1*m3*sin(q1) + g*m2*m3*sin(q1) - (g*m1*m3*sin(q1 - 2*q2 + 2*q3))/2 - (g*m1*m3*sin(q1 + 2*q2 - 2*q3))/2 + g*m2*m3*sin(q1 - 2*q2) + dq1^2*l1*m2^2*sin(2*q1 - 2*q2) + 2*dq2^2*l2*m2*m3*sin(q1 - q2) + dq3^2*l3*m2*m3*sin(q1 - q3) + dq1^2*l1*m2*m3*sin(2*q1 - 2*q2) + dq3^2*l3*m2*m3*sin(q1 - 2*q2 + q3))/(l1*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)))
    % 
    % Ec 2:
    % (g*m2^2*sin(2*q1 - q2) - g*m2^2*sin(q2) + g*m1*m2*sin(2*q1 - q2) + (g*m1*m3*sin(2*q1 - q2))/2 + g*m2*m3*sin(2*q1 - q2) + 2*dq1^2*l1*m2^2*sin(q1 - q2) - g*m1*m2*sin(q2) - (g*m1*m3*sin(q2))/2 - g*m2*m3*sin(q2) - (g*m1*m3*sin(2*q1 + q2 - 2*q3))/2 - (g*m1*m3*sin(q2 - 2*q3))/2 + dq2^2*l2*m2^2*sin(2*q1 - 2*q2) + 2*dq1^2*l1*m1*m2*sin(q1 - q2) + dq1^2*l1*m1*m3*sin(q1 - q2) + 2*dq1^2*l1*m2*m3*sin(q1 - q2) - 2*dq3^2*l3*m1*m3*sin(q2 - q3) - dq3^2*l3*m2*m3*sin(q2 - q3) + dq3^2*l3*m2*m3*sin(2*q1 - q2 - q3) + dq2^2*l2*m2*m3*sin(2*q1 - 2*q2) - dq2^2*l2*m1*m3*sin(2*q2 - 2*q3) - dq1^2*l1*m1*m3*sin(q1 + q2 - 2*q3))/(l2*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)))
    %  
    % Ec 3:
    % (m1*(g*m2*sin(2*q1 - q3) - g*m3*sin(q3) - g*m2*sin(2*q1 - 2*q2 + q3) - g*m3*sin(2*q1 - 2*q2 + q3) - g*m2*sin(q3) + g*m2*sin(2*q2 - q3) + g*m3*sin(2*q1 - q3) + g*m3*sin(2*q2 - q3) + 2*dq1^2*l1*m2*sin(q1 - q3) + 2*dq1^2*l1*m3*sin(q1 - q3) + 4*dq2^2*l2*m2*sin(q2 - q3) + 4*dq2^2*l2*m3*sin(q2 - q3) + 2*dq3^2*l3*m3*sin(2*q2 - 2*q3) - 2*dq1^2*l1*m2*sin(q1 - 2*q2 + q3) - 2*dq1^2*l1*m3*sin(q1 - 2*q2 + q3)))/(2*l3*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)))

    for i = 2: N-1
        q1  = theta1(i);
        q2  = theta2(i);
        q3  = theta3(i);
        
        dq1 = (theta1(i) - theta1(i-1))/dt;
        dq2 = (theta2(i) - theta2(i-1))/dt;
        dq3 = (theta3(i) - theta3(i-1))/dt;
        
        eps1 =  -(g*m2^2*sin(q1) + g*m2^2*sin(q1 - 2*q2) + 2*dq2^2*l2*m2^2*sin(q1 - q2) + 2*g*m1*m2*sin(q1) + g*m1*m3*sin(q1) + g*m2*m3*sin(q1) - (g*m1*m3*sin(q1 - 2*q2 + 2*q3))/2 - (g*m1*m3*sin(q1 + 2*q2 - 2*q3))/2 + g*m2*m3*sin(q1 - 2*q2) + dq1^2*l1*m2^2*sin(2*q1 - 2*q2) + 2*dq2^2*l2*m2*m3*sin(q1 - q2) + dq3^2*l3*m2*m3*sin(q1 - q3) + dq1^2*l1*m2*m3*sin(2*q1 - 2*q2) + dq3^2*l3*m2*m3*sin(q1 - 2*q2 + q3))/(l1*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)));
        eps2 =  (g*m2^2*sin(2*q1 - q2) - g*m2^2*sin(q2) + g*m1*m2*sin(2*q1 - q2) + (g*m1*m3*sin(2*q1 - q2))/2 + g*m2*m3*sin(2*q1 - q2) + 2*dq1^2*l1*m2^2*sin(q1 - q2) - g*m1*m2*sin(q2) - (g*m1*m3*sin(q2))/2 - g*m2*m3*sin(q2) - (g*m1*m3*sin(2*q1 + q2 - 2*q3))/2 - (g*m1*m3*sin(q2 - 2*q3))/2 + dq2^2*l2*m2^2*sin(2*q1 - 2*q2) + 2*dq1^2*l1*m1*m2*sin(q1 - q2) + dq1^2*l1*m1*m3*sin(q1 - q2) + 2*dq1^2*l1*m2*m3*sin(q1 - q2) - 2*dq3^2*l3*m1*m3*sin(q2 - q3) - dq3^2*l3*m2*m3*sin(q2 - q3) + dq3^2*l3*m2*m3*sin(2*q1 - q2 - q3) + dq2^2*l2*m2*m3*sin(2*q1 - 2*q2) - dq2^2*l2*m1*m3*sin(2*q2 - 2*q3) - dq1^2*l1*m1*m3*sin(q1 + q2 - 2*q3))/(l2*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)));
        eps3 =  (m1*(g*m2*sin(2*q1 - q3) - g*m3*sin(q3) - g*m2*sin(2*q1 - 2*q2 + q3) - g*m3*sin(2*q1 - 2*q2 + q3) - g*m2*sin(q3) + g*m2*sin(2*q2 - q3) + g*m3*sin(2*q1 - q3) + g*m3*sin(2*q2 - q3) + 2*dq1^2*l1*m2*sin(q1 - q3) + 2*dq1^2*l1*m3*sin(q1 - q3) + 4*dq2^2*l2*m2*sin(q2 - q3) + 4*dq2^2*l2*m3*sin(q2 - q3) + 2*dq3^2*l3*m3*sin(2*q2 - 2*q3) - 2*dq1^2*l1*m2*sin(q1 - 2*q2 + q3) - 2*dq1^2*l1*m3*sin(q1 - 2*q2 + q3)))/(2*l3*(2*m1*m2 + m1*m3 + m2*m3 - m2^2*cos(2*q1 - 2*q2) + m2^2 - m2*m3*cos(2*q1 - 2*q2) - m1*m3*cos(2*q2 - 2*q3)));

        
        theta1(i+1) = 2*theta1(i) - theta1(i-1) + dt^2*eps1;
        theta2(i+1) = 2*theta2(i) - theta2(i-1) + dt^2*eps2;
        theta3(i+1) = 2*theta3(i) - theta3(i-1) + dt^2*eps3;
    end
    
    % reprezentarea grafica a unghiurilor theta 1, theta 2, theta 3 
    
    figure(1)
    plot(t, theta1 * 180/pi, '-b',t, theta2 * 180/pi, '-r', t, theta3*180/pi, '-g'); hold on;

    legend('\theta_1','\theta_2','\theta_3', 'location', 'eastoutside')
    xlabel('t / s'); ylabel('\theta_1 , \theta_2 / , \theta_3 / \circ');

    plot([0 tf], [theta10*180/pi theta10*180/pi], ':b'); hold on;
    plot([0 tf], [-theta10*180/pi -theta10*180/pi], ':b'); hold on;

    plot([0 tf], [theta20*180/pi theta20*180/pi], ':r'); hold on;
    plot([0 tf], [-theta20*180/pi -theta20*180/pi], ':r'); hold on;

    plot([0 tf], [theta30*180/pi theta30*180/pi], ':g'); hold on;
    plot([0 tf], [-theta30*180/pi -theta30*180/pi], ':g'); hold on;

    
    figure(2)
    
    Film=moviein(N);

    x1 = l1*sin(theta1);
    y1 = -l1*cos(theta1);
    
    x2 = x1+l2*sin(theta2);
    y2 = y1-l2*cos(theta2);

    x3 = x2 + l3*sin(theta3);
    y3 = y2 - l3*cos(theta3);
    
    for i=1:N
        plot(x1(i),y1(i),'ob '); hold on;
        plot(x2(i),y2(i),'or'); hold on;
        plot(x3(i),y3(i),'og'); hold on;
        
        plot([0,x1(i)],[0,y1(i)],'-b'); hold on;
        plot([x1(i),x2(i)],[y1(i),y2(i)],'-r'); hold on;
        plot([x2(i),x3(i)],[y2(i),y3(i)],'-g'); hold on;
        
        title('Graficul Miscarii')
        xlabel('x / cm'); ylabel('y / cm');
        axis([-l1-l2-l3,l1+l2+l3,-l1-l2-l3,l1+l2+l3]);
        axis square; grid;
        
        Film(i) = getframe; %salvare cadru 
        hold off; %asigura  stergerea
    end;
end

function  generare_ecuatii_pendul_triplu_grav
    % OBS: dezactivati functia precedenta daca vreti sa rulati aceasta
    % functie
    %-------------------------- Testare Functie ----------------------------
    % Test
    close all;clear all;clc
    
    % Test 1 - Lectia 2, problema oscilatorului cu 2 grade de libertate
    syms q1 q2 dq1 dq2 m k ddq1 ddq2
    L = 0.5*m*(dq1^2 + dq2^2) - (k)*(q1^2 + q2^2 - q1*q2);
    E = Lagrange(L, [q1 dq1 ddq1 q2 dq2 ddq2])
    
    % Test 2 - pendul gravitational simplu, un grad de libertate
    syms q dq ddq g m r
    L = 0.5*m*r^2*(dq^2) + m*g*r*cos(q);
    E = Lagrange(L, [q dq ddq])
    
    %------------------------- Proiectare pendul------------------------
    
    syms q1 dq1 ddq1 q2 dq2 ddq2 q3 dq3 ddq3 g m1 m2 m3 l1 l2 l3
   
    h1 = l1*cos(q1); % inaltimea pentru primul corp
    h2 = l2*cos(q2) + h1; % inaltimea pentru al doilea corp
    h3 = l3*cos(q3) + h2; % inaltimea pentru al treilea corp
    
    v1  = l1 * dq1; % viteza pentru primul corp
    vr2 = l2 * dq2; % viteza relativa pentru al doilea corp fata de primul
    vr3 = l3 * dq3; % viteza relativa pentru al treilea corp fata de al doilea
    
    % v2 = v1^2 + vr2^2 + 2*v1*vr2*cos(q2-q1); % viteza pentru al doilea corp
    
    v2x = v1*cos(q1) + vr2*cos(q2);
    v2y = v1*sin(q1) + vr2*sin(q2);
    
    v3x = v1*cos(q1) + vr2*cos(q2) + vr3*cos(q3);
    v3y = v1*sin(q1) + vr2*sin(q2) + vr3*sin(q3);
    % [!] De tinut minte: descompunerea pe componente e cea mai buna

    T = (0.5)*m1*v1^2 + (0.5)*m2*(v2x^2 + v2y^2) + (0.5)*m3*(v3x^2 + v3y^2); % energie cinetica
    U = -m1*g*h1 - m2*g*h2 - m3*g*h3; % energie potentiala
    
    L = simplify(T - U)
    
    E = Lagrange(L, [q1 dq1 ddq1 q2 dq2 ddq2 q3 dq3 ddq3]) % ecuatiile Lagrange
    
    Sol = solve(E(1),E(2),E(3), [ ddq1 ddq2 ddq3]);
    s1 = simplify(Sol.ddq1) % a doua derivata a lui theta 1
    s2 = simplify(Sol.ddq2) % a doua derivata a lui theta 2
    s3 = simplify(Sol.ddq3) % a doua derivata a lui theta 3
    
    % se da copy-paste la formule si declar componentele ca
    % variabile in loc de simboluri
end

function [M]=Lagrange(Lag,V)
    % functie care calculeaza ecuatiile lui Lagrange
    % sursa: https://www.mathworks.com/matlabcentral/fileexchange/23037-lagrange-s-equations?focused=5111317&tab=function
    syms t;
    Var=length(V)/3;
    Vt=V;
        for cont0=1:1:Var
            Vt(cont0*3-2)=strcat('f',num2str(cont0),'(t)');
            Vt(cont0*3-1)=diff(Vt((cont0*3)-2),t);
            Vt(cont0*3)=diff(Vt((cont0*3)-2),t,2);
        end
        for cont0=1:1:Var
            L1=simplify(diff(Lag,V(cont0*3-1)));
            L2=simplify(diff(Lag,V(cont0*3-2)));
            Dposx=L1;

            for cont=1:1:Var*3         
                 Dposx=subs(Dposx,V(cont),Vt(cont));
            end
            L1=diff(Dposx,t);

            for cont=Var*3:-1:1         %
                 L1=subs(L1,Vt(cont),V(cont));
            end
            L1F=L1-L2;
            L1F=simplify(expand(L1F));
            L1F=collect(L1F,Vt(cont0*3));%*****************
            M(cont0)=L1F;
        end
end

