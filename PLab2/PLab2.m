% Figs: Results 1,2,3,4,5,9,10
% Tables: 6,7,8,10





%%
% 45deg = 0.285
% 23deg = 0.1948
% 11deg = 0.0713
% 5deg = 0.0375

% Results 1

y = [0,5,11,23,45]
x = [0,0.0375,0.0713,0.1948,0.285]
x1 = [0,0.0375,0.0713,0.1948,0.285,.3]
figure(1)
p = plot(x,y,'o')

    P = polyfit(x,y,1);
    yfit = P(1)*x+P(2);
    hold on;
    p1= plot(x1,yfit,'r-.');
    
p(1).LineWidth = 2;
p1(1).LineWidth = 2;
ylim([0 50])
xlim([0 .3])
xlabel('Saccade Amplitude (mV)')
ylabel('Angular Displacement(°)')
legend('Raw Data','Linear Best Fit')
title('Calibration Best-Fit Curve for Saccades')

%% 

% Results 2

load Proc2.mat
X = 2.605
ver(:,1) = PLab2Proc2(:,1)

ver(:,1) = ver(:,1)-X
bla = PLab2Proc2(:,2)
norm_data = (bla - min(bla)) / ( max(bla) - min(bla) )
norm_data = 45*norm_data
figure(2)
p = plot(ver(:,1),norm_data)
p(1).LineWidth = 2;
ylim([0 50])
xlim([0 2.7])
xlabel('Time (ms)')
ylabel('Angular Displacement(°)')

%%
% % Results 3
% Time, Deg
% .043 = 5deg
% 0.056 = 11deg
% 0.11 = 23deg
% 0.178 = 45deg
% %(ms)

v1 = 5/.043
v2 = 11/0.056
v3 = 23/0.11
v4 = 45/.178

x = [5,11,23,45]
y = [v1,v2,v3,v4]

figure(3)
createFit(x, y)
ylabel('Maximal Velocity (°/s)')
xlabel('Angular Displacement(°)')

% General model Power1:
%      f(x) = a*x^b
% Coefficients (with 95% confidence bounds):
%        a =       84.93  (-5.545, 175.4)
%        b =      0.2913  (-0.04247, 0.6251)

%%

%Results 4


% Eyes_Closed = 1.0897 %mV amplitude
% 45Deg = 0.285 %mV amplitude
% 
% 45Deg = 3.9412, 3.9805, 4.0086 %mV/s Slope
% Eyes_Closed = 4.6294, 3.9027, 4.156, 4.295 %mV/s Slope

X = categorical({'45 Degree Saccade','Eyes Closed Saccade'});
X = reordercats(X,{'45 Degree Saccade','Eyes Closed Saccade'});
y= [.285,3.9412; .8897,4.6294]
y = AngularDisp(y)
figure(4)
bar(X,y)
legend('Angular Displacement (°)','Velocity (°/s)')
%ylim([0 6])
ylabel('Magnitude')
title('Standard Saccade Vs. Eyes Closed Saccade')

%%

% Results 5

total_dist = 24 %in
x = [70,80,90,100,110,120]
t = [.306,.240,.195,.178,.155,.15]
a = [.2563,.2712,.2625,.2581,.2419,.2675]

% 70bpm = .306, .2563
% 80bpm = .196, .2712
% 90bpm = .1626, .2625
% 100bpm = .168, .2581
% 110bpm = .15, .2419
% 120bpm = .165, .2675
% time (ms) , amplitude (mV)

ad = AngularDisp(a)./t
figure(5)
p = plot(x,ad,'--o')
p(1).LineWidth = 2;
ylabel('Average Angular Velocity (°/s)')
xlabel('Finger Movement (bpm)')
title('Eye Velocity vs. Finger Frequency')
%%

% Results 6

Right_Reaction_time = [.328, .262, .248, .232]
Two_Reaction_time = [.351, .353, .309, .321]
Four_Reaction_time = [.398, .45]
%(ms)

Right_Reaction_time = mean(Right_Reaction_time)
Two_Reaction_time = mean(Two_Reaction_time)
Four_Reaction_time = mean(Four_Reaction_time)

y = [Right_Reaction_time,Two_Reaction_time,Four_Reaction_time]

X = categorical({'One Option','Two Options','Four Options'});
X = reordercats(X,{'One Option','Two Options','Four Options'});
figure(6)
bar(X,y)
ylabel('Reaction Time (s)')
title('Reaction Times for Looking Right')

%%

%Results 7

Sacade =[.26, .344,.204, .32, .278]
Persuit = [.336, .18, .176, .188, .178, .252, .32, .204, .208, .216, .228]
%(ms)
%% 

%Results 8
Amplitude: .2841
Velocity: .104, .119, .118

%%

% Results 9 
%Using Diana's Data

%Vor: Control
slope = .89284 %mV/s
Duration = 1.3 %(sec)
Average_Cyclic_Height = 1.0588 %mV


%VOR: Mental Math
slope = 1.2628 %mV/s
Duration = 1.12 %(sec)
Average_Cyclic_Height = 1.1913 %mV

%Vor: Far Away
slope = 1.374 %mV/s
Duration = 1.1 %(sec)
Average_Cyclic_Height = 1.3775 %mV

%Vor: Bag & Imaginary Target
slope = 1.7405 %mV/s
Duration = 1.0 %(sec)
Average_Cyclic_Height = 1.3363 %mV

%Vor: Bag & Math
slope = 1.0195 %mV/s
Duration = 0.94 %(sec)DG(7)
Average_Cyclic_Height = .9031 %mV

figure()
bla = Plab2LabChartDIANAGROUPvorsample(:,2)
norm_data = (bla - min(bla)) / ( max(bla) - min(bla) )
scaled_data = mat2gray(norm_data) * 2 - 1;
y = (scaled_data.*56.60) - 4.554
p = plot(Plab2LabChartDIANAGROUPvorsample(:,1),y)
p(1).LineWidth =2
xlabel('Time (s)')
ylabel('Angular Displacement(°)')
title('Sample VOR Data from Control')



%%

% Results 10
%Using Diana's Data

%OKN: Sacades
slope = -1.953396 %mV/s
Duration = .12 %(sec)
Average_Cyclic_Height = .27 %mV

%OKN: Smooth Tracking
slope = .0536 %mV/s
Duration = 3.9 %(sec)
Average_Cyclic_Height = .2837 %mV

figure()
bla = Plab2LabChartDIANAGROUPokrsample(:,2)
norm_data = (bla - min(bla)) / ( max(bla) - min(bla) )
%scaled_data = mat2gray(norm_data) * 2 - 1;
y = (norm_data.*56.60) - 4.554
p = plot(Plab2LabChartDIANAGROUPokrsample(:,1),y)
p(1).LineWidth =2
xlabel('Time (ms)')
ylabel('Angular Displacement(°)')
title('Sample OKN Data')
xlim([2.75,18])
ylim([0,60])

%%

% FFT

load FFT.mat
disp = AngularDisp(PLab2Proc2fft(:,2))
figure(11)
p = plot(PLab2Proc2fft(:,1),PLab2Proc2fft(:,2))
p(1).LineWidth = 2
xlim([0 20])
ylabel('Amplitude (mV)')
xlabel('Frequency (Hz)')
title('FFT Spectrum for Standard 45° Saccade')