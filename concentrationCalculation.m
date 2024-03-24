function [conts, distance, velocity, acceleration] = concentrationCalculation(initial)
tspan = [0, 1.000000315];
opt = odeset('RelTol',1*exp(-8), 'AbsTol',1*exp(-8));
[T,X] = ode45(@dynamic, tspan, x0, opt);
conts = [];
conts(1) = 0
for i = 2:41
    ct = ((pi/6)* p_particle *d^3*(X(i,3)) - (pi/6)*(p_fluid-p_particle)*g*d^3 - (0.5*p_fluid*C_d*(pi/4) * (d)^2 * ((X(i,2) - 3)^2) + (q*o)/(2*e0))) * ((2*e0)/(q^2 * (2*(X(i,1)+H)-H)));
    ct = abs(ct)
    conts(i) = ct + conts(i-1); 
end


