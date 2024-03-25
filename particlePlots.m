function [] = particlePlots(initial, concentration, particleName)
tspan = [0, 5.2];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, initial, opt);
m = initial(8);
[rows, cols] = size([T, X]);
Fe = initial(6);
for t=1:rows
    axt(t) = Fe / m;
    vxt(t) = ((Fe / m) * T(t));
    dxt(t) = Fe / ((2 * m)) * T(t)^2;
end
magX = sqrt(X(:,1).^2 + dxt(:).^2);
magV = sqrt(X(:,2).^2 + vxt(:).^2);
magA = sqrt(X(:,3).^2 + axt(:).^2);
figure (1)
plot(T, X(:,1))
xlabel("Time")
ylabel("Distance of " + particleName + " Particles")
title("Distance of " + particleName + " Particles by Time")
figure (2)
plot(T, X(:,2))
xlabel("Time")
ylabel("Velocity of " + particleName + " Particles")
title("Velocity of " + particleName + " Particles by Time")
figure (3)
plot(T, X(:,3))
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
    dsdt(2) = (s(5)*s(2)^2 + s(4) - s(3) + s(7)*(2*s(1)-3))/(s(8) * 6.023 * 10^(23));
    dsdt(3) = 0;
    dsdt(4) = 0;
    dsdt(5) = 0;
    dsdt(6) = 0;
    dsdt(7) = 0;
    dsdt(8) = 0;
    dsdt = dsdt.';
end