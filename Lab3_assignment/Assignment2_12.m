%==========================================================================
% File: Assignment 1_1
% Author: Mathias Strand, Luca Grossetti     Date: 2021/03     Ver: 1.0
% Mälardalens Högskola - DVA400 Industrial Robotics
%==========================================================================
%
% Assignment 2.1
%
% Goal: Obtain the symbolic expression of a polynomial that envisages the 
% following symbolic variables:
% 
% Value variables: 
% -	q_i: initial value (i.e., value at t_i) 
% -	dq_i: derivative at initial value (i.e., at time t_i) 
% -	ddq_i: second derivative at initial value (i.e., at time t_i) 
% -	q_f: final value (i.e., value at time t_f) 
% -	dq_f: derivative at final value (i.e., at time t_f) 
% -	ddq_f: second derivative at final value (i.e., at time t_f) 
%  
% Time variables: 
% -	t_i: initial time 
% -	t_f: final time 
% 
% We have 6 boundary conditions resulting from initial and final value, 
% derivatives and second derivatives.
% Since we have 6 boundary condition, in order to satify them, we need a
% polynomial of order at least equal to 5:  QUINTIC POLYNOMIAL. 
%

clear all
%clc

% Initialize symbolics variables for quirtic polynomial: 
syms qi qf dqi dqf ddqi ddqf t_i t_f t
% Get symbolic expression:  
q = poly_trajD5(qi, qf ,dqi ,dqf ,ddqi ,ddqf, t_i, t_f, t);

% Assignment 2.2
%
% Given the previously obtained symbolic expression, 
% specialize the polynomial (namely, assign the values to the symbolic 
% variables) such that: 
% -	the polynomial can be used as a normalized time law (i.e., q_i = 0, 
% q_f = 1) in a doubly normalized polynomial scheme. 
% -	the polynomial is adapt for a pick and place operation, where there are
% zero first and second derivatives in both the initial and final instants 

% Compute the value of tau
T = t_f - t_i;
tau = t-t_i/T;
% Substitute the symbolic variables for real values
qs = subs(q, [dqi dqf ddqi ddqf], [0 0 0 0]);

