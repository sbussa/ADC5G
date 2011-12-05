clc;
clear all;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab File to plot the time samples obtained from ADC5G %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input Frequency to ADC5G = 10 MHz @ -8 dBm
% Clock Frequency to ADC5G = 1500 MHz @ 0 dBm


% Open the file in which you have written the bram data
fid=fopen('adc5g_snap_10mhz_fin_3gsps_fs.bin','r');
fdata=fread(fid);

fdata_signed=zeros(length(fdata),1);

% Converting in to signed numbers
for cnt=1:length(fdata)
        fdata_signed(cnt)=fdata(cnt)-128;
end

% Plotting time series
k=1:600;
figure();
plot(k,fdata_signed(k));
title('Plot of time series');
xlabel('Samples');
ylabel('Amplitude');
grid;


% Plotting data from individual cores
% ADC5g has 4 cores

figure();
% Data from 1st-Core
subplot(4,1,1);
plot(fdata_signed(1:4:2000))
grid on;


% Data from 2nd-Core
subplot(4,1,2);
plot(fdata_signed(2:4:2000))
grid on;


% Data from 3rd-Core
subplot(4,1,3);
plot(fdata_signed(3:4:2000))
grid on;

% Data from 4th-Core
subplot(4,1,4);
plot(fdata_signed(4:4:2000))
grid on;
