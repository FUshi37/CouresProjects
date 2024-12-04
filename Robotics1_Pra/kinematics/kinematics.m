clear;clc;
alpha0=0;alpha1=-pi/2;alpha2=0;alpha3=0;alpha4=pi/2;alpha5=-pi/2;
a0=0;a1=0;a2=0.185;a3=0.17;a4=0;a5=0;
d1=0.23;d2=0;d3=0;d4=0.023;d5=0.077;d6=0.0855;
syms t1 t2 t3 t4 t5 t6
syms d_1 d_4 d_5 d_6 a_2 a_3
syms nx ny nz ox oy oz ax ay az px py pz
syms s2 s3 m n c2 c3
% t1=0.0;t2=0.0;t3=0.0;t4=0.0;t5=0.0;t6=0.0;

%L1 = Link([0    d1      a0      alpha0      0], 'modified');
%L2 = Link([0    d2      a1      alpha1      0], 'modified');
%L3 = Link([0    d3      a2      alpha2      0], 'modified');
%L4 = Link([0    d4      a3      alpha3      0], 'modified');
%L5 = Link([0    d5      a4      alpha4      0], 'modified');
%L6 = Link([0    d6      a5      alpha5      0], 'modified');

%robot=SerialLink([L1, L2, L3, L4, L5, L6]);
%robot.name='arm'
%robot.display();
%view(3);
%robot.teach();s

T0 = [cos(t1) -sin(t1) 0 0;sin(t1) cos(t1) 0 0;0 0 1 d_1; 0 0 0 1];
% T1 = [cos(t2-pi/2) -sin(t2-pi/2) 0 0;0 0 1 0;-sin(t2-pi/2) -cos(t2-pi/2) 0 0;0 0 0 1];
T1 = [sin(t2) cos(t2) 0 0;0 0 1 0;cos(t2) -sin(t2) 0 0;0 0 0 1];
T2 = [cos(t3) -sin(t3) 0 a_2;sin(t3) cos(t3) 0 0;0 0 1 0;0 0 0 1];
% T3 = [cos(t4+pi/2) -sin(t4+pi/2) 0 a3;sin(t4+pi/2) cos(t4+pi/2) 0 0;0 0 1 d4;0 0 0 1];
% T4 = [cos(t5+pi/2) -sin(t5+pi/2) 0 0;0 0 -1 -d5;sin(t5+pi/2) cos(t5+pi/2) 0 0;0 0 0 1];
T3 = [-sin(t4) -cos(t4) 0 a_3;cos(t4) -sin(t4) 0 0;0 0 1 d_4;0 0 0 1];
T4 = [-sin(t5) -cos(t5) 0 0;0 0 -1 -d_5;cos(t5) -sin(t5) 0 0;0 0 0 1];
T5 = [cos(t6) -sin(t6) 0 0;0 0 -1 -d_6;sin(t6) cos(t6) 0 0;0 0 0 1];

% T0 = [cos(t1) -sin(t1) 0 0;sin(t1) cos(t1) 0 0;0 0 1 d_1; 0 0 0 1];
% T1 = [cos(t2-pi/2) -sin(t2-pi/2) 0 0;0 0 1 0;-sin(t2-pi/2) -cos(t2-pi/2) 0 0;0 0 0 1];
% T2 = [cos(t3) -sin(t3) 0 a_2;sin(t3) cos(t3) 0 0;0 0 1 0;0 0 0 1];
% T3 = [cos(t4+pi/2) -sin(t4+pi/2) 0 a_3;sin(t4+pi/2) cos(t4+pi/2) 0 0;0 0 1 d_4;0 0 0 1];
% T4 = [cos(t5) -sin(t5) 0 0;0 0 -1 -d_5;sin(t5) cos(t5) 0 0;0 0 0 1];
% T5 = [cos(t6) -sin(t6) 0 0;0 0 1 d_6;-sin(t6) -cos(t6) 0 0;0 0 0 1];


% T = T0*T1*T2*T3*T4*T5;
% latex(T)
% latex((simplify(T)))
% A = [-a_3*s3 a_3*c3+a_2;a_3*c3+a_2 a_3*s3];
% B = [m;n];
% C = inv(A)*B
% latex(simplify(C))
T = [nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1];
% latex(T)
latex(simplify(inv(T0)*T*inv(T5)*inv(T4)))
latex(simplify(T1*T2*T3))
% 
% syms s2 s3 c2 c3 m n
% A = [a_3*c3+a_2 -a_3*s3;a_3*s3 a_3*c3+a_2];
% B = [m;n];
% C = inv(A)*B;
% simplify(C)
% latex(C)