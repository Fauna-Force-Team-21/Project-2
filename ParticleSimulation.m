function [] = ParticleSimulation(particles, initial)
    pm25 = particles.pm25i(1);
    pm10 = particles.pm10i(1);
    o3 = particles.o3i(1);
    no2 = particles.no2i(1);
    so2 = particles.so2i(1);
    co = particles.coi(1);
    c6h6 = particles.c6h6i(1);

    disp("Running");

    ayt = -(initial(5)*initial(2)^2 + initial(4) - initial(3) + initial(7)*(2*initial(1)-3)/(initial(8) * 6.023*10^23));
    t = 0:0.05:5;
    vyt = zeros(size(t));
    vyt(1) = -3;
    dyt = zeros(size(t));
    dyt(1) = 3;

    for i = 2:length(t)
        vyt(i) = 0.05 * ayt + vyt(i - 1);
    end

    for i = 2:length(t)
        dyt(i) = 0.05 * vyt(i) + dyt(i - 1);
    end

    

    Fe = initial(6);
    axt = Fe / initial(3)/ 9.81;
    vxt = zeros(size(t));
    dxt = zeros(size(t));
    for i = 2:length(t)
        vxt(i) = axt * 0.05 + vxt(i - 1);
    end

    for i = 2:length(t)
        dxt(i) = vxt(i) * 0.05 + dxt(i - 1);
    end
    
    figure(1)
    plot(t,dxt)
    figure(2)
    plot(t,vxt)
    figure(3)
    plot(t,axt)
end
