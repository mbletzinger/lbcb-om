clear all;
close all;

load CrazyTest.mat

plot(data(:,33))
hold on
plot(data(:,34),'r')
plot(data(:,35),'k')
plot(data(:,36),'m')

figure
plot(data(:,30))