%这个函数是求IK的，有双解，一般取第一个解。所有角度都是弧度制，phi表示最终的四轴与X轴夹角。q4初始位置与q3夹角90度（3轴逆时针转90度是4轴初始位置）
%此处的xyz都是第四轴起点（第三轴终点的坐标），abc是第四轴终点坐标，输入单位米，c是z轴坐标，注意有个台子，所以C=C-1，所以与画出来的轨迹坐标不一样，因为轨迹坐标是最终执行器的位置
function  t= IK(a,b,c,phi)  %[t1,t21,t22,t3,t41,t42]
c=c-0.1;
a = a*1000;
b = b*1000;
c = c*1000;
t(1,1)= atan2(b,a);
t(2,1)= atan2(b,a);
x = a-100*cos(phi)*cos(t(1,1));
y = b-100*cos(phi)*sin(t(1,1));
z = c - 100*sin(phi);
if (x ~= 0)&&(abs((x^2+y^2+z^2-100^2-100^2)/(2*100*100))<=1)&&(abs(100^2-x^2-y^2-z^2-100^2)/(2*100*sqrt(x^2+y^2+z^2))<=1)
% deg = 180/pi;
% t(1,1)= atan2(y,x);
% t(2,1)= atan2(y,x);
t(1,3) = -acos((x^2+y^2+z^2-100^2-100^2)/(2*100*100));
t(2,3) = acos((x^2+y^2+z^2-100^2-100^2)/(2*100*100));
psi = acos((100^2-x^2-y^2-z^2-100^2)/(-2*100*sqrt(x^2+y^2+z^2)));
t(1,2) = atan2(z,sqrt(x^2+y^2))+psi;
t(2,2) = atan2(z,sqrt(x^2+y^2))-psi;
t(1,4) = phi - t(1,2) - t(1,3)-pi/2;
t(2,4) = phi - t(2,2) - t(2,3)-pi/2;
% t(1,5) = 0;
% t(2,5) = 0;
else
    disp('wrong');
    
end
