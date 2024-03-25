function [x0] = calculationInputs(m, d)
g = 9.81;
d = 0.00001;
p_fluid = 1.229;
pi = 3.141592653589793;
%m =
p_particle = (m)/(4/3*pi*(d/2)^3);
q = 1.6*10^-19;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
u = 1.73*10^(-5);

gravity = (pi/6)*p_particle*g*d^3;
buoyent = (pi/6)*p_fluid*g*d^3;
drag = 0.5*p_fluid*C_d*(pi/4);
collector = (q*o)/(2*e0);
eletric_other = (q^2*ct);
x0 = [H, -3, gravity, buoyent, drag, collector, eletric_other, m];
end