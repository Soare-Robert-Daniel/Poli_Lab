clc; clear all; close all;

syms x y z t x0 y0 z0;

% ecuatii parametrice
x0 = log(t);
y0 = 2*t;
z0 = t^2;

a = [x0; y0; z0]; % curba
punctul = [1; 1; 1]; % punctul in care calculez Triedrul lui Frenet

ad = diff(a); % prima derivata
add = diff(ad); % a doua derivata
addd = diff(add); % a treia derivata

tangenta = ad;
binormala = cross(ad,add);
normala = cross(binormala, tangenta);

% dreapta_tangenta = [ (x - x0)/ad(1); (y - y0)/ad(2); (z - z0)/ad(3)];
% dreapta_osculatoare = [ (x - x0)/binormala(1); (y - y0)/binormala(2); (z - z0)/binormala(3)];
% dreapta_normala = [ (x - x0)/normala(1); (y - y0)/normala(2); (z - z0)/normala(3)];

planul_tangent = [ (x - x0) (y - y0) (z - z0)] * tangenta;
planul_osculator = [ (x - x0) (y - y0) (z - z0)] * binormala;
planul_rectificator = [ (x - x0) (y - y0) (z - z0)] * normala;

versori = [tangenta/norm(tangenta) binormala/norm(binormala) normala/norm(normala)];

curbura = norm(cross(ad,add))/(norm(ad))^3;
torsiune = dot(cross(ad,add),add)/(norm(cross(ad,add)))^2;

% gasesc valoare lui t din punctul de pe dreapta
ecuatie = a - punctul;
solutie = solve(ecuatie, t);

disp('Tangenta'); subs(tangenta, t, solutie)
disp('Binormala'); subs(binormala, t, solutie)
disp('Normala'); subs(normala, t, solutie)

% disp('Dreapta_tangenta'); subs(dreapta_tangenta, t, solutie)
% disp('Dreapta_osculatoare'); subs(dreapta_osculatoare, t, solutie)
% disp('Dreapta_normala'); subs(dreapta_normala, t, solutie)

disp('Planul_tangent'); subs(planul_tangent, t, solutie)
disp('Planul_osculator'); subs(planul_osculator, t, solutie)
disp('Planul_rectificator'); subs(planul_rectificator, t, solutie)

disp('Versori'); subs(versori, t, solutie)

disp('Curbura'); subs(curbura, t, solutie)
disp('Torsiune'); subs(torsiune, t, solutie)
