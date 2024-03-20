function [gravity] = particleGravity(particle_diameter)
pi = 3.14159265;
g = 9.81; 
densityParticle = (4/3) * pi * (particle_diameter / 2)^3;
gravity = (pi / 6) * (densityParticle * g * particle_diameter^3)
end
