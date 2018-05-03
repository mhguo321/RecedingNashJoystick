function [phandles] = LG_plot_initial(fig,state)
%LG_PLOT_INITIAL Summary of this function goes here
%   Detailed explanation goes here
%% Import data
Lr = 1;

xQ1  = state(1);
yQ1  = state(3);
zQ1  = state(5);

phi1    = state(7);
theta1  = state(9);
psi1    = state(11);

alpha1 = state(13);
beta1 = state(15);

alpha2 = state(17);
beta2 = state(19);

phi2    = state(21);
theta2  = state(23);
psi2    = state(25);

xP  = xQ1 - Lr*cos(beta1).*cos(alpha1);
yP  = yQ1 - Lr*cos(beta1).*sin(alpha1);
zP  = zQ1 - Lr*sin(beta1);

xQ2 = xP + Lr*cos(beta2).*cos(alpha2);
yQ2 = yP + Lr*cos(beta2).*sin(alpha2);
zQ2 = zP + Lr*sin(beta2);
%% Preprocess data:
R1 = euler2rotMat(phi1, theta1, psi1);
R2 = euler2rotMat(phi2, theta2, psi2);

ux1 = R1(1,1);% each column vector of R is a direction vector
vx1 = R1(2,1);
wx1 = R1(3,1);
uy1 = R1(1,2);
vy1 = R1(2,2);
wy1 = R1(3,2);
uz1 = R1(1,3);
vz1 = R1(2,3);
wz1 = R1(3,3); 

ux2 = R2(1,1);% each column vector of R is a direction vector
vx2 = R2(2,1);
wx2 = R2(3,1);
uy2 = R2(1,2);
vy2 = R2(2,2);
wy2 = R2(3,2);
uz2 = R2(1,3);
vz2 = R2(2,3);
wz2 = R2(3,3); 
%% 初始化figure属性
position = [50 50 866 600];
Xlabel = '$X(m)$';
Ylabel = '$Y(m)$';
Zlabel = '$Z(m)$';

set(fig, 'Position', position);
% set(gca, 'drawmode', 'fast');
lighting phong;
set(gcf, 'Renderer', 'zbuffer');
hold on;
axis equal;
grid on;
az = 120;
el = 20;
view(az, el);
xlabel(Xlabel,'Interpreter','Latex');
ylabel(Ylabel,'Interpreter','Latex');
zlabel(Zlabel,'Interpreter','Latex');
%% 初始化 机体坐标系句柄：
ratio = 0.4;
quivXhandle_Q1 = quiver3(xQ1, yQ1, zQ1, ratio*ux1, ratio*vx1, ratio*wx1,...
    'r','MaxHeadSize', 0.999999, 'AutoScale', 'off');
quivYhandle_Q1 = quiver3(xQ1, yQ1, zQ1, ratio*uy1, ratio*vy1, ratio*wy1...
    ,  'g','MaxHeadSize', 0.999999, 'AutoScale', 'off');
quivZhandle_Q1 = quiver3(xQ1, yQ1, zQ1, ratio*uz1, ratio*vz1, ratio*wz1,...
    'b','MaxHeadSize', 0.999999, 'AutoScale', 'off');

quivXhandle_Q2 = quiver3(xQ2, yQ2, zQ2, ratio*ux2, ratio*vx2, ratio*wx2,...
    'r','MaxHeadSize', 0.999999, 'AutoScale', 'off');
quivYhandle_Q2 = quiver3(xQ2, yQ2, zQ2, ratio*uy2, ratio*vy2, ratio*wy2...
    ,  'g','MaxHeadSize', 0.999999, 'AutoScale', 'off');
quivZhandle_Q2 = quiver3(xQ2, yQ2, zQ2, ratio*uz2, ratio*vz2, ratio*wz2,...
    'b','MaxHeadSize', 0.999999, 'AutoScale', 'off');
%% 初始化 第一架四旋翼句柄：
    len = 0.34; % distance from the center of rotor 1 to rotor 3; 
    x1 = [xQ1,yQ1,zQ1] + 0.5*len*[ux1,vx1,wx1];
    x3 = [xQ1,yQ1,zQ1] - 0.5*len*[ux1,vx1,wx1];
    x2 = [xQ1,yQ1,zQ1] + 0.5*len*[uy1,vy1,wy1];
    x4 = [xQ1,yQ1,zQ1] - 0.5*len*[uy1,vy1,wy1];
    Q1X1 = [x1(1),x3(1)];
    Q1X2 = [x1(2),x3(2)];
    Q1X3 = [x1(3),x3(3)];
    Q1Y1 = [x2(1),x4(1)];
    Q1Y2 = [x2(2),x4(2)];
    Q1Y3 = [x2(3),x4(3)];
    
    eb1 = [ux1,vx1,wx1];
    eb2 = [uy1,vy1,wy1];
    eb3 = [uz1,vz1,wz1];
    temp = 0:(2*pi)/15 :2*pi;
    r0 = 0.04;
    x1r1 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x1;
    x1r2 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x2;
    x1r3 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x3;
    x1r4 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x4;

    lineQ1Xhandle = line('XData',Q1X1,'YData',Q1X2,'ZData',Q1X3,...
        'LineWidth',2,'Color',[1 0 0]);
    lineQ1Yhandle = line('XData',Q1Y1,'YData',Q1Y2,'ZData',Q1Y3,...
        'LineWidth',2,'Color',[1 0 0]);
    Q1circle1handle = line('XData',x1r1(:,1),...
        'YData',x1r1(:,2),...
        'ZData',x1r1(:,3),...
        'LineWidth',2,'Color',[1 0 0]);
    
    Q1circle2handle = line('XData',x1r2(:,1),...
    'YData',x1r2(:,2),...
    'ZData',x1r2(:,3),...
    'LineWidth',2,'Color',[1 0 0]);

    Q1circle3handle = line('XData',x1r3(:,1),...
    'YData',x1r3(:,2),...
    'ZData',x1r3(:,3),...
    'LineWidth',2,'Color',[1 0 0]);

    Q1circle4handle = line('XData',x1r4(:,1),...
    'YData',x1r4(:,2),...
    'ZData',x1r4(:,3),...
    'LineWidth',2,'Color',[1 0 0]);
