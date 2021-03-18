function [q] = poly_trajD5(qi, qf ,dqi ,dqf ,ddqi ,ddqf, t_i, t_f, t)
% poly_trajD5.m function returns the position at time t solving the 
% quintic polynomial. 
% INPUT:
% -	qi: initial value (i.e., value at t_i) 
% -	qf: final value (i.e., value at time t_f) 
% -	dqi: derivative at initial value (i.e., at time t_i) 
% -	dqf: derivative at final value (i.e., at time t_f) 
% -	ddq_i: second derivative at initial value (i.e., at time t_i) 
% -	ddq_f: second derivative at final value (i.e., at time t_f)
% -	t_i: initial time 
% -	t_f: final time 
% - t: symbolic time variable
% OUTPUT:
% - q: position at time t

% Construct the vector of variables and the matrix A 
v = [qi dqi ddqi qf dqf ddqf]';
A = [1    t_i    t_i^2   t_i^3    t_i^4     t_i^5; 
     0    1      2*t_i   3*t_i^2  4*t_i^3   5*t_i^4; 
     0    0      2       6*t_i    12*t_i^2  20*t_i^3; 
     1    t_f    t_f^2   t_f^3    t_f^4     t_f^5;
     0    1      2*t_f   3*t_f^2  4*t_f^3   5*t_f^4;
     0    0      2       6*t_f    12*t_f^2  20*t_f^3  ];

% Solve the linear system to get the coefficients
a = A\v;
% Compute the position at time t with a quintic polynomial
q = a(1) + a(2)*(t-t_i) + a(3)*(t-t_i)^2 + a(4)*(t-t_i)^3 + a(5)*(t-t_i)^4 + a(6)*(t-t_i)^5;

end


