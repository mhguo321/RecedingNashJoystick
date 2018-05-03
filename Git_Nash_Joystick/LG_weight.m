function [ weight ] = LG_weight()
%% Leader: Q1, R11, R12
%   Detailed explanation goes here
Q1 = eye(26);
% error_Q1_x = 10;% bigger value means smaller weight
% error_Q1_dx = 50;
% error_Q1_y = 10;
% error_Q1_dy = 50;
% error_Q1_z = 10;
% error_Q1_dz = 50;

error_Q1_x = 0.1;
error_Q1_dx = 0.6;
error_Q1_y = 0.1;
error_Q1_dy = 0.6;
error_Q1_z = 0.1;
error_Q1_dz = 0.5;


% error_Q1_x = 0.01;
% error_Q1_dx = 0.06;
% error_Q1_y = 0.01;
% error_Q1_dy = 0.06;
% error_Q1_z = 0.01;
% error_Q1_dz = 0.05;

% % % % % % error_Q1_x = 0.005;
% % % % % % error_Q1_dx = 0.06;
% % % % % % error_Q1_y = 0.005;
% % % % % % error_Q1_dy = 0.06;
% % % % % % error_Q1_z = 0.001;
% % % % % % error_Q1_dz = 0.05;

% error_Q1_phi = deg2rad(2);
% error_Q1_dphi = deg2rad(1);
% error_Q1_theta = deg2rad(2);
% error_Q1_dtheta = deg2rad(1);
% error_Q1_psi = deg2rad(1);
% error_Q1_dpsi = deg2rad(2);

error_Q1_phi = deg2rad(35);
error_Q1_dphi = deg2rad(10);
error_Q1_theta = deg2rad(35);
error_Q1_dtheta = deg2rad(10);
error_Q1_psi = deg2rad(35);
error_Q1_dpsi = deg2rad(10);

error_alpha1 = deg2rad(20);
error_dalpha1 = deg2rad(40);
error_beta1 = deg2rad(20);
error_dbeta1 = deg2rad(40);

error_alpha2 = deg2rad(20);
error_dalpha2 = deg2rad(40);
error_beta2 = deg2rad(20);
error_dbeta2 = deg2rad(40);

