% data
clear
%close all
Data=load('infExportData_I_UWB_LPS_Tag_Data_Frame0_20180531_000810.txt');

N=size(Data,1);

position = ones(N,3);

%position
position(:,1) = Data(:,1);
position(:,2) = Data(:,2);
position(:,3) = Data(:,3);

%anchor_coordinate
ac = [0,0,1; 
     0,6,3;
     6,6,3;
     6,0,3
     ];
 

%distance to each anchor
dis=zeros(N,4);
for i=1:N
    dis(i,1)=sqrt(mean((ac(1,:)-position(i,:)).^2));
    dis(i,2)=sqrt(mean((ac(2,:)-position(i,:)).^2));
    dis(i,3)=sqrt(mean((ac(3,:)-position(i,:)).^2));
    dis(i,4)=sqrt(mean((ac(4,:)-position(i,:)).^2));

end

figure;
subplot(2,2,1),plot((1:N),dis(:,1),'b');grid on,xlabel('sample num'),ylabel('m'),title('dis1');
subplot(2,2,2),plot((1:N),dis(:,2),'b');grid on,xlabel('sample num'),ylabel('m'),title('dis2');
subplot(2,2,3),plot((1:N),dis(:,3),'b');grid on,xlabel('sample num'),ylabel('m'),title('dis3');
subplot(2,2,4),plot((1:N),dis(:,4),'b');grid on,xlabel('sample num'),ylabel('m'),title('dis4');



figure
plot(position(:,1),position(:,2));
grid on
xlabel('x'),ylabel('y')
title('position in 2D')
xlim([0,6]);ylim([0,6]);

figure
plot3(position(:,1),position(:,2),position(:,3));
grid on
hold on
scatter3(ac(:,1),ac(:,2),ac(:,3))
xlabel('x'),ylabel('y'),zlabel('z')
title('position in 3D')
xlim([0,6]);ylim([0,6]);zlim([0,9]);