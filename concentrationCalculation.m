function [conts] = concentrationCalculation(initial, m, d)
d =d;
m =m;
g = 9.81;
d = 0.00001;
p_fluid = 1.229;
pi = 3.141592653589793;
p_particle = (m)/(4/3*pi*(d/2)^3);
q = 1.6*10^-19;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
collector = (q*o)/(2*e0);
Fe = collector;
u = 1.73*10^(-5);
tspan = [0, 1.3];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, initial, opt);
axt = [];
vxt = [];
dxt = [];
[rows, cols] = size([T, X]);
for t=1:rows
    axt(t) = Fe / m;
    vxt(t) = ((Fe / m) * T(t));
    dxt(t) = Fe / ((2 * m)) * T(t)^2;
end
conts = [];
conts(1) = 1 * 10^(17);

for i = 2:rows
    ct = ((pi/6)* p_particle *d^3*(sqrt(X(i,3)^2 + axt(i)^2)) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (0.5*p_fluid*C_d*(pi/4) * (d)^2 * (sqrt(X(i,2)^2 + vxt(i)^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*(sqrt(X(i,1)^2 + dxt(i)^2))-H))));
    %ct = abs(ct);
    ct = ct / 100;
    conts(i) = ct + conts(i-1);
end
end
function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(5)*s(2)^2 + s(4) - s(3) + s(7)*(2*s(1)-3))/(s(8) * 6.023 * 10^(23));
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt = dsdt.';
end
