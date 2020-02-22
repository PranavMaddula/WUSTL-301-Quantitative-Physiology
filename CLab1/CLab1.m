R = 10000;
C = 1E-6;
F = [2*pi*1, 2*pi*10, 2*pi*100];

sim('CLab1_RC')
figure(1)
p = plot(ans.Time,ans.Vout)
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
legend('f = 1Hz', 'f = 10Hz', 'f = 100Hz')
xlabel('Time (Sec)')
ylabel('Vout (Volts)')
title('Vout vs Time for RC filter, Vin = 1V sine, R= 10kOhm, C=1uF')
ylim ([-1.15 1.15])

%%

R = 10000;
C = 1E-6;
F = [2*pi*1, 2*pi*10, 2*pi*100];

sim('CLab1_CR')
% figure(2)
p = plot(ans.Time,ans.Vout)
p(2).LineWidth = 2;
p(1).LineWidth = 2;
legend('f = 1Hz', 'f = 10Hz', 'f = 100Hz')
xlabel('Time (Sec)')
ylabel('Vout (Volts)')
title('Vout vs Time for CR filter, Vin = 1V sine, R= 10kOhm, C=1uF')
ylim ([-1.15 1.15])

%%

%k1 = [0, .01, .1]
k1 = [.01,.01,.01,0]
k2 = 10*k1
r = 0
D = 1
g = [.1, 1, 10,1]

sim('CLab1_feedback')
p = plot(ans.Time,ans.Y)
ylim ([-.8 1.2])
p(4).LineStyle = '--';
legend('g = .1 , k1=.01', 'g = 1  , k1=.01', 'g = 10 , k1=.01', 'k1 = 0 (Open Loop)')
xlabel('Time (Sec)')
ylabel('Output Level')
title('Output Level vs Time for Integral Feedback Controller, r = 0, D = 1')
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
p(4).LineWidth = 1.5;


%%

%k1 = [0, .01, .1]
k1 = [.01,.01,.01,0,0,0]
k2 = 10*k1
r = 1
D = 0
g = [.1, 1, 10,.1,1,10]

sim('CLab1_feedback')
p = plot(ans.Time,ans.Y)
ylim ([-10 40])
p(4).LineStyle = '--';
p(5).LineStyle = '--';
p(6).LineStyle = '--';
legend('g = .1 , k1=.01', 'g = 1 , k1=.01', 'g = 10 , k1=.01', 'g = .1 , k1 = 0 (Open Loop)','g = 1 , k1 = 0 (Open Loop)','g = 10 , k1 = 0 (Open Loop)')
xlabel('Time (Sec)')
ylabel('Output Level')
title('Output Level vs Time for Integral Feedback Controller, r = 1, D = 0')
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
p(4).LineWidth = 1.5;
p(5).LineWidth = 1.5;
p(6).LineWidth = 1.5;

%%

%k1 = [0, .01, .1]
k1 = .01
k2 = [.1*k1, 1*k1, 10*k1, 100*k1]
r = 0
D = 1
g = 1

sim('CLab1_feedback')
p = plot(ans.Time,ans.Y)
ylim ([-1.2 1.2])
legend('k2 = .1*k1', 'k2 = 1*k1', 'k2 = 10*k1', 'k2 = 100*k1')
xlabel('Time (Sec)')
ylabel('Output Level')
title('Output Level vs Time for Integral Feedback Controller, r = 0, D = 1, g = 1')
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
p(4).LineWidth = 1.5;
