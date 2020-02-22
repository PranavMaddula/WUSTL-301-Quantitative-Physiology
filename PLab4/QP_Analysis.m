clear all; close all;

load('AQ1.mat')

figure;
yyaxis left
p2 = plot(QPPL4data(:,1),QPPL4data(:,2))
yyaxis right
y = QPPL4data(:,3);
y(y<0) = 0;
y(y>1) = 1;
p1 = plot(QPPL4data(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3

%%
clear all; 

load('AQ1_2.mat')

figure;
yyaxis left
p2 = plot(QPPL4datatrain(:,1),QPPL4datatrain(:,2))
yyaxis right
y = QPPL4datatrain(:,3);
y(y<0) = 0;
y(y>1) = 1;
p1 = plot(QPPL4datatrain(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3
yyaxis left
title('Sample Raw Data from 500-Millisecond ISI from Benzaldehyde')
legend('Response','Stimulus')
xlabel('Time (Seconds)')
ylabel('Magnitude (mV)')
yyaxis right
ylabel('Stimulus')


x = filtfilt(ones(1,200)/200,1,QPPL4datatrain(:,2)); 
figure;
yyaxis left
p2 = plot(QPPL4datatrain(:,1),x)
yyaxis right
p1 = plot(QPPL4datatrain(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3

%%
clear all;

yb = [.8919,.6249,.5153,.443] %Blue avg Cyc height
x = [.5,1,2,4]                %ISI time
yp = [1.0707,.8441,.6851,.6107]% Pink Avg Cyc Height

figure;
p = plot(x,yb,'-o')
hold on
p1 = plot(x,yp,'-o')
p.LineWidth = 1.5
p1.LineWidth = 1.5

title('Mean Amplitude for Hexanol & Benzaldehyde, varying ISI')
legend('Hexanol','Benzaldehyde')
xlabel('Frequency (Hz)')
ylabel('Mean Amplitude (mV)')


%%
% clear all; close all;
% load('AQ4.mat');
% 
% x = QPPL4dataPM(:,2);
% y = QPPL4dataPM(:,3);
% y(y<0) = 0;
% y(y>0) = 1;
% 
% 
% %response = x;
% %stimuilus = y;
% x = filtfilt(ones(1,200)/200,1,x); 
% for i = 1:1:length(x)-4999
% response(i,:) = x(i : 4999 + i);
% end
% 
% 
% data = QPPL4dataPM;
% data(isnan(data))=1;
% 
% y = data(:,3);
% y(y<0) = 0;
% y(y>0) = 1;
% 
% figure; p = plot(data(:,1),y);
% p.LineWidth = 2
% ylim([-3 3])
% 
% 
% Response = response(1:end-7081,:);
% Stimuilus = y(1:length(Response));
% 
% k = pinv(Response)*Stimuilus;



%%
clear all;
load('AQ4.mat');

QPPL4dataPM(isnan(QPPL4dataPM))=1;

y = QPPL4dataPM(:,2);
x = QPPL4dataPM(:,3);
x(x<0) = 0;
x(x>0) = 1;


%response = x;
%stimuilus = y;
y = filtfilt(ones(1,200)/200,1,y); 
for i = 1:1:length(x)-4999
response(i,:) = x(i : 4999 + i);
end

A = response ;
N = 0;
B = ones(length(response),1);
response = [A(:,1:N) B A(:,N+1:end)];

Response = response(1:end,:);
Stimuilus = y(1:length(Response));

k = pinv(Response)*Stimuilus;

figure;
tmp = Response*k;
plot(tmp)
hold on
plot(Stimuilus);

%%

signal = y;

figure; 
plot(response*k); 
hold on; plot(signal)
%%
clear all; close all;
load('calid.mat')

x = Valid(:,3);
x(x<0) = 0;
x(x>0) = 1;

x(isnan(x))=1;

y = Valid(:,2);
z = Valid(:,1);

x = downsample(x,10);
y = downsample(y,10);
z = downsample(z,10);

% for i = 1:1:length(x)-4999
% stim(i,:) = x(i : 4999 + i);
% end



for i = 1:1:length(x)-499
stim(i,:) = x(i : 499 + i);
end

A = stim;
[m,N] = size(A)
B = ones(length(stim),1);
stim = [A(:,1:N) B A(:,N+1:end)];

resp = Valid(:,2);
resp = resp(1:length(stim));

k = pinv(stim)*resp;

tmp = stim*k;

figure;
plot(tmp)
hold on
plot(resp);


%%

signal = Valid(:,2);

figure; 
plot(response*k); 
hold on; plot(signal)





%%

clear all; close all;

load('calid.mat');
t = Valid(:,1);
r = Valid(:,2);
s = Valid(:,3);


s(s<0) = 0;
s(s>0) = 1;

s(isnan(s))=1;


r_filt = filtfilt(ones(1,200)/200,1,r); 
r_shift = r_filt - min(r_filt);
%r_shift = r_filt;
% t_down = downsample(t,10);
% r_down = downsample(r_shift,10);
% s_down = downsample(s,10);

t_down = t;
r_down = r_shift;
s_down = s;
org = length(s_down)
for i = 1:5000
    s_down(org+i) = 0;    
    r_down(org+i)=0;
end


%rep = zeros(length(s_down)-499,1);
rep = zeros(length(s_down)-4999,1);
% for i = 1:1:length(s_down)-499
% stim(i,:) = s_down(i : 499 + i);
% rep(i) = r_down(i+499);
% end

for i = 1:1:length(s_down)-4999
stim(i,:) = s_down(i : 4999 + i);
rep(i) = r_down(i+4999);
end

A = stim;
[m,N] = size(A);
B = ones(length(stim),1);
stim = [A(:,1:N) B A(:,N+1:end)];

%resp = r_down(500:1:length(stim)+499);

%k1 = pinv(stim)*resp;
k2 = pinv(stim)*rep;
predicted = stim*k2;
%%

x = 5/5001
time = -5:x:0
time = time(1:end-1)
figure; plot(time,k2)
title('Linear Input-Output Filter')
%legend('Response','Stimulus')
xlabel('Time (seconds)')
%ylabel('Magnitude (mV)')
xlim([-5 .1]);


predicted = predicted(1:length(t));
rep = rep(1:length(t))

figure;
plot(t,predicted)
hold on
plot(t,rep);
title('Linear Input-Output Filter')
legend('Predicted','Actual')
xlabel('Time (seconds)')
ylabel('Magnitude (mV)')
xlim([0 11.2]);

%%
% clear all; close all;
% 
% load('Train.mat');
% 
% figure; plot(Valid(:,1),Valid(:,2));
% 
% t = Valid(:,1);
% r = Valid(:,2);
% s = Valid(:,3);
% 
% 
% s(s<0) = 0;
% s(s>0) = 1;
% 
% s(isnan(s))=1;
% 
% 
% r_filt = filtfilt(ones(1,200)/200,1,r); 
% r_shift = r_filt - min(r_filt);
% t_down = downsample(t,10);
% r_down = downsample(r_shift,10);
% s_down = downsample(s,10);
% 
% % t_down = t;
% % r_down = r_shift;
% % s_down = s;
% 
% 
% for i = 1:1:length(s_down)-499
% stim(i,:) = s_down(i : 499 + i);
% end
% 
% % for i = 1:1:length(s_down)-4999
% % stim(i,:) = s_down(i : 4999 + i);
% % end
% 
% A = stim;
% [m,N] = size(A);
% B = ones(length(stim),1);
% stim = [A(:,1:N) B A(:,N+1:end)];
% 
% resp = r_down(1:length(stim));
% figure; plot(resp)
% 
% k = pinv(stim)*resp;
% predicted = stim*k;
% 
% 
% figure;
% plot(predicted)
% hold on
% plot(resp);

%%

load('1.mat');

stimTrain = stim(1:end*.5,:);
stimTest = stim(end*.5:end,:);
repTrain = rep(1:end*.5);
repTest = rep(end*.5:end);

k = pinv(stimTrain)*repTrain;
predicted = stimTrain*k;
figure;
plot(predicted); hold on; plot(repTrain)
valid = stimTest*k;
figure;
plot(valid); hold on; plot(repTest)



%%
clear all;

load('Plot1.mat')

x = filtfilt(ones(1,200)/200,1,P2ISI(:,2)); 

y = P2ISI(:,3);
y(y<0) = 0;
y(y>1) = 1;

figure;
yyaxis left
p2 = plot(P2ISI(:,1),x)
yyaxis right
p1 = plot(P2ISI(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3
yyaxis left
title('Stimilus vs. Response for 2-Second ISI')
legend('Response','Stimulus')
xlabel('Time (seconds)')
ylabel('Magnitude (mV)')
yyaxis right
ylabel('Stimulus')

x = filtfilt(ones(1,200)/200,1,P1ISI(:,2)); 

y = P1ISI(:,3);
y(y<0) = 0;
y(y>1) = 1;

figure;
yyaxis left
p2 = plot(P1ISI(:,1),x)
yyaxis right
p1 = plot(P1ISI(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3
yyaxis left
title('Stimilus vs. Response for 1-Second ISI')
legend('Response','Stimulus')
xlabel('Time (seconds)')
ylabel('Magnitude (mV)')
yyaxis right
ylabel('Stimulus')


x = filtfilt(ones(1,200)/200,1,P500ISI(:,2)); 

y = P500ISI(:,3);
y(y<0) = 0;
y(y>1) = 1;

figure;
yyaxis left
p2 = plot(P500ISI(:,1),x)
yyaxis right
p1 = plot(P500ISI(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3
yyaxis left
title('Stimilus vs. Response for 500-Millisecond ISI')
legend('Response','Stimulus')
xlabel('Time (seconds)')
ylabel('Magnitude (mV)')
yyaxis right
ylabel('Stimulus')

x = filtfilt(ones(1,200)/200,1,P250ISI(:,2)); 

y = P250ISI(:,3);
y(y<0) = 0;
y(y>1) = 1;

figure;
yyaxis left
p2 = plot(P250ISI(:,1),x)
yyaxis right
p1 = plot(P250ISI(:,1),y)
ylim([-.1 5])
set(gca,'YTick', [])
p1.LineWidth = 1.3
yyaxis left
title('Stimilus vs. Response for 250-Millisecond ISI')
legend('Response','Stimulus')
xlabel('Time (seconds)')
ylabel('Magnitude (mV)')
yyaxis right
ylabel('Stimulus')

