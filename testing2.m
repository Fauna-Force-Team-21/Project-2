p_fluid = 1.229; % kg / m^3
v_0 = 3 % m / s
g = 9.81; %m / s^2
d = 0.00001; %m
pi = 3.141592653589793; %unitless
A = pi * (d / 2)^2; %m^2
u = 1.73 * 10^(-5); %N * s / m^2
C_d = 0.47; %Unitless
V = (4 / 3) * pi * (d / 2)^3; %m^3
m = 2.407 * 10^(-24) % kg
p_particle = m / V; %kg / m^3
q = 1.6 * 10^(-19) % C
H = 3; %m 
e_0 = 8.854187817 * 10^(-12); %F / m
v_term = sqrt((2 * m * g) / (p_fluid * A * C_d)); % m / s
c_t = 0;
o = q / H^2 + H; 

gravity = (pi / 6) * p_particle * g * (d)^3
buoyent = (pi / 6) * p_fluid * g * (d)^3
drag = (3 * pi * u * d * v_term^2)
collector = (q*o)/(2*e0 * pi);
eletric_other = (q^2*ct);
%at = ((pi/6)*(p_fluid-p_particle)*g*d^3 + 0.5*p_fluid*Cd*((pi/4)*d^2)*s(2)^2 - (q*o)/(2*e0) + (q^2*ct)/(2*e0)*(2*s(1)-H))/((pi/6)*p_particle*d^3);

tspan = [0, 1.144];
x0 = [H, -3, gravity, buoyent, drag, collector, eletric_other, m];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, x0, opt);
disp([T, X])

plot(T,(X(:,1)))
hold off;
ax = gca;
%xlim(ax, [0, 0.4 * 10 ^(-8)])
ylim(ax, [0, 3]);
%grid('on');

function dsdt = dynamic(t,s)
    dsdt(1) = s(2);
    dsdt(2) = (s(4) + s(5) - s(3) - s(6) - s(7)) / s(8);
    %dsdt(2) = (s(3) + s(4) - s(6) + s(7)*(2*s(1) - s(8)))/s(9);
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt = dsdt.';
end
