g = 9.81;
d = 0.00001;
p_fluid = 1.229;
pi = 3.141592653589793;
m = 2.407*10^-24;
p_particle = (m)/(4/3*pi*(d/2)^3);
q = 1.6*10^-19;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
u = 1.73*10^(-5);

gravity = (pi/6)*p_particle*g*d^3;
bouyent = (pi/6)*p_fluid*g*d^3;
drag = 0.5*p_fluid*C_d*(pi/4);
%drag = (3 * pi * u * d);
collector = (q*o)/(2*e0);
eletric_other = (q^2*ct);
%mass = (pi/6)*p_particle*d^3;

tspan = [0, 2];
x0 = [H, -3, gravity, bouyent, drag, collector, eletric_other, m];
opt = odeset('RelTol',1e-8, 'AbsTol',1e-8);
[T,X] = ode45(@dynamic, tspan, x0, opt);

figure (1)
plot(T,X(:,1))
%ylim([0, 3]); % Adjust y-axis limits
xlabel('Time');
ylabel('Solution (X)');
title('Solution Plot');

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
