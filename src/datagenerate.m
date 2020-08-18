% position genareation
position=[1 2 2];
N=3000;
for i=2:N
    %x
    position(i,1)=position(i-1,1)+0.01*(rand-1);
    %y
    position(i,2)=position(i-1,2)+0.01*(rand-1);
    %z
    position(i,3)=position(i-1,3)+0.01*(rand-1);
end
figure
plot(position(:,1),position(:,2));
grid on
xlabel('x'),ylabel('y')
title('position in 2D')
xlim([0,6]);ylim([0,6]);

figure
plot3(position(:,1),position(:,2),position(:,3));
grid on
xlabel('x'),ylabel('y'),zlabel('z')
title('position in 3D')
xlim([0,6]);ylim([0,6]);zlim([0,6]);