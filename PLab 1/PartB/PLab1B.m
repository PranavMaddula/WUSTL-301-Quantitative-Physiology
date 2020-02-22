%% R6
close all
x1 = [5.3,45,100.3, 500.9, 1000, 5020, 10050, 50700, 1.01E6, 2.05E6]
y1 = [9.28,9.28,9.28,9.28,9.52,9.52,9.44,9.52,9.36,9.36]
y1 = (y1)/mean(y1)
Y1 = 20*log10(y1)

x2 = [5.4,36,107,627,5910,61290,638800,1.01E6,1.99E6]
y2 = [.960,6.76,10.2,10.5,10.6,10.3,10.2,10.2,10.3]
y2 = (y2)/mean(y2(3:end))
Y2 = 20*log10(y2)

figure(1)
semilogx(x1,Y1,'-o','LineWidth',2)
hold on
semilogx(x2,Y2,'-o','LineWidth',2)
legend('DC Coupling','AC Coupling')
xlabel('Frequency (Hz)')
ylabel('Amplitude (DB)')
title('DC vs AC Coupling for Frequency Response')



% %%
% semilogx([10 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 ], [2 2.3 13.3 26.3 -6.46 -11.7 -15.6 -18.8 -20.9 -23.4 -25.2 -37.9 -44.8 -50 -53.9 -57 -59.6 -62 -64 -65 ]);
% hold on
% num=[0 1];
% den=[0.000000495 0.000033 1];
% system1=tf(num,den);
% bode(system1)

%% R7

x = [1,10,100]
x2 = [9.17,9.1588,8.12] %Real world CR input
x1 = [9.2184,9.14,8.1212] %real world rc input
y1 = [9.0384,7.4109,1.2594] %real world RC output
y2 = [.6325,4.7466,7.9913] %real world CR output
x3 = [2,2,2]% Simulated RC input
x4 = [2,2,2]% Simulated CR input
y3 = [1.9961,1.7089,0.4114]
y4 = [.1253,1.0653,2.0503]

Y1 = 20*log10(y1./x1)
Y2 = 20*log10(y2./x2)
Y3 = 20*log10(y3./x3)
Y4 = 20*log10(y4./x4)

figure(2)
subplot(2,1,1);
semilogx(x,Y1,'-o','LineWidth',2)
hold on
semilogx(x,Y3,'-o','LineWidth',2)
legend('Real World Low-Pass','Simulated Low-Pass')
xlabel('Frequency (Hz)','fontsize',10)
ylabel('Magnitude (DB)','fontsize',10)
title('Output Magnitude of RC Low-Pass filter vs. Input Frequency')



subplot(2,1,2); 
semilogx(x,Y2,'-o','LineWidth',2)
hold on
semilogx(x,Y4,'-o','LineWidth',2)
legend('Real World High-Pass','Simulated High-Pass')
xlabel('Frequency (Hz)','fontsize',10)
ylabel('Magnitude (DB)','fontsize',10)
title('Output Magnitude of CR High-Pass filter vs. Input Frequency')

%suptitle('Real World vs. Simulated Filter Performance')

%% R8
x = [1,2,5,10,20,50,100]
y = [.0397,.5116,5.9472,8.9231,9.4816,9.6606,9.6938]
noFilter = 9.7097

Y = 20*log10(y./noFilter)

figure(3)
plot(x,Y,'-o','LineWidth',2)
ylim([-50,5])
xlabel('Cutoff Frequency (Hz)')
ylabel('Amplitude (DB)')
title('Amplitude vs. Low Pass Cutoff Frequency')


%% R9
Mean = -0.2321 %V
Max = 4.7428 %V
AverageCycFreq = 5.4168 %Hz


%% R10
x = [40,400,4000, 40000]
y = [5.3913,5.3824,5.3805,5.3757]

averageFreq = mean(y) % outl

%% R11
%load import_With_DC.mat

x1 = x4s(:,1)
x2 = x40s(:,1)
x3 = x400s(:,1)
x4 = x4ks(:,1)
x5 = x40ks(:,1)

y1 = x4s(:,2)
y2 = x40s(:,2)
y3 = x400s(:,2)
y4 = x4ks(:,2)
y5 = x40ks(:,2)

figure(4)
plot(x1,y1,'LineWidth',1.5)
hold on;
plot(x2,y2,'LineWidth',1.5)
hold on;
plot(x3,y3,'LineWidth',1.5)
hold on;
plot(x4,y4,'LineWidth',1.5)
hold on;
plot(x5,y5,'LineWidth',1.5)
xlim([0,15])
legend('4s/sec','40s/sec','400s/sec','4ks/sec','40ks/sec')
xlabel('Frequency (Hz)')
ylabel('Amplitude (V)')
title('FFT of Constant Input Signal Sampled at Various Rates')