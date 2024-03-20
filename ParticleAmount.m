function [totals] = particleAmount(particles)
    ugToG = 1e-6;
    pm25 = 20.7;
    pm10 = 52.1;
    o3 = 121.8;
    no2 = 32.7; 
    so2 = 2.1;
    co = 523.8;
    c6h6 = 13;

totalMass = pm25 + pm10 + o3 + no2 + so2 + co + c6h6;
    keys = ["pm25", "pm10", "o3", "no2", "co", "c6h6"];
    values = [pm25, pm10, o3, no2, so2, co, c6h6];
    values = values ./ totalMass .* particles;
    totals = dictionary(keys, values);
end