X0 = getStartingState('Torord_endo'); % starting state - can be also m12_mid or m12_epi for midmyocardial or epicardial cells respectively.
%%
param.bcl = 1000; % basic cycle length in ms
beats = 40; % number of beats
param.model = @model_Torord; % which model is to be used - right now, use model12. In general, any model with the same format of inputs/outputs as model12 may be simulated, which is useful when current formulations are changed within the model code, etc.
param.verbose = true; % printing numbers of beats simulated.

options = []; % parameters for ode15s - usually empty
ignoreFirst = beats - 1

[time, X] = modelRunner(X0, options, param, beats, ignoreFirst);
lastX_cell=X(end); lastX = cell2mat(lastX_cell)
X02 = lastX(end,:)

%%
param2 = param
param2.bcl = 325; % basic cycle length in ms
beats2 = 1; % number of beats
param2.model = @model_Torord; % which model is to be used - right now, use model12. In general, any model with the same format of inputs/outputs as model12 may be simulated, which is useful when current formulations are changed within the model code, etc.
param2.verbose = true; % printing numbers of beats simulated.
ignoreFirst = beats - 1
ignoreFirst = 0

[time2, X2] = modelRunner(X02, options, param2, beats2, ignoreFirst);
lastX2_cell=X2(end); lastX2 = cell2mat(lastX2_cell)
X03 = lastX2(end,:)
currents2 = getCurrentsStructure(time2, X2, param2, 0);


%%
param3 = param
param3.bcl = 500; % basic cycle length in ms
beats3 = 1; % number of beats
param3.model = @model_Torord; % which model is to be used - right now, use model12. In general, any model with the same format of inputs/outputs as model12 may be simulated, which is useful when current formulations are changed within the model code, etc.
param3.verbose = true; % printing numbers of beats simulated.
ignoreFirst = beats - 1
ignoreFirst = 0

[time3, X3] = modelRunner(X03, options, param3, beats3, ignoreFirst);
currents3 = getCurrentsStructure(time3, X3, param3, 0);

%%
s1s2_time = [currents2.time;currents3.time+currents2.time(end)];
s1s2_Vm = [currents2.V;currents3.V];
figure; plot(s1s2_time,s1s2_Vm)
xlabel('Time (ms)');
ylabel('Voltage (mV)');
title('AP Train for modified \tau_h')
xlim([0 10150]);

%% Calculations

%%V Rest
V_rest_1 = mean(currents2.V(end-5:end))
%V Max
V_max_1 = max(currents2.V)
%dvdt Max
[dvdt_max_1,I_1] = max(diff(currents2.V))
%V90
V90_1 = V_max_1 - (0.9*(V_max_1 - V_rest_1))
%tV90
offset = 30
[c_1 index_1] = min(abs(currents2.V(offset:end)-V90_1))
index_1 = index_1+offset;

%APD90
APD90_1 = currents2.time(index_1) - currents2.time(I_1)

%%
%V Rest
V_rest_2 = mean(currents3.V(end-5:end))
%V Max
V_max_2 = max(currents3.V)
%dvdt Max
[dvdt_max_2,I_2] = max(diff(currents3.V))
%V90
V90_2 = V_max_2 - (0.9*(V_max_2 - V_rest_2))
%tV90
offset = 30
[c_2 index_2] = min(abs(currents3.V(offset:end)-V90_2))
index_2= index_2+offset;

%APD90
APD90_2 = currents3.time(index_2) - currents3.time(I_2)
%%

T2 = s1s2_time(I_2 + length(currents2.time))
T1 = s1s2_time(index_1) 

DI = T2-T1
%% Generate Restutition Curve
s2CL = [300:10:500]

for i = 1:length(s2CL)
    [DInt(i), ADP90(i)] = Question_2_function(s2CL(i))
end

figure;
plot(DInt,ADP90,'-o')
xlabel('Diastolic Interval (ms)');
ylabel('APD90 (ms)');
title('Restitution Curve')
hold on
plot(DInt_2,ADP90_2,'-o')
legend('Restitution Curve','Restitution Curve, Short S1')

% 
% %Changed 308 to .1 for tauh

%% Plot Train


train_time = s1s2_time;
train_Vm = s1s2_Vm;
    T1 = train_time;
    T2 = T1;
    V1 = train_Vm;
    V2 = V1;
for i = 1:1:8
    T2 = [T2;T1+T2(end)];
    V2 = [V2;V1];
     
end
train_time = T2;
train_Vm = V2;
    
figure; plot(train_time,train_Vm)



