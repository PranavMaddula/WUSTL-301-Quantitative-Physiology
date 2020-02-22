%all we need to do are put in h and j and then find the right equatiosn 
%problem 3 

%Model_torord 555
% Ca concentration in model Runner

function odetest_2
%dm, dh, dj
V = -100:2:40;
%we hold voltage at -120 to find m 
m0 = findsteadystatem(-120);
h0 = findsteadystateh(-120);
j0 = findsteadystatej(-120);
%ode for m
for i = 1:length(V);
[t,y] = ode45(@derivm, [0,10],[m0],[],V(i)); %want to solve for -90 first
m = y(:,1); %rows then columns 
msteady(i) = max(m.^3);
end

%plot(V,msteady);

%ode for h
%ones that are only to 10 are steady state
for i = 1:length(V);
[t,y] = ode45(@derivh, [0,10],[h0],[],V(i)); %want to solve for -90 first
h = y(:,1); %rows then columns s
hsteady(i) = max(h);
end

%ode for j
for i = 1:length(V);
[t,y] = ode45(@derivj, [0,10],[j0],[],V(i)); %want to solve for -90 first
j = y(:,1); %rows then columns 
jsteady(i) = max(j);
gNa(i) = max(m.^3);
end

figure()
plot(V,gNa/max(gNa));
%plot(V, msteadygNa/max(msteady),'r')
%plot(j)

%clear msteady; clear hsteady; clear jsteady;
%V = -100:10:-10;


%% PLOT SODIUM
R=8314.0;
nai= 12;
nao= 140;
F=96485.0;
T=310.0;
ENa=(R*T/F)*log(nao/nai);


for i = 1:length(V);
    [t,y] = ode45(@derivm,[0 100], [m0], [], V(i)); %100 ms 0 to 100
    %now we need a test pulse as we iterate through holding pulses
    [t,y] = ode45(@derivm, [0 10],y(length(y),:),[],-10); % we want y at the end of the induciton
    m = y(:,1);
    mgNa(i) = max(m.^3);
end 

for i = 1:length(V);
    [t,y] = ode45(@derivh,[0 100], [h0], [], V(i)); %100 ms 0 to 100
    %now we need a test pulse as we iterate through holding pulses
    [t,y] = ode45(@derivh, [0 10],y(length(y),:),[],-10); % we want y at the end of the induciton
   %[t,y] = ode45(@deriv, [0 10],y(length(y),:,[],V(i)));
    h = y(:,1);
    hgNa(i) = max(h);
end 

for i = 1:length(V);
    [t,y] = ode45(@derivj,[0 100], [j0], [], V(i)); %100 ms 0 to 100
    %now we need a test pulse as we iterate through holding pulses
    [t,y] = ode45(@derivj, [0 10],y(length(y),:),[],-10); % we want y at the end of the induciton
    
    j = y(:,1);
    jgNa(i) = max(j);
end 

figure (1)
hold on 
plot(V, mgNa./max(mgNa), 'r-o');
%plot(V,hgNa./max(hgNa), 'g-x');
%plot(V,jgNa./max(jgNa),'b-o');

