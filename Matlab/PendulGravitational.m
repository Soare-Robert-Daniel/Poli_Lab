
% Pendul gravitational cu amplitudine mare cu frecare

function pendul
    %-------------------Datele initiale-------------------------
    g = 9.81; % acceleratia gravitationala
    r = 1.1; % rezistenta aerului
    l = 1.6; % lungimea firului
    m = 1; % masa corpului
    omega = g/l; % pulsatie proprie
    tau = m/r; % timp de relaxare
    x0 = pi/2; % unghiul initial
    %---------------Discretizarea variabilei timp---------------
    Ts = 1;
    n1 = 10; % reprezentarea grafica a n1 Ts
    n2 = 100; % numarul de intervale in care este discretizata Ts
    N  = n1*n2 + 1; % numarul de momente de timp ale discretizarii
    Delta_t = Ts/n2; % pasul de timp al discretizarii
    t  = linspace(0, n1*Ts, N);
    %------------------Traiectoria pendulului-------------------
    plot(t, traiectorie( N, x0, Delta_t, tau, omega ), 'g');
    ylabel('x / cm')
    xlabel('t / s')
end

function x = traiectorie( N, x0, Delta_t, tau, omega )
    x = zeros(1, N);
    x(1) = x0;
    x(2) = x(1);
    for i = 2: N-1
        x(i+1) = 2*x(i) - x(i-1) - Delta_t/tau*(x(i) - x(i-1)) - (Delta_t*omega)^2*sin(x(i));
    end
end

