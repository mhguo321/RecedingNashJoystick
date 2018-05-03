%% test receding Nash control
clear;clc;close all;
Fs = 50;%20;
HorizonTime = 2;
% SimT = 20;
dT = 1/Fs;
N = HorizonTime/dT;
% Len = SimT/dT;

[ sys,sysd ] = LG_lf_double_Leader(1/Fs);
[ weight ] = LG_weight();

A = sysd.A;
B1 = sysd.B1;
B2 = sysd.B2;
Q1 = weight.Q1;
Q2 = weight.Q2;
R11 = weight.R11;
R22 = weight.R22;

R12 = R22;
R21 = R11;

P1_next = Q1;
P2_next = Q2;
%%
Tx2 = eye(26);
% Tx2(1,1) = 0;Tx2(3,3) = 0;Tx2(5,5) = 0;

[ Hu,Hv ] = LG_Nash_Sol_1st( N,Q1,R11,Q2,R22,A,B1,B2 );
sim('Sim_NashDis_Joystick.mdl',[0,10*60]);
%%
% AniCon=LG_AniN(data_out,5,false);