function odetest_3
%dm, dh, dj
V = -100:2:40;
%we hold voltage at -120 to find m 
m0 = findsteadystatem(-120);
h0 = findsteadystateh(-120);
j0 = findsteadystatej(-120);

%% part b #3
 % x axis is interpulse interval on log scale
 % y axis is p2/p1 (pulse 2/pulse 1) 
 timeinterval = logspace(0,3,15);
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
semilogx(timeinterval, P2./P1)
title('Sodium (Na^+) Recovery From Inactivation')
ylabel('Sodium Conductance Ratio (P2/P1)')
xlabel('Interpulse Interval (ms)')

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