% Tema 5
% Soare Robert-Daniel
% Gr. 1314
% F.S.A

function arie_comuna
    clear all; close all; clc;
    % Setari
    N     = 1000;     % dimensiune vectorului de valori
    Start = -1.6;    % valoare de la care incepe functia
    End   = 1.6;
    Step  = 0.01;    % pasul functiei / delta
    
    x = zeros(N);
   
    x(1) = Start;
    for i = 2: N
        x(i) = x(i-1) + Step;
        if x(i) > End
            N = i - 1;
            break;
        end
    end

    x = x(1:N);

    % fill(x, y, [0.5 0 0]); hold on;
    plot(x, fct1(x), '-r'); hold on;
    
    
    % fill(x, y, [0 0.5 0]); hold on;
    plot(x, fct2(x), '-g'); hold on;
    
   
    % fill(x, y, [0 0 0.5]); hold on;
    plot(x, fct3(x), '-b'); hold on;
    
    
    s1 = sum(fct1(x)) * Step;
    s2 = sum(fct2(x)) * Step;
    s3 = sum(fct3(x)) * Step;
    
    s = abs(abs(s1(1) - s2(1)) - s3(1));
    
    t1 = integral(@(t) t.^2, Start, End);
    t2 = integral(@(t) -t.^2 + 5, Start, End);
    t3 = integral(@(t) -t.^2 + 2.6, Start, End);
    
    t = abs(t1 - abs(t2 - t3));
    
    disp('Aria determinata de cele 3 functii este:')
    disp(s)
    
    disp('Metoda 1:')
    disp( s );
    
    disp('Metoda 2: ');
    disp(t);
    
    disp('Diferenta: ');
    disp(t-s);
end

function y = fct1(x)
%     y = zeros(n); 
%     for i = 1: n
%         y(i) = x(i)^2;
%     end
    y = x.^2;
end

function y = fct2(x)
%     y = zeros(n); 
%     for i = 1: n
%         y(i) = -x(i)^2 + 5;
%     end
    y = -x.^2 + 5;
end

function y = fct3(x)
%     y = zeros(n); 
%     for i = 1: n
%         y(i) = -x(i)^2 + 2.6;
%     end
    y = -x.^2 + 2.6;
end

