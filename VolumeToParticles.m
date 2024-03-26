function [totals] = VolumeToParticles(volume)
    micro = 10^(-9);
    % kg/m^3
    pm25 = 20.7 * micro / 1000;
    pm10 = 52.1 * micro / 1000;
    o3 = 121.8 * micro / 1000;
    no2 = 32.7 * micro / 1000; 
    so2 = 2.1 * micro / 1000;
    co = 523.8 * micro / 1000;
    c6h6 = 13 * micro / 1000;
    co2 =  400 * micro / 1000;

    co2g = co2 * volume;
    pm25g = pm25 * volume;
    pm10g = pm10 * volume;
    o3g = o3 * volume;
    no2g = no2 * volume; 
    so2g = so2 * volume;
    cog = co * volume;
    c6h6g = c6h6 * volume;



    pm25i = ceil(pm25g / (6.019594 * 10^(-25)));
    pm10i = ceil(pm10g / (2.4078 * 10^(-24)));
    o3i = ceil(o3g / (7.97077 * 10^(-26)));
    co2i = ceil(co2g / (7.3 * 10^(-26)));
    no2i = ceil(no2g / (7.639571 * 10^(-26)));
    so2i = ceil(so2g / (1.063868 * (10^-25)));
    coi = ceil(cog / (4.652786 * 10^(-26)));
    c6h6i = ceil(c6h6g / (1.297 * 10^(-25)));

    keys = ["pm25", "pm10", "o3", "no2", "so2", "co", "c6h6", "co2"];
    totals = table(pm25i, pm10i, o3i, no2i, so2i, coi, c6h6i, co2i);
    
end