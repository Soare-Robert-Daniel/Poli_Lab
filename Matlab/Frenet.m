clc; clear all; close all;

syms x y z t x0 y0 z0;

% ecuatii parametrice
x0 = 2*t;
y0 = t^2;
z0 = log(t);

a = [x0; y0; z0]; % curba
punctul = [2; 1; 0]; % punctul in care calculez Triedrul lui Frenet

ad = diff(a); % prima derivata
add = diff(ad); % a doua derivata
addd = diff(add); % a treia derivata

tangenta = ad;
binormala = cross(ad,add);
normala = cross(binormala, tangenta);

dreapta_tangenta = [ (x - x0)/ad(1); (y - y0)/ad(2); (z - z0)/ad(3)];
dreapta_osculatoare = [ (x - x0)/binormala(1); (y - y0)/binormala(2); (z - z0)/binormala(3)];
dreapta_normala = [ (x - x0)/normala(1); (y - y0)/normala(2); (z - z0)/normala(3)];

planul_normal = [ (x - x0) (y - y0) (z - z0)] * tangenta;
planul_osculator = [ (x - x0) (y - y0) (z - z0)] * binormala;
planul_rectificator = [ (x - x0) (y - y0) (z - z0)] * normala;

versori = [tangenta/norm(tangenta) binormala/norm(binormala) normala/norm(normala)];

curbura = norm(cross(ad,add))/(norm(ad))^3;
torsiune = dot(cross(ad,add),add)/(norm(cross(ad,add)))^2;

% gasesc valoare lui t din punctul de pe curba
ecuatie = a - punctul;
solutie = solve(ecuatie, t);

disp('Tangenta'); subs(tangenta, t, solutie)
disp('Binormala'); subs(binormala, t, solutie)
disp('Normala'); subs(normala, t, solutie)

% dezactiveaza comentariile in caz ca valoriile tangentei, binormalei, nu contin 0
% altfel se va produce eroare de impartire cu 0
% disp('Dreapta_tangenta'); subs(dreapta_tangenta, t, solutie)
% disp('Dreapta_osculatoare'); subs(dreapta_osculatoare, t, solutie)
% disp('Dreapta_normala'); subs(dreapta_normala, t, solutie)

disp('Planul_normal'); subs(planul_normal, t, solutie)
disp('Planul_osculator'); subs(planul_osculator, t, solutie)
disp('Planul_rectificator'); subs(planul_rectificator, t, solutie)

disp('Versori'); subs(versori, t, solutie)

disp('Curbura'); subs(curbura, t, solutie)
disp('Torsiune'); subs(torsiune, t, solutie)
