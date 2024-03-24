function [] = particlePlots(initial, concentration, particleName)
tspan = [0, 1.000000315];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, initial, opt);
figure (1)
plot(T, X(:, 1))
xlabel("Time")
ylabel("Distance of " + particleName + " Particles")
title("Distance of " + particleName + " Particles by Time")
figure (2)
plot(T, X(:, 2))
xlabel("Time")
ylabel("Velocity of " + particleName + " Particles")
title("Velocity of " + particleName + " Particles by Time")
figure (3)
plot(T, X(:, 3))
xlabel("Time")
ylabel("Acceleration of " + particleName + " Particles")
title("Acceleration of " + particleName + " Particles by Time")
figure(4)
plot(T, concentration)
xlabel("Time")
ylabel("Concentration of " + particleName + " Particles")
title("Concentration of " + particleName + " Particles by Time")
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