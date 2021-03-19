%==========================================================================
% File: Assignment 1_1
% Author: Mathias Strand, Luca Grossetti     Date: 2021/03     Ver: 1.0
% Mälardalens Högskola - Course in Industrial Robotics
%==========================================================================
%
% Goal: Obtain the symbolic expression of a polynomial that envisages the 
% following symbolic variables:
%
% Value variables: 
% -	q_i: initial value (i.e., value at t_i) 
% -	dq_i: derivative at initial value (i.e., at time t_i) 
% -	q_f: final value (i.e., value at time t_f) 
% -	dq_f: derivative at final value (i.e., at time t_f) 
% -	q_m: value at a generic intermediate time t_m, where t_i < t_m < t_f 
% 
% Time variables: 
% -	t_i: initial time 
% -	t_f: final time 
% -	t_m: generic intermediate time 
%
% We have 5 boundary conditions: four boundary conditions resulting from 
% initial and final value, derivatives plus the boundary condition at a 
% generic intermidiate time.
% Since we have 5 boundary condition, in order to satify them, we need a
% polynomial of order at least equal to 4: QUARTIC POLYNOMIAL.  

clear all
clc

% Initialize symbolics variables for quartic polynomial: 
syms qi dqi qf dqf qm t_i t_f t_m t;
% Get symbolic polynomial 
q = poly_trajD4(qi, qf, dqi, dqf, qm, t_i, t_f, t_m, t);  
% Substitute the symbolic variables for real values
qs = subs(q, [qi qf dqi dqf qm t_i t_f t_m], [0 0 0 0 3 0 10 3]);
