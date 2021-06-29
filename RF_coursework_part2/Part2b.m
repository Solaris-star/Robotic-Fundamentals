%the basic data of the platform and base.
Rbase=290;
Rplat=130;
Sa=170;
L=130;

% Set orientation of the platform: a
a=input('input an angle a: ');

%Calculating the coordinates of the base's vertices
Base=zeros(2,3);
for i=1:3
    Base(1,i)=-Rbase*cos((210+120*(i-1))*(pi()/180));
    Base(2,i)=-Rbase*sin((210+120*(i-1))*(pi()/180));
end

resolution=10; 

limit=150;

%Just filling up our equations which are used in the Part2a with zeros.
Xc=-limit:resolution:limit;
Yc=-limit:resolution:limit;
Plat=zeros(2,3);
e1=zeros(1,3);
e2=zeros(1,3);
e3=zeros(1,3);
t=zeros(1,3);
theta=zeros(1,3);
PB2PP=zeros(2,3);
n=1;
points=zeros(2,2*limit);

%This for loop calculates the angles for each possible centre position of platform. 
for j=1:length(Xc)
    for k=1:length(Yc)
        for i=1:3 
            Plat(1,i)=-Rplat*cos((30+a+120*(i-1))*(pi()/180))+Xc(j);
            Plat(2,i)=-Rplat*sin((30+a+120*(i-1))*(pi()/180))+Yc(k);
            PB2PP(1,i)=Base(1,i)+Plat(1,i);
            PB2PP(2,i)=Base(2,i)+Plat(2,i);
            e1(i)=-2*PB2PP(2,i)*Sa;
            e2(i)=-2*PB2PP(1,i)*Sa;
            e3(i)=(PB2PP(1,i))^2+(PB2PP(2,i))^2+Sa^2-L^2;
            t(i)=(-e1(i)-sqrt((e1(i))^2+(e2(i))^2-(e3(i))^2))/(e3(i)-e2(i));
            theta(i)=2*atan(t(i));
        end
        if isreal(theta)==1 
            points(1,n)=Xc(j);
            points(2,n)=Yc(k);
            n=n+1;
        end
    end
end

PhiY=zeros(3,3);
DetY=zeros(1,3);
PhiZ=zeros(3,3);
DetZ=zeros(1,3);

% plot 
base=[-Base(1,:) -Base(1,1);-Base(2,:) -Base(2,1)];
if points==0
else
    scatter(points(1,:),points(2,:),'r.');
    hold on;
end
line(base(1,:),base(2,:), 'Color', 'blue');
plot(0,0,'blue*');
axis equal;