%     Cardiac model ToR-ORd
%     Copyright (C) 2019 Jakub Tomek. Contact: jakub.tomek.mff@gmail.com
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.


%% A script showing a common-case use of the model's functions when multiple
% simulations are to be run. In this case, we plot simulation outputs for 5
% different multipliers of IKr (corresponding to 80, 90, 100, 110, and 120
% percent availability).

% Setting parameters
clear 
% param is the default model parametrization here
param.bcl = 2000;
param.model = @model_Torord;
param.IKr_Multiplier = 1; 

% A list of multipliers
ikrMultipliers = 0.1:0.2:1.1;

% Here, we make an array of parameter structures
params(1:length(ikrMultipliers)) = param; % These are initially all the default parametrisation

% And then each is assigned a different IKr_Multiplier
for iParam = 1:length(ikrMultipliers)
    params(iParam).IKr_Multiplier = ikrMultipliers(iParam); % because of this line, the default parametrisation needs to have IKr_Multiplier defined (otherwise Matlab complains about different structure type).
end
 
params.IKs_Multiplier = .5;

options = [];
beats = 100;
ignoreFirst = beats - 1;

%% Simulation and output extraction

% Now, the structure of parameters is used to run multiple models in a
% parallel-for loop.
parfor i = 1:length(params) 
    X0 = getStartingState('Torord_endo');
    [time{i}, X{i}] = modelRunner(X0, options, params(i), beats, ignoreFirst);
    currents{i} = getCurrentsStructure(time{i}, X{i}, params(i), 0);
end


%% Plotting APs
figure(1); clf
for i = 1:length(params)
    hold on
    plot(currents{i}.time, currents{i}.V);
    hold off
end

title('Exploration of I_{Kr} multiplier');
legend('0.8', '0.9', '1', '1.1', '1.2');
xlabel('Time (ms)');
ylabel('Membrane potential (mV)');
xlim([0 500]);