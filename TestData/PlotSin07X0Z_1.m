clear all;
close all;

load Sin07X0Z_1.mat

fig1=figure;
bdwidth = 5;
topbdwidth = 38;
figwidth = 450;
figheight = 600;
set(0,'Units','pixels');
scnsize = get(0,'ScreenSize');
set(fig1,'Position',[bdwidth, scnsize(4)-figheight-2*topbdwidth, figwidth, figheight]);

subplot(411)
plot(data(:,25),'o-','MarkerSize',2)
hold on
plot(data(:,19),'ro--','MarkerSize',2)
grid on
axis([0 201 -1 1])
legend('Measured Cartesian X','Command Cartesian X')
xlabel('Step')
ylabel('Disp. X (in)')

subplot(412)
plot(data(:,27)+0.14,'o-','MarkerSize',2)
axis([0 201 0 0.2])
grid on
xlabel('Step')
ylabel('Disp. Z (in)')

subplot(413)
plot(data(:,31),'o-','MarkerSize',2)
axis([0 201 -20 20])
grid on
xlabel('Step')
ylabel('Force X (lb)')

subplot(414)
plot(data(:,33)+118.89,'o-','MarkerSize',2)
axis([0 201 0 150])
grid on
xlabel('Step')
ylabel('Force Z (lb)')

fig2=figure;
bdwidth = 5;
topbdwidth = 38;
figwidth = 450;
figheight = 600;
set(0,'Units','pixels');
scnsize = get(0,'ScreenSize');
set(fig2,'Position',[bdwidth, scnsize(4)-figheight-2*topbdwidth, figwidth, figheight]);

subplot(311)
plot(data(:,25),data(:,31),'o-','MarkerSize',2)
grid on
axis([-0.8 0.8 -20 20])
xlabel('Disp. X (in)')
ylabel('Force X (lb)')

subplot(312)
plot(data(:,25),data(:,33)+118.89,'o-','MarkerSize',2)
grid on
axis([-0.8 0.8 50 150])
xlabel('Disp. X (in)')
ylabel('Force Z (lb)')

subplot(313)
plot(data(:,25),data(:,27)+0.14,'o-','MarkerSize',2)
grid on
axis([-0.8 0.8 0 0.2])
xlabel('Disp. X (in)')
ylabel('Disp .Z (in)')

Err_X = max(abs(data(:,19)-data(:,25)))
Err_Y = max(abs(data(:,20)-data(:,26)))
Err_Z = max(abs(data(:,21)-data(:,27)))
Err_Rx = max(abs(data(:,22)-data(:,28)))
Err_Ry = max(abs(data(:,23)-data(:,29)))
Err_Rz = max(abs(data(:,24)-data(:,30)))

