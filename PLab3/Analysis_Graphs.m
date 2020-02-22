figure
p = plot(Q2(:,1),Q2(:,2))
p(1).LineWidth = 2;
ylim([0 10])
xlim([0 5.5E-3])
ylabel('Voltage (mV)')
xlabel('Time (s)')
title('Sample Biphasic CAP')

%%
%Refractory
% Saturation
%Pg 183
%Pg 206
%Pg 239
%Pg 120
%Pg 274
%Pg 310

X = [50,100,150,200,250,300]
Y = [380,220,170,140,120,90]


% Threshold
%Pg 182
y =[370,210,160,130,105,80]

figure
plot(X,Y)
hold on
plot(X,y)

%%
% Monophaic CAP
%Pg 376


%%
%ISI

X = [4,3.5,3,2.5,2,1.9,1.8,1.7,1.6,1.5,1.4,1.3,1.2,1.1,1]
Y = [3.0844, 2.6297, 2.0047, 1.1453, 0.3172, 0.2641, .2459,.2297,.2259,.2188,.2006,0,0,0,0]

figure
p = plot(X,Y,'--o')
p(1).LineWidth = 2;
ylabel('Amplitude (mV)')
xlabel('ISI (ms)')
title('ISI Second CAP Amplitude w.r.t. ISI')
%%
x = [80,70,60,50,40]
y = [6.6812,5.8687,4.1953,1.58,.7344]
Y = [1.05,.6297,.2375,.0,.0]

figure
p = plot(x,y,'--o')
p(1).LineWidth = 2;
hold on
p = plot(x,Y,'--o')
p(1).LineWidth = 2;
xlabel('Voltage (mV)')
ylabel('Amplitude (mV)')
title('ISI Action Potential Amplitude')
legend('First CAP','Second CAP')

%%





%%
figure
p = plot(Q6(:,1),Q6(:,2))
p(1).LineWidth = 2;
% ylim([0 10])
xlim([0 3E-3])
ylabel('Voltage (mV)')
xlabel('Time (s)')
title('Sample Monophasic CAP')