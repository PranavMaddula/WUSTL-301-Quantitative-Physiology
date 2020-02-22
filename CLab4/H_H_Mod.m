clear all
close all
G_k=36; G_na=120; G_L=0.3;      % channel conductances: mS/cm2
E_k=-12; E_na=115; E_L=10.613;  % channel reversal potentials: mV 
N_init=0.00; M_init=0.0; H_init=1;   % initial rates: (unitless)
V_init=0;                     % resting membrane potential: mV

N_init=0.3177; M_init=5.296E-2; H_init=.596;

C = 1

I_stim_crit = 2.53

T_stim_start = 1
T_stim_stop = 5

t_m_gain = 1
t_n_gain = 1

n_pow = 4
m_pow = 3
I_stim = 2.53
sim('C:\Users\Pranav Maddula\OneDrive - Washington University in St. Louis\Documents\BME301\CLab3\Hodgkin_Huxley');

figure(1)
subplot(2,1,1);
p=plot(ans.Time,ans.V_m)
p(1).LineWidth = 2;
xlim([0 25])
hold on

I_stim = 1
sim('C:\Users\Pranav Maddula\OneDrive - Washington University in St. Louis\Documents\BME301\CLab3\Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 5
sim('C:\Users\Pranav Maddula\OneDrive - Washington University in St. Louis\Documents\BME301\CLab3\Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
legend('Critical Stimulation Current (2.53\muA)','Under Threshold Stimulation (1\muA)','Over Threshold Stimulation (5\muA)')
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Hodgkin Huxley Model, Varying Stimulation Currents')

T_stim_start = 0
T_stim_stop = 4

subplot(2,1,2);
I_stim = 2.53
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
p(1).LineWidth = 2;
xlim([0 25])
hold on

I_stim = 1
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 5
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
legend('Critical Stimulation Current (2.53\muA)','Under Threshold Stimulation (1\muA)','Over Threshold Stimulation (5\muA)')
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Reduced Hodgkin Huxley Model, Varying Stimulation Currents')


%%

G_k=36; G_na=120; G_L=0.3;      % channel conductances: mS/cm2
E_k=-12; E_na=115; E_L=10.613;  % channel reversal potentials: mV 
N_init=0.00; M_init=0.0; H_init=1;   % initial rates: (unitless)
V_init=0;                     % resting membrane potential: mV

N_init=0.3177; M_init=5.296E-2; H_init=.596;

C = 1

I_stim_crit = 2.53

T_stim_start = 1
T_stim_stop = 5

t_m_gain = 1
t_n_gain = 1

n_pow = 4
m_pow = 3
I_stim = 2.53
sim('Hodgkin_Huxley');


figure(2)
p = plot(ans.V_m,ans.N)
p(1).LineWidth = 2;
ylabel('Slow Variable{\it n}')
xlabel('Fast Variable{\it V} (mV)')
title('Reduced Hodgkin Huxley Phased Plot')
hold on
I_stim = 1
sim('Hodgkin_Huxley');
p = plot(ans.V_m,ans.N)
p(1).LineWidth = 2;
hold on
I_stim = 5
sim('Hodgkin_Huxley');
p = plot(ans.V_m,ans.N)
p(1).LineWidth = 2;
legend('Critical Stimulation Current (2.53\muA)','Under Threshold Stimulation (1\muA)','Over Threshold Stimulation (5\muA)')


%%

sim('FitzHugh_Nagumo');

figure;
p = plot(ans.V,ans.W)
p(1).LineWidth = 2;
xlabel('Fast Variable{\it V} (Volts)')
ylabel('Slow Variable{\it W}')
title('FitzHugh-Nagumo Model Phased Plot')
legend('{\it W}  vs. {\it V}(mV)')

figure;
p = plot(ans.Time,ans.V)
p(1).LineWidth = 2;

%%
c = -65
d = 8
a= .02
b = .2
g = 1

sim('Izhikevich_QIF_Take2');
figure
subplot(3,2,1)
p = plot(ans.Time,ans.V)
p(1).LineWidth = 1.5;
title('Regular Spiking')
xlabel('Time (ms)')
ylabel('Voltage (mV)')

subplot(3,2,2)
p1 = plot(ans.V,ans.U)
p1(1).LineWidth = 1.5;
title('Regular Spiking Phased Plot')
xlabel('Voltage (mV)')
ylabel('Recovery Variable,{\it u}')
ylim([-12 15])

subplot(3,2,3)
c = -65
d = 2
a= .1
b = .2
sim('Izhikevich_QIF_Take2');
p = plot(ans.Time,ans.V)
p(1).LineWidth = 1.2;
title('Fast Spiking')
xlabel('Time (ms)')
ylabel('Voltage (mV)')

subplot(3,2,4)
p1 = plot(ans.V,ans.U)
p1(1).LineWidth = 1.5;
title('Fast Spiking Phased Plot')
xlabel('Voltage (mV)')
ylabel('Recovery Variable,{\it u}')
ylim([-15 5])

subplot(3,2,5)
c = -50
d = 2
a= .02
b = .2
sim('Izhikevich_QIF_Take2');
p = plot(ans.Time,ans.V)
p(1).LineWidth = 1.5;
title('Chattering')
xlabel('Time (ms)')
ylabel('Voltage (mV)')

subplot(3,2,6)
p1 = plot(ans.V,ans.U)
p1(1).LineWidth = 1.5;
title('Chattering Phased Plot')
xlabel('Voltage (mV)')
ylabel('Recovery Variable,{\it u}')
ylim([-12 5])
