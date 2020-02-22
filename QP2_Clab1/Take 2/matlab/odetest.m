function odetest

V=-90:5:40;
m0=findsteadystatem(-90);
j0=findsteadystatej(-90);
h0=findsteadystateh(-90);

for i=1:length(V)
    [t,ym]=ode45(@derivm,[0 10],[m0],[],V(i));
    [t,yj]=ode45(@derivj,[0 10],[j0],[],V(i));
    [t,yh]=ode45(@derivh,[0 10],[h0],[],V(i));
    m=ym(:,1); 
    j=yj(:,1);
    h=yh(:,1);
    gNa(i)=max(m.^3*j*h);
end

figure
plot(V,gNa/max(gNa),'-x');
hold on
clear gNa;
V=-100:5:-10;
for i=1:length(V)
    [t,ym]=ode45(@derivm,[0 100],[m0],[],V(i));
    [t,yj]=ode45(@derivj,[0 100],[j0],[],V(i));
    [t,yh]=ode45(@derivh,[0 100],[h0],[],V(i))
    
    [t,ym]=ode45(@derivm,[0 10],ym(length(ym),:),[],-10);
    [t,yj]=ode45(@derivj,[0 10],yj(length(yj),:),[],-10);
    [t,yh]=ode45(@derivh,[0 10],yh(length(yh),:),[],-10);
    m=ym(:,1); 
    j=yj(:,1);
    h=yh(:,1);
    gNa(i)=max(m.^3*j*h);
end
plot(V,gNa/max(gNa),'-o')
xlabel('V (mV)')
legend ('Na Normalized g-V','Na Inactivation')



function ypm=derivm(t,y,V)
m=y(1);
minf = 1 / ((1 + exp( -(56.86 + V) / 9.03 ))^2);
taum = 0.1292 * exp(-((V+45.79)/15.54)^2) + 0.06487 * exp(-((V-4.823)/51.12)^2);
dmdt=(minf - m) / taum;
ypm(1)=dmdt;
ypm=ypm';

function yph=derivh(t,y,V)
h=y(1);
[ah,bh]=ratesh(V);
tauh = 1 / (ah + bh);
hinf = 1 / ((1 + exp( (V + 71.55)/7.43 ))^2);
dhdt= (hinf - h) / tauh;
yph(1)=dhdt;
yph=yph';

function ypj=derivj(t,y,V)
j=y(1);
[aj,bj]=ratesj(V);
tauj = 1 / (aj + bj);
jinf = 1 / ((1 + exp( (V + 71.55)/7.43 ))^2);
djdt=(jinf - j) / tauj;
ypj(1)=djdt;
ypj=ypj';


function [ah,bh]=ratesh(V)

ah =(V >= -40) * (0)...
    + (V < -40) * (0.057 * exp( -(V + 80) / 6.8 ));
bh= (V >= -40) * (0.77 / (0.13*(1 + exp( -(V + 10.66) / 11.1 )))) ...
    + (V < -40) * ((2.7 * exp( 0.079 * V) + 3.1*10^5 * exp(0.3485 * V)));

function [hinf]=findsteadystateh(V)

[ah, bh]=ratesh(V);  % Compute rates at V
hinf = 1 / ((1 + exp( (V + 71.55 + 6)/7.43 ))^2);    % Find j-infinity


function [aj,bj]=ratesj(V)

aj= (V >= -40) * (0) ...
    +(V < -40) * (((-2.5428 * 10^4*exp(0.2444*V) - 6.948*10^-6 * exp(-0.04391*V)) * (V + 37.78)) / ...
    (1 + exp( 0.311 * (V + 79.23) )));

bj = (V >= -40) * ((0.6 * exp( 0.057 * V)) / (1 + exp( -0.1 * (V + 32) ))) ...
    + (V < -40) * ((0.02424 * exp( -0.01052 * V )) / (1 + exp( -0.1378 * (V + 40.14) )));

function [jinf]=findsteadystatej(V)

[aj, bj]=ratesj(V);  % Compute rates at V
jinf = 1 / ((1 + exp( (V + 71.55)/7.43 ))^2);    % Find j-infinity


% function [am,bm]=ratesm(V)
% 
% am=0.32*(V+47.13)/(1-exp(-0.1*(V+47.13)));
% bm=0.08*exp(-V/11);

function [minf]=findsteadystatem(V)
minf=1 / ((1 + exp( -(56.86 + V) / 9.03 ))^2);    % Find m-infinity