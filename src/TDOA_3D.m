%TDOA
% estimation 
%  using A B D

%anchor_coordinate

% only known distance difference
r12=dis(:,2)-dis(:,1);
r13=dis(:,3)-dis(:,1);
r14=dis(:,4)-dis(:,1);


figure
subplot(2,2,1),plot(r12),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,2');
subplot(2,2,2),plot(r13),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,3');
subplot(2,2,3),plot(r14),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,4');




% 3D 
for i=1:4
   K(i)=ac(i,1)^2+ac(i,2)^2;+ac(i,3)^2; 
end

p1=[ac(2,1)-ac(1,1),ac(2,2)-ac(1,2),ac(2,3)-ac(1,3);
    ac(3,1)-ac(1,1),ac(3,2)-ac(1,2),ac(3,3)-ac(1,3);
    ac(4,1)-ac(1,1),ac(4,2)-ac(1,2),ac(4,3)-ac(1,3)];
P1=-inv(p1);
X1=[ac(1,1);ac(1,2);ac(1,3)];

for m=1:N
P2=[r12(m);
    r13(m);
    r14(m)];

P3=0.5*[
    -K(2)+K(1)+(r12(m))^2;
    -K(3)+K(1)+(r13(m))^2;
    -K(4)+K(1)+(r14(m))^2];

a=((P1*P2)'*(P1*P2)-1);
b=((P1*P2)'*(P1*P3-X1)+(P1*P3-X1)'*(P1*P2));
c=(P1*P3-X1)'*(P1*P3-X1);

F=[a b c];
f=roots(F);
R1(m)=f((f>=0)&(f<13));

X(:,m)=P1*P2*R1(m)+P1*P3;
end



figure
plot3(X(1,:),X(2,:),X(3,:));
grid on
xlabel('x'),ylabel('y'),zlabel('z')
title('position in 3D')
% xlim([0,6]);ylim([0,6]);zlim([0,9]);


