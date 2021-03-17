function [q] = poly_trajD5(qi, qf ,dqi ,dqf ,ddqi ,ddqf, t_i, t_f, t)
%make quintic polynomial

v = [qi dqi ddqi qf dqf ddqf]';

A = [1 t_i t_i^2 t_i^3 t_i^4 t_i^5; 
     0 1 2*t_i 3*t_i^2 4*t_i^3 5*t_i^4; 
     0 0 2 6*t_i 12*t_i^2 20*t_i^3; 
     1 t_f t_f^2 t_f^3 t_f^4 t_f^5;
     0 1 2*t_f 3*t_f^2 4*t_f^3 5*t_f^4;
     0 0 2 6*t_f 12*t_f^2 20*t_f^3];
 
% invert to get the coefficients
a = inv(A)*v;

% stich together the polynomial
q = a(1,1) + a(2,1)*(t-t_i) + a(3,1)*(t-t_i)^2 + a(4,1)*(t-t_i)^3 + a(5,1)*(t-t_i)^4 + a(6,1)*(t-t_i)^5;
% return position at t

end


