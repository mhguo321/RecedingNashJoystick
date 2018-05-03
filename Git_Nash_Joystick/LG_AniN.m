%%
function [AniCon]=LG_AniN(data_out,SamplePlotFreq,isCreateAVI)
AniCon.xQ1 = data_out(:,1);
AniCon.yQ1 = data_out(:,3);
AniCon.zQ1 = data_out(:,5);

AniCon.dxQ1 = data_out(:,2);
AniCon.dyQ1 = data_out(:,4);
AniCon.dzQ1 = data_out(:,6);

AniCon.phi1 = data_out(:,7);
AniCon.theta1 = data_out(:,9);
AniCon.psi1 = data_out(:,11);

AniCon.dphi1 = data_out(:,8);
AniCon.dtheta1 = data_out(:,10);
AniCon.dpsi1 = data_out(:,12);

AniCon.alpha1 = data_out(:,13);%+deg2rad(45);
AniCon.dalpha1 = data_out(:,14);
AniCon.beta1 = data_out(:,15);%+deg2rad(45);
AniCon.dbeta1 = data_out(:,16);

AniCon.alpha2 = data_out(:,17);%+deg2rad(180);
AniCon.dalpha2 = data_out(:,18);%+deg2rad(45);
AniCon.beta2 = data_out(:,19);%+deg2rad(45);
AniCon.dbeta2 = data_out(:,20);%+deg2rad(45);

AniCon.phi2 = data_out(:,21);
AniCon.theta2 = data_out(:,23);
AniCon.psi2 = data_out(:,25);
AniCon.dphi2 = data_out(:,22);
AniCon.dtheta2 = data_out(:,24);
AniCon.dpsi2 = data_out(:,26);

Lr = 1;
AniCon.xP = AniCon.xQ1 - Lr*cos(AniCon.beta1).*cos(AniCon.alpha1);
AniCon.yP = AniCon.yQ1 - Lr*cos(AniCon.beta1).*sin(AniCon.alpha1);
AniCon.zP = AniCon.zQ1 - Lr*sin(AniCon.beta1);

AniCon.xQ2 = AniCon.xP + Lr*cos(AniCon.beta2).*cos(AniCon.alpha2);
AniCon.yQ2 = AniCon.yP + Lr*cos(AniCon.beta2).*sin(AniCon.alpha2);
AniCon.zQ2 = AniCon.zP + Lr*sin(AniCon.beta2);

AniCon.posQ1 = [AniCon.xQ1,AniCon.yQ1,AniCon.zQ1];
AniCon.posQ2 = [AniCon.xQ2,AniCon.yQ2,AniCon.zQ2];
AniCon.posP = [AniCon.xP,AniCon.yP,AniCon.zP];
% Euler = [phi1,theta1,psi1];
R1 = euler2rotMat(AniCon.phi1,AniCon.theta1,AniCon.psi1);
R2 = euler2rotMat(AniCon.phi2,AniCon.theta2,AniCon.psi2);

% SamplePlotFreq = 10;
% SamplePlotFreq = 25*2000;
% isCreateAVI = 0;
isFixView = false;
% traj.des_x = des_x;
% traj.des_y = des_y;
% traj.des_z = des_z;
LG_6DoFAnimiation_Double(AniCon.posQ1,R1,AniCon.posQ2,R2,AniCon.posP,...
    SamplePlotFreq,'DotsOnly',isCreateAVI,isFixView);
% hold on;
% plot3(des_x,des_y,des_z,'r');

function R = euler2rotMat(phi, theta, psi)
    R(1,1,:) = cos(psi).*cos(theta);
    R(1,2,:) = -sin(psi).*cos(phi) + cos(psi).*sin(theta).*sin(phi);
    R(1,3,:) = sin(psi).*sin(phi) + cos(psi).*sin(theta).*cos(phi);
    
    R(2,1,:) = sin(psi).*cos(theta);
    R(2,2,:) = cos(psi).*cos(phi) + sin(psi).*sin(theta).*sin(phi);
    R(2,3,:) = -cos(psi).*sin(phi) + sin(psi).*sin(theta).*cos(phi);
    
    R(3,1,:) = -sin(theta);
    R(3,2,:) = cos(theta).*sin(phi);
    R(3,3,:) = cos(theta).*cos(phi);
end
