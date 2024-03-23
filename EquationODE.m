g = 9.81;
d = 0.00001;
p_fluid = 1.229;
p_particle = (2.478 * 10^(-24))/(4/3*pi*(d/2)^2);
q = 1.6*10^-19;
e0 = 8.854187817*10^-12;
H = 3;
Cd = 0.47;
o = q / H^2 + H; 
ct = 0;
mu = 1.73*10^-5;
%v_term = sqrt(2*g*m)

gravity = (pi/6)*(p_fluid-p_particle)*g*d^3;
buoyent = (pi/6)*(p_fluid)*g*d^3;
drag = 3*pi*mu*d;
%0.5*p_fluid*Cd*(pi/4);
collector = (q*o)/(2*e0);
eletric_other = (q^2*ct);
mass = (pi/6)*p_particle*d^3;
%at = ((pi/6)*(p_fluid-p_particle)*g*d^3 + 0.5*p_fluid*Cd*((pi/4)*d^2)*s(2)^2 - (q*o)/(2*e0) + (q^2*ct)/(2*e0)*(2*s(1)-H))/((pi/6)*p_particle*d^3);

tspan = [0, 1.144];
x0 = [H, -3, gravity, buoyent, drag, collector, eletric_other, H, mass];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, x0, opt);
plot(T,(X(:,1)))
disp([T,X])

function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(3) + s(4) - s(5) + s(6)*(2*s(1) - s(7)))/s(8);
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt = dsdt.';
end
