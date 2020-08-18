%TDOA 
%2D
%TDOA
% estimation 
%  using A B D
% only known distance difference
r12=dis(:,2)-dis(:,1); % AB
r13=dis(:,3)-dis(:,1);  %AC
r14=dis(:,4)-dis(:,1);  %AD

% figure
% subplot(2,2,1),plot(r12),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,2');
% subplot(2,2,2),plot(r13),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,3');
% subplot(2,2,3),plot(r14),grid on,xlabel('sample num'),ylabel('m'),title('distance difference r1,4');

% 2D
for i=1:4
   K(i)=ac(i,1)^2+ac(i,2)^2; 
end

p1=[ac(2,1)-ac(1,1),ac(2,2)-ac(1,2);
    ac(4,1)-ac(1,1),ac(4,2)-ac(1,2)];
P1=-inv(p1);
X1=[ac(1,1);ac(1,2)];

for m=1:N
P2=[r12(m);
    r14(m)];

P3=0.5*[-K(2)+K(1)+(r12(m))^2;
    -K(4)+K(1)+(r14(m))^2;];

a=((P1*P2)'*(P1*P2)-1);
b=((P1*P2)'*(P1*P3-X1)+(P1*P3-X1)'*(P1*P2));
c=(P1*P3-X1)'*(P1*P3-X1);

F=[a b c];
f=roots(F);
R1(m)=f((f>=0)&(f<10));

% syms x positive;
% R1(m)=double(solve(a*x^2+b*x+c,x));

X(:,m)=P1*P2*R1(m)+P1*P3;
end
% figure
% plot(R1);title('distance1')

% figure;
% plot((1:N),X(1,:),'b');grid on,xlabel('sample num'),ylabel('m'),title('position.x');
% figure;
% plot((1:N),X(2,:),'b');grid on,xlabel('sample num'),ylabel('m'),title('position.y');

figure
plot(X(1,:),X(2,:));
grid on
xlabel('x'),ylabel('y')
title('position in 2D')