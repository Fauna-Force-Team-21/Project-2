function[a_vert, v_vert, d_vert] = particleMotionEquations()
p_fluid = 1.229;
v_0 = 3
g = 9.81;
d = 0.00001;
pi = 3.141592653589793;
A = pi * (d / 2)^2;
u = 1.73 * 10^(-5);
C_d = 0.47;
V = (4 / 3) * pi * (d / 2)^3;
m = 2.407 * 10^(-24)
p_particle = m / V;
q = 1.6 * 10^(-19);
H = 7;
e_0 = 8.854187817 * 10^(-12);
v_term = sqrt((2 * m * g) / (p_fluid * A * C_d));
syms c_t D_vert

F_buoyant = (pi / 6) * p_fluid * g * (d)^3
F_g = (pi / 6) * p_particle * g * (d)^3
F_drag = (3 * pi * u * d * v_term^2)
F_s = (q^2) / (2 * pi * A * e_0)
F_e = ((q^2 * c_t) / (2 * e_0)) * (2 * D_vert - H)

a_t = (F_buoyant + F_g - F_drag - F_s - F_e) / m;

end