%% 初始化 第二架四旋翼句柄：
    len = 0.34; % distance from the center of rotor 1 to rotor 3; 
    x1 = [xQ2,yQ2,zQ2] + 0.5*len*[ux2,vx2,wx2];
    x3 = [xQ2,yQ2,zQ2] - 0.5*len*[ux2,vx2,wx2];
    x2 = [xQ2,yQ2,zQ2] + 0.5*len*[uy2,vy2,wy2];
    x4 = [xQ2,yQ2,zQ2] - 0.5*len*[uy2,vy2,wy2];
    Q2X1 = [x1(1),x3(1)];
    Q2X2 = [x1(2),x3(2)];
    Q2X3 = [x1(3),x3(3)];
    Q2Y1 = [x2(1),x4(1)];
    Q2Y2 = [x2(2),x4(2)];
    Q2Y3 = [x2(3),x4(3)];
    
    eb1 = [ux2,vx2,wx2];
    eb2 = [uy2,vy2,wy2];
    eb3 = [uz2,vz2,wz2];
    temp = 0:(2*pi)/15 :2*pi;
    r0 = 0.04;
    x2r1 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x1;
    x2r2 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x2;
    x2r3 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x3;
    x2r4 = r0*cos(temp')*eb1 + r0*sin(temp')*eb2 + ones(size(temp'))*x4;

    lineQ2Xhandle = line('XData',Q2X1,'YData',Q2X2,'ZData',Q2X3,...
        'LineWidth',2,'Color','m');
    lineQ2Yhandle = line('XData',Q2Y1,'YData',Q2Y2,'ZData',Q2Y3,...
        'LineWidth',2,'Color','m');
    Q2circle1handle = line('XData',x2r1(:,1),...
        'YData',x2r1(:,2),...
        'ZData',x2r1(:,3),...
        'LineWidth',2,'Color','m');
    
    Q2circle2handle = line('XData',x2r2(:,1),...
    'YData',x2r2(:,2),...
    'ZData',x2r2(:,3),...
    'LineWidth',2,'Color','m');

    Q2circle3handle = line('XData',x2r3(:,1),...
    'YData',x2r3(:,2),...
    'ZData',x2r3(:,3),...
    'LineWidth',2,'Color','m');

    Q2circle4handle = line('XData',x2r4(:,1),...
    'YData',x2r4(:,2),...
    'ZData',x2r4(:,3),...
    'LineWidth',2,'Color','m');
%% 初始化 payload 句柄
[sx,sy,sz] = sphere;
SPx = 0.05*sx + xP;
SPy = 0.05*sy + yP;
SPz = 0.05*sz + zP;
payloadhandle = surf(SPx,SPy,SPz,'FaceColor',[1 0 0],'EdgeColor','none');
%% 初始化 cable1 和 cable2 句柄
cable1handle = line('Xdata',[xQ1,xP],...
        'Ydata',[yQ1,yP],...
        'Zdata',[zQ1,zP],...
        'LineWidth',2,'Color','k');
cable2handle = line('Xdata',[xQ2,xP],...
        'Ydata',[yQ2,yP],...
        'Zdata',[zQ2,zP],...
        'LineWidth',2,'Color','k');
%% 设置初始范围
LimitRatio = 1;
AxisLengthX = 2;AxisLengthY = 1.5;AxisLengthZ = 1;
Xlim = [xP-AxisLengthX xP+AxisLengthX] * LimitRatio;
Ylim = [yP-AxisLengthY yP+AxisLengthY] * LimitRatio;
Zlim = [zP-AxisLengthZ zP+AxisLengthZ] * LimitRatio;
set(gca, 'Xlim', Xlim, 'Ylim', Ylim, 'Zlim', Zlim);
%% 返回句柄结构体
phandles.quivXhandle_Q1 = quivXhandle_Q1;
phandles.quivYhandle_Q1 = quivYhandle_Q1;
phandles.quivZhandle_Q1 = quivZhandle_Q1;
phandles.quivXhandle_Q2 = quivXhandle_Q2;
phandles.quivYhandle_Q2 = quivYhandle_Q2;
phandles.quivZhandle_Q2 = quivZhandle_Q2;

phandles.lineQ1Xhandle = lineQ1Xhandle;
phandles.lineQ1Yhandle = lineQ1Yhandle;
phandles.lineQ2Xhandle = lineQ2Xhandle;
phandles.lineQ2Yhandle = lineQ2Yhandle;

phandles.Q1circle1handle = Q1circle1handle;
phandles.Q1circle2handle = Q1circle2handle;
phandles.Q1circle3handle = Q1circle3handle;
phandles.Q1circle4handle = Q1circle4handle;

phandles.Q2circle1handle = Q2circle1handle;
phandles.Q2circle2handle = Q2circle2handle;
phandles.Q2circle3handle = Q2circle3handle;
phandles.Q2circle4handle = Q2circle4handle;

phandles.payloadhandle = payloadhandle;
phandles.cable1handle = cable1handle;
phandles.cable2handle = cable2handle;
phandles.Xlim = Xlim;
phandles.Ylim = Ylim;
phandles.Zlim = Zlim;
end

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