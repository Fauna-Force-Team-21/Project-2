function [totals] = ParticleAmount(particles)
    micro = 10^(-6);
    % ppm values
    pm25 = 20.7;
    pm10 = 52.1;
    o3 = 121.8;
    no2 = 32.7; 
    so2 = 2.1;
    co = 523.8;
    c6h6 = 13;

    totalMass = pm25 + pm10 + o3 + no2 + so2 + co + c6h6;

    % generates percentages cumulativily 
    pm25P = pm25/totalMass;
    pm10P = pm10/totalMass + pm25P;
    o3P = o3/totalMass + pm10P;
    no2P = no2/totalMass + o3P; 
    so2P = so2/totalMass + no2P;
    coP = co/totalMass + so2P;
    c6h6P = c6h6/totalMass + coP;


    % generates random particle
    pm25i = 0;
    pm10i = 0;
    o3i = 0;
    no2i = 0;
    so2i = 0;
    coi = 0;
    c6h6i = 0;


    for i = rand(1, particles)
        if(i < pm25P)
            pm25i = pm25i + 1;
        elseif(i < pm10P)
            pm10i = pm10i + 1;
        elseif(i < o3P)
            o3i = o3i + 1;
        elseif(i < no2P)
            no2i = no2i + 1;
        elseif(i < so2P)
            so2i = so2i + 1;
        elseif(i < coP)
            coi = coi + 1;
        else
            c6h6i = c6h6i + 1;
        end
    end

    totals = table(pm25i, pm10i, o3i, no2i, so2i, coi, c6h6i);
end