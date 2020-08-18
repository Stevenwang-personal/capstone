%TOA
% 3D



A = [2*(ac(1,1) - ac(4,1)),2*(ac(1,2) - ac(4,2)),2*(ac(1,3)-ac(4,3));
     2*(ac(2,1) - ac(4,1)),2*(ac(2,2) - ac(4,2)),2*(ac(2,3)-ac(4,3));
     2*(ac(3,1) - ac(4,1)),2*(ac(3,2) - ac(4,2)),2*(ac(3,3)-ac(4,3));
     2*(ac(1,1) - ac(2,1)),2*(ac(1,2) - ac(2,2)),2*(ac(1,3)-ac(2,3));
     2*(ac(1,1) - ac(3,1)),2*(ac(1,2) - ac(3,2)),2*(ac(1,3)-ac(3,3));
     2*(ac(2,1) - ac(3,1)),2*(ac(2,2) - ac(3,2)),2*(ac(2,3)-ac(3,3));
];

B1 = [ac(1,1)^2 - ac(4,1)^2 + ac(1,2)^2 - ac(4,2)^2+ac(1,3)^2-ac(4,3)^2;
      ac(2,1)^2 - ac(4,1)^2 + ac(2,2)^2 - ac(4,2)^2+ac(2,3)^2-ac(4,3)^2;
      ac(3,1)^2 - ac(4,1)^2 + ac(3,2)^2 - ac(4,2)^2+ac(3,3)^2-ac(4,3)^2;
      ac(1,1)^2 - ac(2,1)^2 + ac(1,2)^2 - ac(2,2)^2+ac(1,3)^2-ac(2,3)^2;
      ac(1,1)^2 - ac(3,1)^2 + ac(1,2)^2 - ac(3,2)^2+ac(1,3)^2-ac(3,3)^2;
      ac(2,1)^2 - ac(3,1)^2 + ac(2,2)^2 - ac(3,2)^2+ac(2,3)^2-ac(3,3)^2;
];
X = zeros(N,3);
for k=1:N
    B2 = [dis(k,4)^2 - dis(k,1)^2,dis(k,4)^2 - dis(k,2)^2,dis(k,4)^2 - dis(k,3)^2,...
        dis(k,2)^2 - dis(k,1)^2,dis(k,3)^2 - dis(k,1)^2,dis(k,3)^2 - dis(k,2)^2,]';
    B = B1 + B2;
    X(k,:) = inv(A'*A)*A'*B;
   
end

% figure;
% plot((1:N),X(:,1),'b');grid on,xlabel('sample num'),ylabel('m'),title('position.x');
% figure;
% plot((1:N),X(:,2),'b');grid on,xlabel('sample num'),ylabel('m'),title('position.y');
% figure;
% plot((1:N),X(:,3),'b');grid on,xlabel('sample num'),ylabel('m'),title('position.z');

figure
plot3(X(:,1),X(:,2),X(:,3));
grid on
xlabel('x'),ylabel('y'),zlabel('z')
title('position in 3D')
%xlim([0,6]);ylim([0,6]);zlim([0,9]);