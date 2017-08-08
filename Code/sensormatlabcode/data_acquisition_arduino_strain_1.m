% Author :Firdous Saleheen
% date 11/14/2011
% read serial data from strain gage and plot against datapoints
clear all;
close all;
clc;
s1 = arduino('COM4');                            %define arduino object
%s1.BaudRate=9600;                               %define baud rate
%%     
%initialize data acquisition parameters
clear data_strain;
numberofData = 100;
data_strain = zeros(1,numberofData);
v_strain = zeros(1,numberofData);
strain = zeros(1,numberofData);
i = 1;

for i= 1:numberofData                   %acquisition of 100 points
   % read analog data from sensor
    data_strain(i) = s1.analogRead(2);
    v_strain(i) = data_strain(i)*(10000/1024);
 figure(1);
subplot(2,1,1); 
title('Voltage and Strain data plot');
 stem(i,v_strain(i));    
xlabel('Number of datapoints');
    ylabel('Voltage (mV)');
    drawnow;
    grid on;
hold on;
% strain voltage relation
    subplot(2,1,2)
    strain(i) = 4*v_strain/(2*100*(1200-2*v_strain));
    stem(i,strain(i),'r');
    xlabel('Number of datapoints');
    ylabel('Strain (strain)');
    drawnow;
    grid on;
    hold on;
end

% figure(1);
% subplot(2,1,1); 
% title('Voltage and Force data plot');
%  plot(v);    
% xlabel('Number of datapoints');
%     ylabel('Voltage (mV)');
%     drawnow;
%     grid on;
% hold on;
% %force voltage relationship is found using manufacturers curve
% %force in newton and voltage in mV
% %force = exp(log((voltage-c)/a)/b) with a= -2617, b = -0.1054, c = 6835
%     subplot(2,1,2)
%     f = exp(log((v-6835)/(-2617))/(-0.1054));
%     plot(f);
%     xlabel('Number of datapoints');
%     ylabel('Force (N)');
%     drawnow;
%     grid on;

% close session
   
delete(s1)