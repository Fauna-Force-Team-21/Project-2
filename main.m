clc
clear
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
%particle_diameter = input("What is the diameter of X particle: ")
%gravityForce = particleGravity(particle_diameter);

%volume = VolumeAir(1, 1.8, 3)
%VolumeToParticles(volume)

volume = VolumeAir(1/3600 * 5.5, 1.8, 3)
VolumeToParticles(volume)
% ParticleAmount(1000)
%-----------------------------------------------------------------
concNO2 = concentrationCalculation(NO2, masses(1), diameter(1));
concSO2 = concentrationCalculation(SO2, masses(2), diameter(2));
concCO2 = concentrationCalculation(CO2, masses(3), diameter(3));
concCO = concentrationCalculation(CO, masses(4), diameter(4));
concC6H6 = concentrationCalculation(C6H6, masses(5), diameter(5));
concO3 = concentrationCalculation(O3, masses(6), diameter(6));
concPM10 = concentrationCalculation(PM_10, masses(7), diameter(7));
concPM_2_5 = concentrationCalculation(PM_2_5, masses(8), diameter(8));
%------------------------------------------------------------------

% particleName = input("What is the particle name: ", 's');
% list = input("What is the list name: ");
% concPM10 = input("What is the concentration name: ");
% particlePlots(list, concPM10, particleName);

volume = VolumeAir(1/3600, 1.8, 3)
particles = VolumeToParticles(volume)
ParticleSimulation(particles, NO2)
