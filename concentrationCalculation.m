function [conts] = concentrationCalculation(initial, m, d)
d =d;
m =m;
g = 9.81;
p_fluid = 1.229;
pi = 3.141592653589793;
p_particle = m / (4/3 * pi * (d/2)^2);
q = 1.6*10^-19;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
u = 1.73 * 10^(-5);
tspan = [0, 1.000000315];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, initial, opt);
conts = [];
conts(1) = 0;
for i = 2:41
    ct = ((pi/6)* p_particle *d^3*(X(i,3)) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (0.5*p_fluid*C_d*(pi/4) * (d)^2 * ((X(i,2) - 3)^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*(X(i,1)+H)-H)));
    ct = abs(ct);
    conts(i) = ct + conts(i-1); 
end
end
function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(4) + s(5) - s(3) - s(6) - s(7)) / s(8);
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt(9) = 0;
    dsdt = dsdt.';
end


