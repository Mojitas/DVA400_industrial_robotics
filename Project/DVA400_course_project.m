%%  Some kind of trajectory
pc = zeros(3,2);
for j = 1:3  %% generate points
    pc(j,:) = [real(0.8*exp(i*(j-1)*2*pi/3)), imag(0.8*exp(i*(j-1)*2*pi/3))];
end

for j = 1:2
    rob_traj(:,:,j) = jtraj(pc(j,:),pc(j+1,:),50);
end

pts = [0.8 0 0; -0.4 0.6928 0; -0.4 -0.6928 0];
plot(pts(:,1,1), pts(2,:,2));


%%

plot(polartr)

%% load the robot
mdl_puma560

qHome = [pi/2 pi/3 -pi 0 0 0];

q_first = [1 0 0 0 0 0]; % start pose 
q_last = [1 1 0 0 0 0]; % finish pose
p = [0.5 0.5 0];  %ee position
T = transl(p) * troty(-pi/2); 
qr(1) = -pi/2; % start rotation of link 1

qqr = p560.ikine6s(T, 'rd');  %inverse kinematics of T
qrt = jtraj(q_first, qqr, 50);  % create a trajectory

ae = [130 20]; % viewing angle
p = [0.5 0.5 0]; %ball position
clf                 %clear figures

%plot_sphere(p, 0.05, 'y');
% plot pose
p560.plot3d(qHome, 'view', ae);
%% test the different trajectories
radius = 0.85;
cpt = [radius*exp(i*2*pi/3) radius*exp(i*4*pi/3)];
t = 0:0.1:2;

% nice triangle 
eepos1 = [radius 0 0]; 
eepos2 = [real(cpt(1,1)) imag(cpt(1,1)) 0];
eepos3 = [real(cpt(1,2)) imag(cpt(1,2)) 0];

T1 = transl(eepos1); %makes a homogenous transformation of the eepos
T2 = transl(eepos2);
T3 = transl(eepos3);

% the different points to travel to
q1 = p560.ikine6s(T1);
q2 = p560.ikine6s(T2);
q3 = p560.ikine6s(T3);

% the different trajectories
qtraj = jtraj(qHome, q1, t);
qtraj1 = jtraj(q1, q2, t);
qtraj2 = jtraj(q2, q3, t);
qtraj3 = jtraj(q3, q1, t);

% plot the motion
p560.plot(qtraj);
p560.plot(qtraj1);
p560.plot(qtraj2);
p560.plot(qtraj3);
% This produces a trajectory that isn't straight



