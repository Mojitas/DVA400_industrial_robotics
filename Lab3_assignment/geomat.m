syms o1 o2 o3 a1 a2 a3

T01 = [cos(o1) -sin(o1) 0 cos(o1)*a1;
      sin(o1) cos(o1) 0 sin(o1)*a1;
      0 0 1 0;
      0 0 0 1];
T12 = [cos(o2) -sin(o2) 0 cos(o2)*a2;
      sin(o2) cos(o2) 0 sin(o2)*a2;
      0 0 1 0;
      0 0 0 1];
T23 = [cos(o3) -sin(o3) 0 cos(o3)*a3;
      sin(o3) cos(o3) 0 sin(o3)*a3;
      0 0 1 0;
      0 0 0 1];
  %%
  
  Jp = [0 -(a2*sin(o2)+a3*sin(o2+o3)) -a3*sin(o2+o3);
        0 (a2*cos(o2)+a3*cos(o2+o3)) a3*cos(o2+o3);
        1 0 0];

  dJp = det(Jp);
  
  simplify(dJp)
  
  %%
  syms a b c
  Rz = [cos(a) -sin(a) 0;sin(a) cos(a) 0; 0 0 1];
  Rx = [1 0 0; 0 cos(b) -sin(b); 0 -sin(b) cos(a)];
  Ry = [cos(c) 0 sin(c); 0 1 0 ; -sin(c) 0 cos(c)];
  
  R = Rz*Rx*Ry
  
  