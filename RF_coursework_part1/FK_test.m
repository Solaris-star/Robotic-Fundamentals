clear
a2r = sym(pi)/180;

Alpha = [0 , sym(pi)/2 , 0 , 0 , -sym(pi)/2 ];
A     = [0, 0 , 0.1 , 0.1 , 0];
Theta = [0 , 0 , 0 , 0 , 0];
D     = [0.1 , 0 , 0 , 0 , 0.1];

Q1 = [50*a2r,60*a2r,70*a2r ,80*a2r];
Q2 = [-25*a2r,-30*a2r,-35*a2r,-40*a2r];
Q3 = [45*a2r,50*a2r,55*a2r,60*a2r];
Q4 = [-60*a2r,-55*a2r,-50*a2r,-45*a2r];

for i = 1:4
Theta(1,1) = Q1(1,i);
Theta(1,2) = Q2(1,i);
Theta(1,3) = Q3(1,i);
Theta(1,4) = Q4(1,i);

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

X=[T01(1,4),T02(1,4),T03(1,4),T04(1,4),T05(1,4)];
Y=[T01(2,4),T02(2,4),T03(2,4),T04(2,4),T05(2,4)];
Z=[T01(3,4),T02(3,4),T03(3,4),T04(3,4),T05(3,4)];

Color = ['r','g','b','y'];

plot3(X,Y,Z,Color(1,i));
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
grid on;
hold on;
end

