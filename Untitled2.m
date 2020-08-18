clear all
clc

x0=[0,0,10,10];
y0=[0,10,10,0];
z0=[0,0,0,0];
r=[8,5,6,1]
rho=0:0.05*pi:2*pi;
phi=-pi:0.05*pi:pi;
for i=1:4
[x,y,z]=sphere;
mesh(r(i)*x+x0(i),r(i)*y+y0(i),r(i)*z+z0(i))
axis equal
hold on
end
for i=1:4

 x=x0(i)+r(i)*(cos(rho));

y=y0(i)+r(i)*(sin(rho));

  z=r(i)*ones(size(rho));

 plot3(x,y,z,'linewidth',1);

shading interp

 hold on

end
for i=1:4

 z=z0(i)+r(i)*(cos(rho));

x=x0(i)+r(i)*(sin(rho));

  y=(-2)*ones(size(rho));

 plot3(x,y,z,'linewidth',1);

shading interp

 hold on

end
for i=1:4

 z=z0(i)+r(i)*(cos(rho));

y=y0(i)+r(i)*(sin(rho));

  x=(-2)*ones(size(rho));

 plot3(x,y,z,'linewidth',1);

shading interp

 hold on

end