%clear the workshop
clear all;
clc;

%given parameters of Parallel robot
Sa=170;  
L=130; 
Rplat=130; %the distance from the centre to the corner of the platfrom.
Rbase=290; %the distance from the centre to the corner of the base.
PB1=pi/2;
PB2=pi+pi/6;
PB3=2*pi-pi/6;
PP1=pi/2;
PP2=pi+pi/6;
PP3=2*pi-pi/6;

%Input the orientation a of the robot and the centre point of the platform
a = input ('the orientation of the platform: ');
Xc = input('x-coordinate of the centre point on the platform: ');
Yc = input('y-coordinate of the centre point on the platform: ');


% the values of coordinates of the vertices of the working plane
Plat=zeros(2,3);
for i=1:3
    Plat(1,i)=-Rplat*cos((30+a+120*(i-1))*(pi()/180))+Xc;
    Plat(2,i)=-Rplat*sin((30+a+120*(i-1))*(pi()/180))+Yc;
end

%Calculating the values of the vectors for the corners of the base to the centre of the base.
Base=zeros(2,3);
for i=1:3
    Base(1,i)=-Rbase*cos((210+120*(i-1))*(pi()/180));
    Base(2,i)=-Rbase*sin((210+120*(i-1))*(pi()/180));
end

%Calculating the values of the vectors for the corners of the base to the platform
PB2PP=zeros(2,3);
for i=1:3
    PB2PP(1,i)=Base(1,i)+Plat(1,i);
    PB2PP(2,i)=Base(2,i)+Plat(2,i);
end

%The simplification of operations is facilitated, as mentioned in the article
e1=zeros(1,3);
e2=zeros(1,3);
e3=zeros(1,3);
t=zeros(1,3);
Theta=zeros(1,3);

%Caluate the value of Theta
for i=1:3
    e1(i)=-2*PB2PP(2,i)*Sa;
    e2(i)=-2*PB2PP(1,i)*Sa;
    e3(i)=(PB2PP(1,i))^2+(PB2PP(2,i))^2+Sa^2-L^2;
    t(i)=(-e1(i)+sqrt((e1(i))^2+(e2(i))^2-(e3(i))^2))/(e3(i)-e2(i));
    Theta(i)=2*atan(t(i));
end

%Finding all of the joint positions.
J=zeros(2,3);
for i=1:3
    J(1,i)=-Base(1,i)+Sa*cos(Theta(i));
    J(2,i)=-Base(2,i)+Sa*sin(Theta(i));
end

%Assigning the platform.
plat=[Plat(1,:) Plat(1,1);Plat(2,:) Plat(2,1)];
base=[-Base(1,:) -Base(1,1);-Base(2,:) -Base(2,1)];
links1=[-Base(1,1) J(1,1) Plat(1,1);-Base(2,1) J(2,1) Plat(2,1)];
links2=[-Base(1,2) J(1,2) Plat(1,2);-Base(2,2) J(2,2) Plat(2,2)];
links3=[-Base(1,3) J(1,3) Plat(1,3);-Base(2,3) J(2,3) Plat(2,3)];

% Red=Platform
% Blue=Base
% Black=Links
plot(Xc,Yc,'red*');
hold on;
plot(0,0,'blue*');
line(plat(1,:),plat(2,:), 'Color', 'red');
line(base(1,:),base(2,:), 'Color', 'blue');
axis([-300 300 -150 400]);
plot(links1(1,:),links1(2,:),'k-o','MarkerSize',3,'linewidth',0.5);
plot(links2(1,:),links2(2,:),'k-o','MarkerSize',3,'linewidth',0.5);
plot(links3(1,:),links3(2,:),'k-o','MarkerSize',3,'linewidth',0.5);
axis equal
grid on
grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);