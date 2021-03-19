function[q] = poly_trajD4(qi, dqi, qf, dqf, qm, t_i, t_f, t_m, t)
% poly_trajD4.m function returns the position at time t solving the 
% quartic polynomial. 
% INPUT:
% -	qi: initial value (i.e., value at t_i) 
% -	dqi: derivative at initial value (i.e., at time t_i) 
% -	qf: final value (i.e., value at time t_f) 
% -	dqf: derivative at final value (i.e., at time t_f) 
% -	qm: value at a generic intermediate time t_m, where t_i < t_m < t_f
% -	t_i: initial time 
% -	t_f: final time 
% -	t_m: generic intermediate time
% - t: symbolic time variable
% OUTPUT:
% - q: position at time t

% Construct the vector of variables and the matrix A 
v = [qi dqi qf dqf qm]';
A = [1   t_i    t_i^2    t_i^3      t_i^4;
     0   1      2*t_i    3*t_i^2    4*t_i^3;
     1   t_f    t_f^2    t_f^3      t_f^4;
     0   1      2*t_f    3*t_f^2    4*t_f^3;
     1   t_m    t_m^2    t_m^3      t_m^4   ];
% Solve the linear system to get the coefficients
a = A\v;
% Compute the position at time t with a quartic polynomial
q = a(1) + a(2).*(t-t_i) + a(3).*(t-t_i)^2 + a(4).*(t-t_i)^3 + a(5).*(t-t_i)^4;

end