error_Q2_phi = deg2rad(65);
error_Q2_dphi = deg2rad(10);
error_Q2_theta = deg2rad(65);
error_Q2_dtheta = deg2rad(10);
error_Q2_psi = deg2rad(1);
error_Q2_dpsi = deg2rad(10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Q1: position and speed
% Q1(1,1) = 1/error_Q1_x;
% Q1(2,2) = 1/error_Q1_dx;
% Q1(3,3) = 1/error_Q1_y;
% Q1(4,4) = 1/error_Q1_dy;
% Q1(5,5) = 1/error_Q1_z;
% Q1(6,6) = 1/error_Q1_dz;
Q1(1,1) = 1/error_Q1_x*20;
Q1(2,2) = 1/error_Q1_dx*10;
Q1(3,3) = 1/error_Q1_y*20;
Q1(4,4) = 1/error_Q1_dy*10;
Q1(5,5) = 1/error_Q1_z*20;
Q1(6,6) = 1/error_Q1_dz*10;
% Q1: phi1, theta1, psi1
Q1(7,7) = 1/error_Q1_phi;
Q1(8,8) = 1/error_Q1_dphi;
Q1(9,9) = 1/error_Q1_theta;
Q1(10,10) = 1/error_Q1_dtheta;
Q1(11,11) = 1/error_Q1_psi;
Q1(12,12) = 1/error_Q1_dpsi;
% Q1: alpha1 and beta1
Q1(13,13) = 1/error_alpha1;
Q1(14,14) = 1/error_dalpha1;
Q1(15,15) = 1/error_beta1;
Q1(16,16) = 1/error_dbeta1;
% Q2: alpha2 and beta2
Q1(17,17) = 1/error_alpha2;
Q1(18,18) = 1/error_dalpha2;
Q1(19,19) = 1/error_beta2;
Q1(20,20) = 1/error_dbeta2;
% Q2: phi2, theta2, psi2
Q1(21,21) = 1/error_Q2_phi;
Q1(22,22) = 1/error_Q2_dphi;
Q1(23,23) = 1/error_Q2_theta;
Q1(24,24) = 1/error_Q2_dtheta;
Q1(25,25) = 1/error_Q2_psi;
Q1(26,26) = 1/error_Q2_dpsi;

w_Total = 100;
w_F = 1/5;
w_M = 1/1;
R11 = w_Total*1*diag([w_F,w_M,w_M,w_M]);

w_Total = 100;
w_F = 1/5;
w_M = 1/1;
R12 = w_Total*1*diag([w_F,w_M,w_M,w_M]);

%% Follower: Q2,R21,R22
Q2 = eye(26);
error_Q1_x = 100;% bigger value means smaller weight
error_Q1_dx = 500;
error_Q1_y = 100;
error_Q1_dy = 500;
error_Q1_z = 100;
error_Q1_dz = 500;
% error_Q1_x = 100;% bigger value means smaller weight
% error_Q1_dx = 1;
% error_Q1_y = 100;
% error_Q1_dy = 1;
% error_Q1_z = 100;
% error_Q1_dz = 1;

error_Q1_phi = deg2rad(50);
error_Q1_dphi = deg2rad(100);
error_Q1_theta = deg2rad(50);
error_Q1_dtheta = deg2rad(100);
error_Q1_psi = deg2rad(50);
error_Q1_dpsi = deg2rad(100);

error_alpha1 = deg2rad(0.5);%0.5
error_dalpha1 = deg2rad(10);
error_beta1 = deg2rad(0.2);
error_dbeta1 = deg2rad(40);

error_alpha2 = deg2rad(0.5);%0.5
error_dalpha2 = deg2rad(10);
error_beta2 = deg2rad(0.2);
error_dbeta2 = deg2rad(40);

% error_Q2_phi = deg2rad(50);
% error_Q2_dphi = deg2rad(100);
% error_Q2_theta = deg2rad(50);
% error_Q2_dtheta = deg2rad(100);
% error_Q2_psi = deg2rad(1);
% error_Q2_dpsi = deg2rad(2);

error_Q2_phi = deg2rad(1);
error_Q2_dphi = deg2rad(2);
error_Q2_theta = deg2rad(1);
error_Q2_dtheta = deg2rad(2);
error_Q2_psi = deg2rad(1);
error_Q2_dpsi = deg2rad(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Q1: position and speed
Q2(1,1) = 1/error_Q1_x;
Q2(2,2) = 1/error_Q1_dx;
Q2(3,3) = 1/error_Q1_y;
Q2(4,4) = 1/error_Q1_dy;
Q2(5,5) = 1/error_Q1_z;
Q2(6,6) = 1/error_Q1_dz;
% Q1: phi1, theta1, psi1
Q2(7,7) = 1/error_Q1_phi;
Q2(8,8) = 1/error_Q1_dphi;
Q2(9,9) = 1/error_Q1_theta;
Q2(10,10) = 1/error_Q1_dtheta;
Q2(11,11) = 1/error_Q1_psi;
Q2(12,12) = 1/error_Q1_dpsi;
% Q1: alpha1 and beta1
Q2(13,13) = 1/error_alpha1;
Q2(14,14) = 1/error_dalpha1;
Q2(15,15) = 1/error_beta1;
Q2(16,16) = 1/error_dbeta1;
% Q2: alpha2 and beta2
Q2(17,17) = 1/error_alpha2;
Q2(18,18) = 1/error_dalpha2;
Q2(19,19) = 1/error_beta2;
Q2(20,20) = 1/error_dbeta2;
% Q2: phi2, theta2, psi2
Q2(21,21) = 1/error_Q2_phi;
Q2(22,22) = 1/error_Q2_dphi;
Q2(23,23) = 1/error_Q2_theta;
Q2(24,24) = 1/error_Q2_dtheta;
Q2(25,25) = 1/error_Q2_psi;
Q2(26,26) = 1/error_Q2_dpsi;

w_Total = 1;
w_F = 1/1;
w_M = 1/1;
R21 = w_Total*1*diag([w_F,w_M,w_M,w_M]);

w_Total = 1;
w_F = 1/1;
w_M = 1/1;
R22 = w_Total*1*diag([w_F,w_M,w_M,w_M]);

weight.Q1 = Q1;
weight.R11 = R11;
weight.R12 = R12;

weight.Q2 = Q2;
weight.R21 = R21;
weight.R22 = R22;
end

