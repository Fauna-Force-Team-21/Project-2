g = 9.81;
d = 0.00001;
p_fluid = 1.229;
pi = 3.141592653589793;
m = 2.407 * 10^(-24);
p_particle = (2.407 * 10^(-24))/(4/3*pi*(d/2)^2);
q = 1.6*10^-19;
A = pi*(d/2)^2;
e0 = 8.854187817*10^-12;
H = 3;
C_d = 0.47;
o = q /H^2 + H; 
ct = 0;
u = 1.73 * 10^(-5);
v_term =sqrt((2 * m * g) / (p_fluid * A * C_d)); % m / s
gravity_bouyent = (pi/6)*(p_fluid-p_particle)*g*d^3;
%buoyent = (pi/6)*(p_fluid)*g*d^3;
%drag = 0.5*p_fluid*C_d*(pi/4);
drag = (3 * pi * u * d * v_term^2);
collector = (q*o)/(2*e0);
eletric_other = (q^2*ct);
mass = (pi/6)*p_particle*d^3;

tspan = [0, 1.000000315];
x0 = [H, 0, gravity_bouyent, drag, collector, eletric_other, mass];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, x0, opt);

plot(T,X(:,1))
ylim([0, 3]); % Adjust y-axis limits
xlabel('Time');
ylabel('Solution (X)');
title('Solution Plot');
disp([T, X])
conts = [];
conts(1) = 0

for i = 2:3245
    %ct = ((pi/6)* p_particle*d^3*X(i,3) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (3 * pi * u * d * ((X(i,2))^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*X(i,1)-H)));
    ct = ((pi/6)* p_particle *d^3*(X(i,3)) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (0.5*p_fluid*C_d*(pi/4) * (d)^2 * ((X(i,2) - 3)^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*(X(i,1)+H)-H)));
    ct = abs(ct)
    conts(i) = ct + conts(i-1); 
end

disp(conts)
figure(1)
plot(T, conts)
xlabel("Time")
ylabel("Concentration of Particles")
title("Concentration of Particles by Time")

function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(3) + s(4)*s(2) - s(5) + s(6)*(2*s(1)-3))/s(7);
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt = dsdt.';
end
