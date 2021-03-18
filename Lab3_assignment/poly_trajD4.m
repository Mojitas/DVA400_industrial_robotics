function[q] = poly_trajD4(qi, dqi, qf, dqf, qm, t_i, t_f, t_m, t)
%makes polynomial from inputs


v = [qi dqi qf dqf qm]';

A = [1 t_i t_i^2 t_i^3 t_i^4;
    0 1 2*t_i 3*t_i^2 4*t_i^3;
    1 t_f t_f^2 t_f^3 t_f^4;
    0 1 2*t_f 3*t_f^2 4*t_f^3;
    1 t_m t_m^2 t_m^3 t_m^4];

% invert to get the coefficients
a = inv(A)*v;
% trying the matrix way
q = qi + dqi.*(t-t_i) + a(3,1).*(t-t_i)^2 + a(4,1).*(t-t_i)^3 + a(5,1).*(t-t_i)^4;
% return posit_ion at t

end