plot(V, msteady/max(msteady),'-o')
%plot(V, hsteady/max(hsteady),'-x')
%plot(V, jsteady/max(jsteady),'-o')
legend('activation','inactivation')
%legend('mgNa','hgNa','jgNa','msteady','hsteady','jsteady')
title('IV & GV Curve for Sodium')
xlabel('Voltage (mV)')
%ylabel('
hold off

figure(2)
hold on
totalCurrentsteady = ((msteady./max(msteady)).^3).*(hsteady./max(hsteady)).*(jsteady./max(jsteady));
totalCurrent = ((mgNa./max(mgNa)).^3).*(hgNa./max(hgNa)).*(jgNa./max(jgNa));
plot(V, totalCurrent,'x-');
plot(V, totalCurrentsteady,'o-')
%steady state is activation 
totalCurrentsteady1 = ((msteady./max(msteady)).^3).*(jsteady./max(jsteady));
totalCurrent1 = ((mgNa./max(mgNa)).^3).*(jgNa./max(jgNa));
plot(V, totalCurrent1,'*-');
plot(V, totalCurrentsteady1,'s-');
% conductance 
totalCurrentsteady2 = ((msteady./max(msteady)).^3).*(hsteady./max(hsteady));
totalCurrent2 = ((mgNa./max(mgNa)).^3).*(hgNa./max(hgNa));
plot(V, totalCurrent2,'v-');
plot(V, totalCurrentsteady2,'+-');
%IV GV Curve for sodium
%plot(V, totalCurrentsteady,'s-b');
title('Inactivation & G-V Curve for Sodium')
xlabel('Voltage (mV)')
legend('Na Activation All Gates','Na Inactivation All Gates', 'Na Activation no h', 'Na Inactivation no h', 'Na Activation no j', 'Na Inactivation no j');
ylabel('Probability of Channels Opening')
ylim([-0.05 1.05])
hold off


 %% part b #3
 % x axis is interpulse interval on log scale
 % y axis is p2/p1 (pulse 2/pulse 1) 
 timeinterval = logspace(0,3,25);
 for i = 1:length(timeinterval);
 % setup
 [t,ym] = ode45(@derivm,[0 100], [m0], [], -120);
 [t, yh] = ode45(@derivh, [0 100], [h0],[],-120);
 [t,yj] = ode45(@derivj, [0 100], [j0] , [], -120);
 
 %pulse 1 
 [t,ym] = ode45(@derivm,[0 500], [ym(length(ym),:)], [], -20);
 [t, yh] = ode45(@derivh, [0 500], [yh(length(yh),:)],[],-20);
 [t,yj] = ode45(@derivj, [0 500], [yj(length(yj),:)] , [], -20);
 
 m = ym(:,1);
 h = yh(:,1);
 j = yj(:,1);
 
 maxm(i) = max(m.^3);
 maxh(i) = max(h);
 maxj(i) = max(j);
 
 %interval
 [t,ym] = ode45(@derivm,[0 timeinterval(i)], [ym(length(ym),:)], [], -120);
 [t, yh] = ode45(@derivh, [0 timeinterval(i)], [yh(length(yh),:)],[],-120);
 [t,yj] = ode45(@derivj, [0 timeinterval(i)], [yj(length(yj),:)] , [], -120);
 
 %pulse 2
 [t,ym] = ode45(@derivm,[0 30], [ym(length(ym),:)], [], -20);
 [t, yh] = ode45(@derivh, [0 30], [yh(length(yh),:)],[],-20);
 [t,yj] = ode45(@derivj, [0 30], [yj(length(yj),:)] , [], -20);
 
 m = ym(:,1);
 h = yh(:,1);
 j = yj(:,1);
 
 maxm2(i) = max(m.^3);
 maxh2(i) = max(h);
 maxj2(i) = max(j);
 end
 
 P1 = ((maxm/(max(maxm)).^3).*(maxh/max(maxh)).*(maxj/max(maxj)));
 P2 = ((maxm2/max(maxm2)).^3).*(maxh2/max(maxh2)).*(maxj2/max(maxj2));
 
figure(4)
semilogx(timeinterval, P2./P1, '-o')
title('Sodium (Na^+) Recovery From Inactivation')
ylabel('Sodium Conductance Ratio (P2/P1)')
xlabel('Interpulse Interval (ms)')
x=3

%m derivative
function ypm=derivm(t,y,V); %y prime equals function of yada yada
[minf] =  findsteadystatem(V);
[am,bm, taum] = ratesm(V);
m = y(1);
%[am, bm, taum] = ratesm(V);
dmdt = (minf-m)./taum;
ypm(1) = dmdt;
ypm = ypm';

% h derivative
function yph = derivh(t,y,V);
[hinf] = findsteadystateh(V);
[ah, bh, tauh] = ratesh(V);
h = y(1);
%[ah, bh, tauh] = ratesh(V);
dhdt = (hinf-h)./tauh;
yph(1) = dhdt;
yph = yph';

%j derivative 
function ypj = derivj(t,y,V);
    [jinf] = findsteadystatej(V);
    j = y(1);
    [aj, bj, tauj] = ratesj(V);
    djdt = (jinf-j)./tauj;
    ypj(1) = djdt;
    ypj = ypj';
        

function [minf] =  findsteadystatem(V)
%[am, bm] = ratesm(V); %compute rates at V
minf = 1/((1+exp(-((56.86+V)/9.03))^2)); %this is the minfinity value
%we are using ode 45
%example [t,y] state variables go into y = ode45(@vdp1, [0, 20],[2,0])

        
function [jinf] = findsteadystatej(V);
 % [aj, bj] = ratesj(V);
  jinf = 1/((1+exp((V+71.55)/7.43))^2);


function[am,bm, taum] = ratesm(V);

am = 0;
bm = 0;
taum = 0.1292*exp(-((V+45.79)/15.54)^2)+0.06487*exp((-(V-4.823)/51.12)^2);

% h values 
function [ah, bh, tauh] = ratesh(V);
   if V<-40
    ah = 0.057*exp(-(V+80)/6.8);
    bh = (2.7*exp(0.079*V))+3.1*10^5*exp(0.3485*V);
   tauh = 1/(ah+bh);
   else
    ah = 0;
    bh = (0.77/(0.13*(1+exp(-1*(V+10.66)/11.1))));
    tauh = 1/(ah+bh);
   end

 
    
function [hinf] = findsteadystateh(V);
    %[ah, bh] = ratesh(V);
    hinf = 1/(1+exp((V+71.55)/7.43)^2);
        
 % j values 
 function [aj , bj, tauj] = ratesj(V);
     
    if V<-40
            aj = (-2.5428*10^4*exp(0.2444*V)-6.948*10^(-6)*exp(-0.04391*V)*(V+37.78))/(1+exp(0.311*(V+79.23)));
            bj = (0.02424*exp(-0.01052*V))/(1+exp(-0.1378*(V+40.14)));
    tauj = 1/(aj+bj);
    else
        aj = 0;
        bj = (0.6*exp(0.057*V)/(1+exp(-.1*(V+32))));
 tauj = 1/(aj+bj);
    end
    
    
    
% function total=derivm(t,y,V); %y prime equals function of yada yada
% [minf] =  findsteadystatem(V);
% [am,bm, taum] = ratesm(V);
% m = y(1);
% %[am, bm, taum] = ratesm(V);
% dmdt = (minf-m)./taum;
% ypm(1) = dmdt;
% ypm = ypm';