clear all;clc;close all;

load ('data/Orientation.dat');
load ('data/AngularVelocity.dat');
load ('data/LinearVelocity.dat');
load ('data/CentreOfRotation.dat');

CentreOfRotation=CentreOfRotation(1:10:end,:);
CentreOfRotation=CentreOfRotation-CentreOfRotation(1,:);
Orientation=Orientation(1:10:end,:);

LinearVelocity=LinearVelocity(1:10:end,:);
AngularVelocity=AngularVelocity(1:10:end,:);

OrientationMatrix=zeros(3,3,size(Orientation,1));
Euler=zeros(3,size(Orientation,1));
for n=1:size(Orientation,1)
    for i=1:3
        for j=1:3
            
            OrientationMatrix(i,j,n)=Orientation(n,3*i+j-2);
            [r1,r2,r3]=dcm2angle(OrientationMatrix(:,:,n),'ZYX');
             Euler(1,n)=rad2deg(r1);
             Euler(2,n)=rad2deg(r2);
             Euler(3,n)=rad2deg(r3);

        end
    end
end


figure(1)
subplot(231)
plot(CentreOfRotation(:,1),CentreOfRotation(:,2),'-or');
xlabel('Time /s');ylabel('Surge /m');
subplot(232)
plot(CentreOfRotation(:,1),CentreOfRotation(:,3),'-or');
xlabel('Time /s');ylabel('Sway /m');
subplot(233)
plot(CentreOfRotation(:,1),CentreOfRotation(:,4),'-or');
xlabel('Time /s');ylabel('Heave /m');
subplot(234)
plot(CentreOfRotation(:,1),Euler(3,:),'-or');
xlabel('Time /s');ylabel('Roll /deg');
subplot(235)
plot(CentreOfRotation(:,1),Euler(2,:),'-or');
xlabel('Time /s');ylabel('Pitch /deg');
subplot(236)
plot(CentreOfRotation(:,1),Euler(1,:),'-or');
xlabel('Time /s');ylabel('Yaw /deg');

figure(2)
subplot(231)
plot(LinearVelocity(:,1),LinearVelocity(:,2),'-xb');
xlabel('Time /s');ylabel('Surge m/s');
subplot(232)
plot(LinearVelocity(:,1),LinearVelocity(:,3),'-xb');
xlabel('Time /s');ylabel('Sway m/s');
subplot(233)
plot(LinearVelocity(:,1),LinearVelocity(:,4),'-xb');
xlabel('Time /s');ylabel('Heave m/s');
subplot(234)
plot(AngularVelocity(:,1),AngularVelocity(:,2),'-xb');
xlabel('Time /s');ylabel('Roll rad/s');
subplot(235)
plot(AngularVelocity(:,1),AngularVelocity(:,3),'-xb');
xlabel('Time /s');ylabel('Pitch rad/s');
subplot(236)
plot(AngularVelocity(:,1),AngularVelocity(:,4),'-xb');
xlabel('Time /s');ylabel('Yaw rad/s');

