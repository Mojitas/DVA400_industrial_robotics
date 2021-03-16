 %Assignment 1.1
%{
Obtain the symbolic expression of a polynomial that envisages the following symbolic variables:

Value variables: 
-	q_i: initial value (i.e., value at t_i) 
-	dq_i: derivative at initial value (i.e., at time t_i) 
-	q_f: final value (i.e., value at time t_f) 
-	dq_f: derivative at final value (i.e., at time t_f) 
-	q_m: value at a generic intermediate time t_m, where t_i < t_m < t_f 
 
Time variables: 
-	t_i: initial time 
-	t_f: final time 
-	t_m: generic intermediate time 
 %}
 
 
%returns symbolic expression if input is symbolic, if values are inputted
%then the position q is returned at time t_m

syms qi dqi ddqi qf dqf ddqf qm t_m t_i t_f;

qi = 1;
qf = 5;
dqi = 0
dqf = 0
t_i=0;
t_f=10;

for i = 0:10
q = poly_trajD3(qi, qf, dqi, dqf, t_i, t_f, i)

end


 
 
 
 
%%
%Assignment 1.2
%{
Wrap the obtained expression for a polynomial in a simulink block, and test it for different values of the symbolic variables (e.g., Value = [0,0,0,0,3], Time = [0,10,3]). 
 
 %}
 
%Assignment 2: “normalized pick and place polynomial” 
 %{
Assignment 2.1: 
Obtain the symbolic expression of a polynomial that envisages the following symbolic variables: 
 
Value variables: 
-	q_i: initial value (i.e., value at t_i) 
-	dq_i: derivative at initial value (i.e., at time t_i) 
-	ddq_i: second derivative at initial value (i.e., at time t_i) 
-	q_f: final value (i.e., value at time t_f) 
-	dq_f: derivative at final value (i.e., at time t_f) 
-	ddq_f: second derivative at final value (i.e., at time t_f) 
  
Time variables: 
-	t_i: initial time 
-	t_f: final time 
 %}

%Assignment 2.2: 
%{
Given the previously obtained symbolic expression, specialize the polynomial (namely, assign the values to the symbolic variables) such that: 
  
-	the polynomial can be used as a normalized time law (i.e., q_i = 0, q_f = 1) in a doubly normalized polynomial scheme. 
-	the polynomial is adapt for a pick and place operation, where there are zero first and second derivatives in both the initial and final instants 
  
Note: as a result of the specialization of the polynomial, you should obtain an expression that depends only on time ‘t’ (that in this context means normalized time tau) 
 %}

%Assignment 2.3: 
%{
Wrap the obtained expression for a polynomial in a Simulink block, where you realize a doubly-normalized polynomial scheme. There will be three blocks: - time2tau: Simulink block transforming time t into parameter tau 
-	polynomial: the specialized polynomial transforming tau into sigma 
-	polynomial: a normalized first-order polynomial transforming sigma into the actual value over time 
 
Test your assembly with for different values of the remained symbolic variables (e.g., Value = [1.5,4], Time = [0,10]). 
%}


