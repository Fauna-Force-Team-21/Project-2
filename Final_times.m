masses = [7.639571 * 10^(-26), 1.063868 * (10^-25), 7.3 * 10^(-26), 4.652786 * 10^(-26), 1.297 * 10^(-25), 7.97077 * 10^(-26), 2.4078 * 10^(-24), 6.019594 * 10^(-25)];
diameter = [0.00000000033, 0.00000000036, 0.000000000317, 0.000000000376, 0.000000000585, 0.00000000058, 0.00001, 0.0000025];
NO2 = calculationInputs(masses(1), diameter(1));
SO2 = calculationInputs(masses(2), diameter(2));
CO2 = calculationInputs(masses(3), diameter(3));
CO = calculationInputs(masses(4), diameter(4));
C6H6 = calculationInputs(masses(5), diameter(5));
O3 = calculationInputs(masses(6), diameter(6));
PM_10 = calculationInputs(masses(7), diameter(7));
PM_2_5 = calculationInputs(masses(8), diameter(8));

g = 9.81;
d = diameter(7);
p_fluid = 1.3229;
pi = 3.141592653589793;
m = masses(7);
p_particle = m/(4/3*pi*(d/2)^2);
q = 1.6*10^-19;
A = pi*(d/2)^2;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
u = 1.73 * 10^(-5);
v_term =sqrt((2 * m * g) / (p_fluid * A * C_d)); % m / s
gravity = (pi/6)*(p_fluid-p_particle)*g*d^3;
buoyent = (pi/6)*(p_fluid)*g*d^3;
%drag = 0.5*p_fluid*C_d*(pi/4);
drag = (3 * pi * u * d * v_term^2);
collector = (q*o)/(2*e0);
eletric_other = (q^2*ct);
mass = (pi/6)*p_particle*d^3;

tspan = [0, 1];
x0 = [H, -3, gravity, buoyent, drag, collector, eletric_other, H, mass];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, x0, opt);

figure(1)
plot(T,X(:,1))
ylim([0, 3]); % Adjust y-axis limits
xlabel('Time');
ylabel('Solution (X)');
title('Solution Plot');
disp([T, X])
conts = [];
conts(1) = 0
for i = 2:69
    %ct = ((pi/6)* p_particle*d^3*X(i,3) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (3 * pi * u * d * ((X(i,2))^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*X(i,1)-H)));
    ct = ((pi/6)* p_particle *d^3*(X(i,3)) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (0.5*p_fluid*C_d*(pi/4) * (d)^2 * ((X(i,2) - 3)^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*(X(i,1)+H)-H)));
    ct = abs(ct)
    conts(i) = ct + conts(i-1); 
end
disp(conts)
figure(2)
plot(T, conts)
xlabel("Time")
ylabel("Concentration of Particles")
title("Concentration of Particles by Time")

disp([T,X(:,1)])
function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(4) + s(5) - s(3) - s(6) - s(7)) / s(9);
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt(9) = 0;
    dsdt = dsdt.';
end
