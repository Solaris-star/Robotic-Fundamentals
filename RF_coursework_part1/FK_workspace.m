clear;
a2r = sym(pi)/180;

Alpha = [0 , sym(pi)/2 , 0 , 0 , -sym(pi)/2 ];
A     = [0, 0 , 0.1 , 0.1 , 0];
Theta = [0 , 0 , 0 , 0 , 0];
D     = [0.1 , 0 , 0 , 0 , 0.1];

for i = 1:5000
    Theta(1,1) = -pi/2 + pi*rand;
    Theta(1,2) = pi/6 + pi*2/3*rand;
    Theta(1,3) = -pi*3/4+ pi*rand;
    Theta(1,4) = -pi*5/6 + pi*rand;
    Theta(1,5) = 0;
    
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

T05=T1*T2*T3*T4*T5;

X = T05(1,4);
Y = T05(2,4);
Z = T05(3,4);
plot3(X,Y,Z,'b.','MarkerSize',0.5);
hold on;
end
