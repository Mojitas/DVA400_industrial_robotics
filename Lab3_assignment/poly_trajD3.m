function [outputArg1] = poly_trajD3(qi, qf ,dqi ,dqf ,t_i ,t_f, t)
%makes polynomial from inputs

v = [qi dqi qf dqf]';

A = [1 t_i t_i^2 t_i^3; 
     0 1 2*t_i 3*t_i^2; 
     1 t_f t_f^2 t_f^3; 
     0 1 2*t_f 3*t_f^2];

% invert to get the coefficients
a = inv(A)*v;
% trying the matrix way
q = qi + dqi.*(t-t_i) + a(3,1).*(t-t_i)^2 + a(4,1).*(t-t_i)^3;
% return position at t
outputArg1 = q;

end


