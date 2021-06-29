clear
double y ;
double z;
double v;

a2r = sym(pi)/180;

Alpha = [0 , sym(pi)/2 , 0 , 0 , -sym(pi)/2 ];
A     = [0, 0 , 0.1 , 0.1 , 0];
Theta = [0 , 0 , 0 , 0 , 0];
D     = [0.1 , 0 , 0 , 0 , 0.1];

for i = 1:101
    if i<=51
    y =0.2- 0.002*(i-1);
    z = 20* y ^2 - 6*y +0.5;
    end
    if (i>51)&&(i<=101)
    y =0.1- 0.002*(i-51);
    z = 20* y ^2 - 2*y +0.1;
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
   