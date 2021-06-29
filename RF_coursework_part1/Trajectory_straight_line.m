clear
double y ;
double z;
double v;

Q=zeros(2,4,50);

a2r = sym(pi)/180;

Alpha = [0 , sym(pi)/2 , 0 , 0 , -sym(pi)/2 ];
A     = [0, 0 , 0.1 , 0.1 , 0];
Theta = [0 , 0 , 0 , 0 , 0];
D     = [0.1 , 0 , 0 , 0 , 0.1];

% Q = IK(0.2,0.2,0.1,0);
% Q = IK(0.2,0.15,0.05,0);
% Q = IK(0.2,0.1,0.1,0); 
% Q = IK(0.2,0.05,0.05,0);
% Q = IK(0.2,0,0.1,0);

y0 = 0.2;
z0 = 0.1;
v =0 ;
t=0;
k = 1; %for the +/- below

for m = 1:4
    if ((m == 1)||(m == 3))
        k = 1;
    end
    if ((m == 2)||(m == 4))
        k = -1;
    end
    
for i=1:121
    
    t=t+1;
    
    if i<=51          %accelerate
         y = y0-0.05*sqrt(2)*(0.01*(i-1))^2;
         z = z0-k*0.05*sqrt(2)*(0.01*(i-1))^2;
         Q = IK(0.2,y,z,0);
         v = 0.2*0.01*(i-1);
         v1 = v;
         y1=y;
         z1=z;
    end
     if ((i>51)&&(i<=71))     %constant speed
         y = y1-0.1*0.01*(i-51)*0.5*sqrt(2);
         z = z1-k*0.1*0.01*(i-51)*0.5*sqrt(2);
         Q = IK(0.2,y,z,0);
         v = v1;
         y2 =y;
         z2 =z;
     end
      if ((i>71)&&(i<=121))     %decelerate
         y = y2-0.5*sqrt(2)*(0.1*0.01*(i-71)-0.1*(0.01*(i-71))^2);
         z = z2-k*0.5*sqrt(2)*(0.1*0.01*(i-71)-0.1*(0.01*(i-71))^2);
         v = v1-0.2*0.01*(i-71);
         y0 =y;
         z0 =z;
      end

Q = IK(0.2,y,z,0);
        
Theta(1,1) = Q(1,1);
Theta(1,2) = Q(1,2);
Theta(1,3) = Q(1,3);
Theta(1,4) = Q(1,4);

T1 = [  [             cos(Theta(1,1)),            -sin(Theta(1,1)),            0,              A(1,1)]
        [ cos(Alpha(1,1))*sin(Theta(1,1)), cos(Alpha(1,1))*cos(Theta(1,1)), -sin(Alpha(1,1)), -D(1,1)*sin(Alpha(1,1))]
        [ sin(Alpha(1,1))*sin(Theta(1,1)), sin(Alpha(1,1))*cos(Theta(1,1)),  cos(Alpha(1,1)),  D(1,1)*cos(Alpha(1,1))]
        [                   0,                   0,            0,               1]  ];
    
T2 = [  [             cos(Theta(1,2)),            -sin(Theta(1,2)),            0,              A(1,2)]
        [ cos(Alpha(1,2))*sin(Theta(1,2)), cos(Alpha(1,2))*cos(Theta(1,2)), -sin(Alpha(1,2)), -D(1,2)*sin(Alpha(1,2))]
        [ sin(Alpha(1,2))*sin(Theta(1,2)), sin(Alpha(1,2))*cos(Theta(1,2)),  cos(Alpha(1,2)),  D(1,2)*cos(Alpha(1,2))]
        [                   0,                   0,            0,               1]  ];
T3 = [  [             cos(Theta(1,3)),            -sin(Theta(1,3)),            0,              A(1,3)]
        [ cos(Alpha(1,3))*sin(Theta(1,3)), cos(Alpha(1,3))*cos(Theta(1,3)), -sin(Alpha(1,3)), -D(1,3)*sin(Alpha(1,3))]
        [ sin(Alpha(1,3))*sin(Theta(1,3)), sin(Alpha(1,3))*cos(Theta(1,3)),  cos(Alpha(1,3)),  D(1,3)*cos(Alpha(1,3))]
        [                   0,                   0,            0,               1]  ];
T4 = [  [             cos(Theta(1,4)),            -sin(Theta(1,4)),            0,              A(1,4)]
        [ cos(Alpha(1,4))*sin(Theta(1,4)), cos(Alpha(1,4))*cos(Theta(1,4)), -sin(Alpha(1,4)), -D(1,4)*sin(Alpha(1,4))]
        [ sin(Alpha(1,4))*sin(Theta(1,4)), sin(Alpha(1,4))*cos(Theta(1,4)),  cos(Alpha(1,4)),  D(1,4)*cos(Alpha(1,4))]
        [                   0,                   0,            0,               1]  ];
T5 = [  [             cos(Theta(1,5)),            -sin(Theta(1,5)),            0,              A(1,5)]
        [ cos(Alpha(1,5))*sin(Theta(1,5)), cos(Alpha(1,5))*cos(Theta(1,5)), -sin(Alpha(1,5)), -D(1,5)*sin(Alpha(1,5))]
        [ sin(Alpha(1,5))*sin(Theta(1,5)), sin(Alpha(1,5))*cos(Theta(1,5)),  cos(Alpha(1,5)),  D(1,5)*cos(Alpha(1,5))]
        [                   0,                   0,            0,               1]  ];
    
T01=T1;    
T02=T1*T2;
T03=T02*T3;
T04=T03*T4;
T05=T04*T5;

X=[0,T01(1,4),T02(1,4),T03(1,4),T04(1,4),T05(1,4)];
Y=[0,T01(2,4),T02(2,4),T03(2,4),T04(2,4),T05(2,4)];
Z=[0,T01(3,4),T02(3,4),T03(3,4),T04(3,4),T05(3,4)];

Color = ['r','g','b','y'];

scatter3(X(1,6),Y(1,6),Z(1,6),'r','k');
hold on;
h=plot3(X,Y,Z,Color(1,3));
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
grid on;
axis([0 0.3 0 0.3 0 0.3]);
pause(0.01);
delete(h);


end

end


