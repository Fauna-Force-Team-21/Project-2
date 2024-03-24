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
