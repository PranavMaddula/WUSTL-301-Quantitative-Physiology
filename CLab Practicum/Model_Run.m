clear all
close all
G_k=12; G_na=40; G_bar_ca=2; G_a = 36; GkCa_Bar = .05;     % channel conductances: mS/cm2
E_k=-75; E_na=35;                 % channel reversal potentials: mV 
N_init=0.00; M_init=0.0; H_init=1;   % initial rates: (unitless)
V_init=-62;                     % resting membrane potential: mV

C = 1

n_pow = 4;
m_pow = 3;
c_pow = 3;
a_pow = 3;

Cdiss = 10E-6
Zca = 2
I_stim = 0

% T_stim_start = 400
% T_stim_stop = 401

%%

sim('Testing');
figure(1)
p=plot(ans.Time,ans.CAi)
p(1).LineWidth = 2;

%legend('Critical Stimulation Current (2.53\muA)','Under Threshold Stimulation (1\muA)','Over Threshold Stimulation (5\muA)')
xlabel('Time (ms)')
ylabel('Internal Calcium Concentration (M)')
title('Exercise 2: Ganglion Internal Calcium Concentration')

figure(2)
p=plot(ans.Time,ans.ECa)
p(1).LineWidth = 2;
%legend('Critical Stimulation Current (2.53\muA)','Under Threshold Stimulation (1\muA)','Over Threshold Stimulation (5\muA)')
xlabel('Time (ms)')
ylabel('Calcium Nernst Potential (mV)')
title('Exercise 3: Ganglion Calcium Nernst Potential')


%%
I_stim = 0
sim('Model');
figure(3)
p=plot(ans.Time,ans.V_m)
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Exercise 4: Ganglion Membrane Potential, I = .03')

figure(4)
p=plot(ans.Time,ans.M,ans.Time,ans.N,ans.Time,ans.H,ans.Time,ans.a,ans.Time,ans.ah)
xlabel('Time (ms)')
ylabel('Gating Level')
title('Exercise 4: Ganglion M,N,H,A,hA Gating Levels, I = .03')
xlim([280 330])

%%
I_stim = .67
sim('Model');
figure(5)
subplot(2,1,1);
p=plot(ans.Time,ans.V_m)
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Exercise 5: Ganglion Spike Train, I = .67')
subplot(2,1,2); 
p=plot(ans.Time,ans.CAi)
xlabel('Time (ms)')
ylabel('Internal Calcium Concentration (M)')
title('Exercise 5: Ganglion Internal Calcium Concentration, I = .67')



I_stim = .8
sim('Model');
figure(6)
subplot(2,1,1);
p=plot(ans.Time,ans.V_m)
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Exercise 5: Ganglion Spike Train, I = .8')
subplot(2,1,2); 
p=plot(ans.Time,ans.CAi)
xlabel('Time (ms)')
ylabel('Internal Calcium Concentration (M)')
title('Exercise 5: Ganglion Internal Calcium Concentration, I = .8')



I_stim = 1
sim('Model');
figure(7)
subplot(2,1,1);
p=plot(ans.Time,ans.V_m)
xlabel('Time (ms)')
ylabel('Membrane Voltage (mV)')
title('Exercise 5: Ganglion Spike Train, I = 1')
subplot(2,1,2); 
p=plot(ans.Time,ans.CAi)
xlabel('Time (ms)')
ylabel('Internal Calcium Concentration (M)')
title('Exercise 5: Ganglion Internal Calcium Concentration, I = 1')

