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
sim('Hodgkin_Huxley');
figure(1)
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
ylabel('Relative Membrane Voltage (mV)')
title('Hodgkin Huxley Model, Varying Stimulation Currents')


figure(5)
subplot(2,1,1);
I_stim = 5
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.M,ans.Time,ans.N,ans.Time,ans.H)
xlim([0 25])
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
legend('M','N','H')
xlabel('Time (ms)')
ylabel('Relative gate activity (mV)')
title('Hodgkin Huxley Model, Gate Activity Over Threshold')

subplot(2,1,2); 
I_stim = 1
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.M,ans.Time,ans.N,ans.Time,ans.H)
xlim([0 25])
ylim([0 .7])
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
legend('M','N','H')
xlabel('Time (ms)')
ylabel('Relative gate activity (mV)')
title('Hodgkin Huxley Model, Gate Activity Under Threshold')




%%

t_m_gain = 1
t_n_gain = 1

T_stim_start = 1
T_stim_stop = 5

I_stim = 2.53
t_m_gain = 1
sim('Hodgkin_Huxley');
figure(6)
subplot(2,1,1);
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 3.39
t_m_gain = 2
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 4.55
t_m_gain = 3
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 20])
ylim([-20 120])
p(1).LineWidth = 2;
legend('Tau_m = 1, I = 2.53\muA','Tau_m = 2, I = 3.39\muA','Tau_m = 3, I = 4.55\muA')
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Hodgkin Huxley Model Threshold Stimulation Currents, Varying Tau_m')


t_m_gain = 1
t_n_gain = 1

I_stim = 2.53
t_n_gain = 1
sim('Hodgkin_Huxley');
subplot(2,1,2);
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 1.89
t_n_gain = 2
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 25])
p(1).LineWidth = 2;
hold on

I_stim = 1.67
t_n_gain = 3
sim('Hodgkin_Huxley');
p=plot(ans.Time,ans.V_m)
xlim([0 20])
ylim([-20 120])
p(1).LineWidth = 2;

legend('Tau_n = 1, I = 2.53\muA','Tau_n = 2, I = 2.89\muA','Tau_n = 3, I = 1.67\muA')
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Hodgkin Huxley Model Threshold Stimulation Currents, Varying Tau_n')

%%
I_stim = 1500
T_stim_start = 10
T_stim_stop = 15
n_pow = 4
m_pow = 5
I_stim = 10
sim('Hodgkin_Huxley');
figure(4)
p=plot(ans.Time,ans.V_m)
p(1).LineWidth = 2;
% xlim([0 25])



